---
layout: post
title: "MySQL. Yes. SQL. Set it up"
excerpt: "It worked for your dad. Embrace it."
tags: [mysql, database]
image:
# feature: fig orange mysql php 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622311/4f41e84a-0586-11e6-8164-6363861642fd.jpg
  credit: Kevin Yank
  creditlink: http://www.databasejournal.com/features/mysql/article.php/1402281/Build-Your-Own-Database-Driven-Website-Using-PHP--MySQL-Pt-4.htm
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

As you can see this page is minimal because we've moved on to NO-SQL.

Here are the basics.

https://www.youtube.com/watch?v=DzX0jYC0t08
MySQL

http://dev.mysql.com/downloads/workbench/
MySQL Workbench install on mac

The command-line client is mysql.


Invoke from the command line:

   <tt><strong>
   sql5
   </strong></tt>

To exit:

   <tt><strong>
   quit
   <strong></tt>

Create a database:

   <tt>USE mydb3</tt>

Delete a database:

   <tt>drop mydb3</tt>

To login using the user name I created:

   <tt><strong>
   sql5 -u mysqladmin -p
   </strong></tt>

Databases contain a collection of tables:

   <tt>
   show databases
   </tt>

To create a database based on
<a target="_blank" href="http://stackoverflow.com/questions/20958/list-of-standard-lengths-for-database-fields"> this discussion</a>:

<pre>
CREATE SCHEMA 'inmail';
CREATE TABLE  'inmail','NEWMAIL' (
'first_name' VARCHAR(48) NULL,
'family_name' VARCHAR(96) NULL,
'subscribe' VARCHAR(1) NULL,
'emailaddr' VARCHAR(128) NULL,
'password' VARCHAR(48) NULL,
'emailsubject' VARCHAR(120) NULL,
'loc' VARCHAR(48) NULL,
'rating' INT NOT NULL,
'pubthis' VARCHAR(1) NULL,
'comments' VARCHAR(4046) NULL,
'refererurl' VARCHAR(255) NULL,
'user_agent' VARCHAR(45) NULL,
'remote_addr' VARCHAR(48) NULL,
'local_addr' VARCHAR(48) NULL,
'city_addr' VARCHAR(96) NULL,
'street_addr' VARCHAR(96) NULL,
'phone_country' MEDIUMINT UNSIGNED NOT NULL,
'phone_numberâ€™ MEDIUMINT UNSIGNED NOT NULL,
'postal' MEDIUMINT UNSIGNED NOT NULL,
'longitude' NUMERIC 9,6 NULL,
'latitude' NUMERIC 8,6 NULL,
'visitor_id' INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
'savedatetime' TIMESTAMP,
);
// comment not a BLOB to reduce overhead
// phone number is 10 digits in the US.
// postal code 11
// TIMESTAMP is 
</pre>

## MariaDB #

Maria-DB is a drop-in replacement for MySQL.
MariaDB 5.1.53 is based on MySQL 5.1.53.

Maria-DB is from MySQL-founder Michael “Monty” Widenius, who left after Oracle acquired Sun to start a new company (Monty Program).

The main configuration file is still my.cnf 

MariaDB shis with additional storage engines installed (no compilation as with MySQL):
Aria, XtraDB (an enhanced and extended version of the InnoDB storage engine), PBXT, FederatedX (a drop-in replacement for Federated), OQGraph, and SphinxSE 
in addition to standard MyISAM, blackhole, CSV, Memory, etx.

   show storage engines;

MariaDB Knowledgebase: 

   http://kb.askmonty.org/v/mariadb


## Amazon Aurora #

https://aws.amazon.com/rds/aurora/
it replaces MySQL, but also enables scaling to 64 TB
and replicates across 3 zones.

It's managed by RDS (Relational Data Service).




