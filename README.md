lebedevdsl.carbonapi
=========

Installs and configures carbonapi daemon

Requirements
------------

None

Role Variables
--------------

Name | type | default | description
---|---|---|---
carbonapi_package | string | "carbonapi" | name of the package
carbonapi_config | string | "/etc/carbonapi/carbonapi.yaml" | configuration location
carbonapi_zipper_url | string | 'http://localhost:8088' | Carbonzipper URL
carbonapi_listen: | string | 'localhost:8082' | Interfaces and ports to listen on
carbonapi_concurency | int | 20 | Maximum thread concurency
carbonapi_cache_type | string | 'mem' | Types: mem, memcache, none. Where to store cache
carbonapi_cache_size_mb | int | 0 | Cache size in MB, 0 - unlimited
carbonapi_cpus_limit | int | 0 | Maximum cpu cores in use
carbonapi_send_globals_as_is | string | 'false' | Globs expansion
carbonapi_graphite_host | string | 'localhost:2003' | Metrics storage
carbonapi_graphite_interval | string | '60s' | Metrics push interval
carbonapi_graphite_prefix | string | 'carbon.api' | Prefix for internal metrics
carbonapi_idle_connections | int | 10 | Maximum idle connections
carbonapi_pidfile | string | '' | pidfile location
carbonapi_logger | list of objects | [{ name: "", file: "/var/log/carbon/carbonapi.log", level: "debug", encoding: "json"}] | Loggers definition

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: lebedevdsl.carbonapi, become:yes }
