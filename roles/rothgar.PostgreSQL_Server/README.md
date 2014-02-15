PostgreSQL Server
========

Deploys a postgresql server to the desired hosts

Requirements
------------

none

Role Variables
--------------

set postgresql_server in vars/main.yml to your desired version. Default is 9.3.

Will add the required repo and server version for any supported repo listed here http://yum.postgresql.org/repopackages.php

Dependencies
------------

Currently only works with EL distributions

License
-------

BSD

Author Information
------------------

Justin Garrison
@rothgar
justingarrison.com
