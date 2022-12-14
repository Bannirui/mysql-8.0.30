
#ifndef CONNECTION_POOL_PLUGIN_EXPORT_H
#define CONNECTION_POOL_PLUGIN_EXPORT_H

#ifdef CONNECTION_POOL_PLUGIN_STATIC_DEFINE
#  define CONNECTION_POOL_PLUGIN_EXPORT
#  define CONNECTION_POOL_PLUGIN_NO_EXPORT
#else
#  ifndef CONNECTION_POOL_PLUGIN_EXPORT
#    ifdef connection_pool_plugin_EXPORTS
        /* We are building this library */
#      define CONNECTION_POOL_PLUGIN_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define CONNECTION_POOL_PLUGIN_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef CONNECTION_POOL_PLUGIN_NO_EXPORT
#    define CONNECTION_POOL_PLUGIN_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef CONNECTION_POOL_PLUGIN_DEPRECATED
#  define CONNECTION_POOL_PLUGIN_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef CONNECTION_POOL_PLUGIN_DEPRECATED_EXPORT
#  define CONNECTION_POOL_PLUGIN_DEPRECATED_EXPORT CONNECTION_POOL_PLUGIN_EXPORT CONNECTION_POOL_PLUGIN_DEPRECATED
#endif

#ifndef CONNECTION_POOL_PLUGIN_DEPRECATED_NO_EXPORT
#  define CONNECTION_POOL_PLUGIN_DEPRECATED_NO_EXPORT CONNECTION_POOL_PLUGIN_NO_EXPORT CONNECTION_POOL_PLUGIN_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef CONNECTION_POOL_PLUGIN_NO_DEPRECATED
#    define CONNECTION_POOL_PLUGIN_NO_DEPRECATED
#  endif
#endif

#endif /* CONNECTION_POOL_PLUGIN_EXPORT_H */
