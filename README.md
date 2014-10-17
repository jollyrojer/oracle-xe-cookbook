Oracle Database XE
=====

Version 1.0-33p
-------------

![](http://www.oracle.com/ocom/groups/public/@otn/documents/digitalasset/123455.gif)

Installs and configures Oracle Database 11g XE.

[![Install](https://raw.github.com/qubell-bazaar/component-skeleton/master/img/install.png)](https://express.qubell.com/applications/upload?metadataUrl=https://raw.github.com/qubell-bazaar/component-oracle-db-xe/1.0-33p/meta.yml)

Features
--------

 - Install and configure Oracle Database XE
 - Create schemas
 - Manage grants
 - Execute arbitrary SQL on a database

Configurations
--------------

 - Oracle Database XE 11g, CentOS 6.4 (us-east-1/ami-bf5021d6), AWS EC2 m1.small, root
 - Oracle Database XE 11g, Amazon Linux (us-east-1/ami-1ba18d72), AWS EC2 m1.small, ec2-user

Pre-requisites
--------------
 - Configured Cloud Account a in chosen environment
 - Either installed Chef on target compute OR launch under root
 - Internet access from target compute:
  - Oracle Database XE distribution: [Download](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html)
  - S3 bucket with Chef recipes: ** (TBD)
  - If Chef is not installed: ** (TBD)

Implementation notes
--------------------
 - Installation is based on Chef recipes

Example usage
-------------
```
- user-manage:
    action: "chefsolo"
    parameters:
      roles: [default]
      runList: ["recipe[oracle_db_component::user_manage]"]
      recipeUrl: "{$.recipe-url}"
      jattrs:
        oracle_db_component:
          db:
            admin_password: "{$.db-root-password}"
            listener_port: "{$.db-port}"
          schema:
            username: "{$.db-user}"
            password: "{$.db-user-password}"
            permissions: "{$.db-user-privileges}"
            action: "{$.db-user-mangement-action}"

- run-file-query:
    action: "chefsolo"
    parameters:
      roles: [default]
      runList: ["recipe[oracle_db_component::file_query]"]
      recipeUrl: "{$.recipe-url}"
      jattrs:
        oracle_db_component:
          schema:
            username: "{$.connection.db-user}"
            password: "{$.connection.db-user-password}"
            port: "{$.connection.db-port}"
          sql_url: "{$.sql-url}"
```
