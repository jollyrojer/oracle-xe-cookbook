Oracle Database XE
=====

Version 0.1.0
-------------

![](http://www.oracle.com/ocom/groups/public/@otn/documents/digitalasset/123455.gif)

Installs and configures Oracle Database 11g XE.

[![Install](https://raw.github.com/qubell-bazaar/component-skeleton/master/img/install.png)](https://express.qubell.com/applications/upload?metadataUrl=https://github.com/qubell-bazaar/component-mysql/raw/master/meta.yml)

Features
--------

 - Install and configure Oracle Database XE
 - Create schemas
 - Manage grants
 - Execute arbitrary SQL on a database

Configurations
--------------
[![Build Status](https://travis-ci.org/qubell-bazaar/component-mysql-dev.png?branch=master)](https://travis-ci.org/qubell-bazaar/component-mysql-dev)

 - Oracle Database XE 11g, CentOS 6.3 (us-east-1/ami-bf5021d6), AWS EC2 m1.small, root

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
**
