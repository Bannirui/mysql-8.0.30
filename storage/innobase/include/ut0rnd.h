/*****************************************************************************

Copyright (c) 1994, 2022, Oracle and/or its affiliates.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License, version 2.0, as published by the
Free Software Foundation.

This program is also distributed with certain software (including but not
limited to OpenSSL) that is licensed under separate terms, as designated in a
particular file or component or in included license documentation. The authors
of MySQL hereby grant you an additional permission to link the program and
your derivative works with the separately licensed software that they have
included with MySQL.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License, version 2.0,
for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA

*****************************************************************************/

/** @file include/ut0rnd.h
 Random numbers and hashing

 Created 1/20/1994 Heikki Tuuri
 ***********************************************************************/

#ifndef ut0rnd_h
#define ut0rnd_h

#include <atomic>
#include <cstdint>

#include "univ.i"
#include "ut0byte.h"
#include "ut0math.h"

#include "ut0class_life_cycle.h"
#include "ut0crc32.h"
#include "ut0seq_lock.h"

namespace ut {
namespace detail {

/* These are three randomly generated 64bit values, with additional constraint
that a1 and a2 must be odd. These are used to perform hashing using algorithm
described on https://sortingsearching.com/2020/05/21/hashing.html */

constexpr uint64_t fast_hash_coeff_a1_64bit = 0xacb1f3526e25dd39;
constexpr uint64_t fast_hash_coeff_a2_64bit = 0xd65b9175b5247ba3;
constexpr uint64_t fast_hash_coeff_b_64bit = 0xf72a876a516b4b56;

}  // namespace detail

/** The following function generates pseudo-random 64bit integers which
enumerate the value space generated by a linear congruence. This is very similar
to what can be achieved with std::linear_congruential_engine<uint64_t, ...>. If
you need reliably good pseudo-random numbers for some reason, please consider
using std::mersenne_twister_engine<>.
@return a pseudo-random number */
[[nodiscard]] static inline uint64_t random_64();

/** Generates a pseudo-random integer from a given interval.
@param[in]      low     low limit; can generate also this value
@param[in]      high    high limit; can generate also this value
@return the pseudo-random number within the [low, high] two-side inclusive range
*/
[[nodiscard]] static inline uint64_t random_from_interval(uint64_t low,
                                                          uint64_t high);

/** Hashes a 64-bit integer.
@param[in]	value	64-bit integer
@return hashed value */
[[nodiscard]] static inline uint64_t hash_uint64(uint64_t value);

/** Hashes a character string ending in the null character.
 @return hashed value */
[[nodiscard]] static inline uint64_t hash_string(const char *str);

/** Hashes a pair of 64bit integers.
@param[in]	n1	first 64bit integer
@param[in]	n2	second 64bit integer
@return hashed value */
[[nodiscard]] static inline uint64_t hash_uint64_pair(uint64_t n1, uint64_t n2);
/** Hashes a binary buffer of given length.
@param[in]	buf		buffer of bytes
@param[in]	len		length
@param[in]  seed  seed to be used in calculation. Can be previous value.
@return hashed value */
[[nodiscard]] static inline uint64_t hash_binary(
    const byte *buf, size_t len,
    uint64_t seed = detail::fast_hash_coeff_a1_64bit);

/** Hashes a binary buffer of given length in the old innobase way. This is
highly inefficient, don't use outside areas that require backward compatibility
on data written to disk.
@param[in]	str		buffer of bytes
@param[in]	len		length
@return hashed value */
[[nodiscard]] static inline uint32_t hash_binary_ib(const byte *str,
                                                    size_t len);

namespace detail {
/** Seed value of ut::random_64() */
extern thread_local uint64_t random_seed;

/** A helper method, it is used by hash_binary_ib for backward compatibility.
NOTE: Do not use this method, it produces results that are not hashed well.
Especially for sequences of pairs of <i+n, j+n> over n. */
constexpr uint32_t hash_uint32_pair_ib(uint32_t n1, uint32_t n2) {
  constexpr uint32_t HASH_RANDOM_MASK = 1463735687;
  constexpr uint32_t HASH_RANDOM_MASK2 = 1653893711;

  return ((((n1 ^ n2 ^ HASH_RANDOM_MASK2) << 8) + n1) ^ HASH_RANDOM_MASK) + n2;
}

/* Helper methods to read unaligned little-endian integers. These should be
optimized to just simple, single reads on little-endian architecture like x86
and x64. It may be different for SPARC (and in particular read_from_8(&some_u64)
is not equal to some_u64's value. On SPARC the unaligned reads are prohibited,
so for buffer that is not known to be aligned we will read data byte by byte.
Note that the following methods and usages similar to what we do in
hash_binary() could be applied to crc32 algorithm calculations and an early
investigation showed 10-50% improvement in CRC32 speed for buffer lengths <=
500. However, there was a lot of effort put into crc32 implementation to make
sure it is efficient and generates correct, simple assembly for x64, ARM (and M1
CPU) and other architectures. So in order to incorporate these ideas into CRC32
a lot of testing is required to be performed again, with care. */

static inline int64_t read_from_1(const byte *addr) { return *addr; }
static inline int64_t read_from_2(const byte *addr) {
  return read_from_1(addr) | (read_from_1(addr + 1) << 8);
}
static inline int64_t read_from_4(const byte *addr) {
  return read_from_2(addr) | (read_from_2(addr + 2) << 16);
}
static inline int64_t read_from_8(const byte *addr) {
  return read_from_4(addr) | (read_from_4(addr + 4) << 32);
}

/** Calculates 64bit hash from two 64bit inputs. It is quite fast, but the
quality of outputs is not best. The lower bits, the worse is their distribution.
*/
constexpr uint64_t hash_uint64_pair_fast(uint64_t n1, uint64_t n2) {
  /* The following algorithm is very simple, yet proven to be quite good, that
  is it is proven that for two different arguments it will yield different
  results with 2^(-64) probability. This is based on algorithm for h3 function
  for n=2, described on https://sortingsearching.com/2020/05/21/hashing.html
  (which in turn references Ph.D. thesis of Philipp Wolfel. It does not
  necessarily yield good distribution when consecutive integers are supplied as
  inputs, especially if the results are taken modulo small numbers like 8 or 11.
  */
  return (detail::fast_hash_coeff_a1_64bit + n1) *
             (detail::fast_hash_coeff_a2_64bit + n2) +
         detail::fast_hash_coeff_b_64bit;
}

/** Table for Tabulation Hashing, precomputed hash values for all byte values.
The table could be for different amount of bits per chunk than 8, but 8 seems to
yield faster hash calculation than 4 or 16bits - 4bits require 16 XOR operations
and sets of bit manipulations, while 16bit require bigger tables that slow down
caches. The indexes are set such that hash values for a specific byte value are
stored in the same cache line (8 values * 8 bytes = 64B). This way it should be
much faster and less demanding on CPU caches to calculate results for small
integers (where most bytes are 0). */
extern std::array<std::array<uint64_t, 8>, 256> tab_hash_lookup_table;

}  // namespace detail

static inline uint64_t random_64() {
  return hash_uint64(detail::random_seed++);
}

static inline uint64_t random_from_interval(uint64_t low, uint64_t high) {
  ut_ad(high >= low);

  return low + (random_64() % (high - low + 1));
}

static inline uint64_t hash_uint64(uint64_t value) {
  /* This implements Tabulation Hashing. It is a simple yet effective algorithm
  that easily passes the unit tests that check distributions of hash values
  modulo different numbers. Other techniques like one from hash_uint64_pair_fast
  or extended 4-universal version did have some problems for specific modulo
  numbers or have been providing 61bit hashes. */
  uint64_t res = 0;
  for (size_t i = 0; i < sizeof(uint64_t); ++i) {
    res ^= detail::tab_hash_lookup_table[(value >> (i * 8)) & 0xFF][i];
  }
  return res;
}

static inline uint64_t hash_uint64_pair(uint64_t n1, uint64_t n2) {
  return hash_uint64(detail::hash_uint64_pair_fast(n1, n2));
}

static inline uint64_t hash_string(const char *str) {
  return hash_binary(reinterpret_cast<const byte *>(str), strlen(str));
}

static inline uint64_t hash_binary(const byte *str, size_t len, uint64_t seed) {
  /* Our implementation is slower than CRC32 while the CRC32 implementation is
  super fast, especially for higher lengths as it leverages 3-fold parallelism
  on CPU core pipeline level. */
  if (len >= 15) {
    /* The CRC32 is returning only 32bits of hash. We take out the first 8 bytes
    to seed our 64bit hash just like we do when CRC32 is not used. */
    const auto h = hash_uint64_pair(seed, detail::read_from_8(str));
    return hash_uint64_pair(h, ut_crc32(str + 8, len - 8));
  }

  /* The following algorithm is based on idea of applying hash_uint64_pair for
  64bit blocks of data. If there are less than 8 bytes remaining, we hash
  remaining 4, 2 and 1 bytes for all input bytes have influence on result hash.
  */

  uint64_t h = seed;
  size_t i = 0;
  if (len & 8) {
    h = hash_uint64_pair(h, detail::read_from_8(str + i));
    i += 8;
  }
  uint64_t last_part = 0;
  if ((len & 7) == 0) {
    return h;
  }
  if (len & 4) {
    last_part |= detail::read_from_4(str + i) << (16 + 8);
    i += 4;
  }
  if (len & 2) {
    last_part |= detail::read_from_2(str + i) << 8;
    i += 2;
  }
  if (len & 1) {
    last_part |= detail::read_from_1(str + i);
    i += 1;
  }
  ut_ad(i == len);
  return hash_uint64_pair(h, last_part);
}

static inline uint32_t hash_binary_ib(const byte *str, size_t len) {
  uint32_t hash_value = 0;
  const byte *str_end = str + (len & 0xFFFFFFF8);

  ut_ad(str || !len);

  while (str < str_end) {
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
    hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
  }

  switch (len & 0x7) {
    case 7:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
      [[fallthrough]];
    case 6:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
      [[fallthrough]];
    case 5:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
      [[fallthrough]];
    case 4:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
      [[fallthrough]];
    case 3:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
      [[fallthrough]];
    case 2:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
      [[fallthrough]];
    case 1:
      hash_value = detail::hash_uint32_pair_ib(hash_value, *str++);
  }

  return (hash_value);
}
}  // namespace ut

#endif
