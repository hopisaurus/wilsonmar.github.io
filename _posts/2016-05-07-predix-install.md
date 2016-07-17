---
layout: post
title: "Predix install"
excerpt: "Setup Machine Learning for the Industrial Internet"
tags: [ML, GE]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This article examines instructions to developers from
Predix, GE's brand name for their "Industrial Internet" which 
incorporates Machine Learning, Data Science, and Artificial Intelligence.

The technical components according to 
<a target="_blank" href="https://www.predix.io/resources/training">
https://www.predix.io/resources/training</a>

0. <a href="#Devbox">Devbox with pre-built virtual machines</a>
0. <a href="#LocalInstall">Local install</a> Eclipse IDE (text editor) with STS (Spring Tool Suite)
0. Java programming language
0. <a href="#Spring">Spring framework</a>
0. <a href="#OpenJPA">Apache OpenJPA persistence</a>
0. Maven build
0. <a href="#CloudFoundary">Hosting in the Cloud Foundry cloud</a>

<hr />

## <a name="#Devbox">Devbox</a> #

https://www.predix.io/resources/tutorials

https://www.predix.io/services/other-resources/devbox.html


## <a name="#LocalInstall">Local install</a> #

Use the script at https://github.com/PredixDev/local-setup


### <a name="Eclipse">Eclipse STS IDE</a> #

https://www.predix.io/resources/tutorials/journey.html#1607
advises the use of STS instead of using [Homebrew](/macos-homebrew/) to install 
   <a target="_blank" href="http://macappstore.org/eclipse-java/">eclipse-java</a>:

   <tt><strong>
   brew update<br />
   brew cask install eclipse-java
   </strong></tt>

   The response:

   <pre>
Please migrate your Casks to the new location and delete /opt/homebrew-cask/Caskroom,
or if you would like to keep your Caskroom at /opt/homebrew-cask/Caskroom, add the
following to your HOMEBREW_CASK_OPTS:
&nbsp;
  --caskroom=/opt/homebrew-cask/Caskroom
&nbsp;
For more details on each of those options, see https://github.com/caskroom/homebrew-cask/issues/21913.
==> Satisfying dependencies
complete
==> Downloading https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/R/eclipse-java-neon-R-macosx-cocoa-x86_64.tar.gz&r=1
==> Verifying checksum for Cask eclipse-java
==> Moving App 'Eclipse.app' to '/Applications/Eclipse.app'
🍺  eclipse-java staged at '/opt/homebrew-cask/Caskroom/eclipse-java/4.6.0' (0B)
   </pre>

   Anyway:

0. Use an interest browser to the STS website.
0. Select a download site to begin download. Wait for the file to download.
0. Unzip
0. In Finder, navigate inside the folder, such as:

   ~/Documents/workspace-sts-3.8.0.RELEASE

   This contains the server.

0. Move and/or rename the folder according to your organization's standards.

0. In Finder navigate to /Applications.
0. Move (drag and drop) STS.app to /Applications.
0. Open STS by double-clicking the icon.
0. Click Open icon for first-time confirmation.
0. Specify your workspace.



## STS (Spring Tools Suite) #

<a target="_blank" href="https://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse">
Included with STS</a> (Spring Tools Suite)
is the developer edition of Pivotal tc Server, 
the drop-in replacement for Apache Tomcat that’s optimized for Spring.

The Spring Insight console, tc Server Developer Edition, 
provides a graphical real-time view of application performance metrics that lets developers identify and diagnose problems from their desktops.


<a name="Spring"></a>

## Spring framework

The framework is based on the Java Spring framework,
which many now consider "heavy".

This is surprising considering most others in their industry
have gone to Python or React.

QUESTION: Why Spring and not Node or Python or React?

Maybe it's because there are more Java Spring developers unemployed than the other hotter frameworks?

Or that Spring is more "mature" as a framework since it's been around since the 90's.


## predixdev #

During register for a Predix account, 
each developer's GitHub account is granted access to 
the repository and a number of subrepositories
at

   * <a target="_blank" href="https://github.com/predixdev/">https://github.com/predixdev</a>


## <a name="OpenJPA">OpenJPA persistence</a> #


Eclipse v3.2 (2010) has annotation support used by OpenJPA.
defined in javax.persistence:
 which is left to the JPA vendor to implement. (OpenJPA implements it through a table sequence.)

<a target="_blank" href="https://github.com/apache/openjpa">
OpenJPA</a> is a library to manage persistence and 
object/relational mapping (ORM) for Java EE and Java SE environments
to store data in a database.

It implements the <a target="_blank" href="https://jcp.org/en/jsr/detail?id=317">
Java Persistence 2.0 spec at https://jcp.org/en/jsr/detail?id=317</a>
 that went final in 2009.

Three artifacts to implement a JPA-compliant program:

   0. An entity class
   0. A persistence.xml file
   0. A class through which you will insert, update, or find an entity.

QUESTION: XML? In 2016.  Really?

JPA supports SQL, but OpenJPA has a canonical query language 
named Java Persistence Query Language (JPQL).

Some rants about JPA:

   * http://www.ibm.com/developerworks/websphere/techjournal/0612_barcia/0612_barcia.html

   * http://openjpa.apache.org/quick-start.html

   * http://www.jpab.org/OpenJPA.html
   is not the fastest ORM/DB.

   * http://www.javaworld.com/article/2077817/java-se/understanding-jpa-part-1-the-object-oriented-paradigm-of-data-persistence.html?page=2



<a target="_blank" href="https://www.wikiwand.com/en/Apache_OpenJPA">
The Wikipedia article on it</a>
notes the source code is the basis for the core persistence engine of BEA Weblogic Server, IBM WebSphere, and the Apache Geronimo Application Server.

   * <a target="_blank" href="https://dzone.com/articles/openjpa-introductory-tutorial">
   https://dzone.com/articles/openjpa-introductory-tutorial</a>
   provides a sample Geronimo site.

http://www.javaworld.com/article/2077817/java-se/understanding-jpa-part-1-the-object-oriented-paradigm-of-data-persistence.html
notes
The JPA specification was first introduced as part of JSR 220: EJB 3.0, 
with the goal of "simplifying" the EJB entity beans programming model. 
Although it all started with entity beans and is packaged with Java EE 5.0, 
JPA can be used outside the container in a Java SE environment.

QUESTION: Why is such advanced ML tech based on such old techology? 
Well, have you seen what's in Java 8? Spring Boot?

### JPA Fields #


By default, all the fields are of type @Basic, which are persisted as-is in the database.

@Enitity signifies that a particular class is an entity class. If the entity name is different from the table name, then the @Table annotation is used; otherwise, it isn't required.

@Column provides the name of the column in a table if it is different from the attribute name. (By default, the two names are assumed to be the same.)

@Id signifies the primary key.

@Version signifies a version field in an entity. JPA uses a version field to detect concurrent modifications to a data store record. When the JPA runtime detects multiple attempts to concurrently modify the same record, it throws an exception to the transaction attempting to commit last. This prevents you from overwriting the previous commit with stale data.

@GeneratedValue signifies a strategy to assign a unique value to your identity fields automatically. The types of strategies available are IDENTITY, SEQUENCE, TABLE, and AUTO. The default strategy is auto




## <a name="CloudFoundry">Cloud Foundry cloud</a> #

https://www.vmware.com/products/vfabric-tcserver/
Cloud Foundry is by VMware Pivotal
is purchased as part of the 
<a target="_blank" href="https://www.vmware.com/products/vfabric/overview.html">
VMWare Fabric</a>
containing the "VMware vFabric tc Server".

0. At https://github.com/cloudfoundry/cli/releases
   click the "Latest Release".

0. Use Homebrew

   <tt><strong>
   brew tap cloudfoundry/tap
   </strong></tt>

  The response (on 7 July 2016):

  <pre>
==> Tapping cloudfoundry/tap
Cloning into '/usr/local/Library/Taps/cloudfoundry/homebrew-tap'...
remote: Counting objects: 7, done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 7 (delta 0), reused 3 (delta 0), pack-reused 0
Unpacking objects: 100% (7/7), done.
Checking connectivity... done.
Tapped 2 formulae (33 files, 27K)
  </pre>

0. Install Command Line Interface:

   <tt><strong>
   brew install cf-cli
   </strong></tt>

   The response:

   <pre>
==> Installing cf-cli from cloudfoundry/tap
==> Downloading https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.20.0&source=homebrew
==> Downloading from https://s3.amazonaws.com/go-cli/releases/v6.20.0/cf-cli_6.20.0_osx.tgz
######################################################################## 100.0%
🍺  /usr/local/Cellar/cf-cli/6.20.0: 2 files, 22.1M, built in 18 seconds
   </pre>

0. Install uaac:

   <tt><strong>
   gem install cf-uaac
   </strong></tt>

   The response:

   <pre>
Fetching: multi_json-1.12.1.gem (100%)
Successfully installed multi_json-1.12.1
Fetching: cf-uaa-lib-3.4.0.gem (100%)
Successfully installed cf-uaa-lib-3.4.0
Fetching: highline-1.6.21.gem (100%)
Successfully installed highline-1.6.21
Fetching: eventmachine-1.0.9.1.gem (100%)
Building native extensions.  This could take a while...
Successfully installed eventmachine-1.0.9.1
Fetching: launchy-2.4.3.gem (100%)
Successfully installed launchy-2.4.3
Fetching: cookiejar-0.3.3.gem (100%)
Successfully installed cookiejar-0.3.3
Fetching: em-socksify-0.3.1.gem (100%)
Successfully installed em-socksify-0.3.1
Fetching: http_parser.rb-0.6.0.gem (100%)
Building native extensions.  This could take a while...
Successfully installed http_parser.rb-0.6.0
Fetching: em-http-request-1.1.5.gem (100%)
Successfully installed em-http-request-1.1.5
Fetching: json_pure-1.8.3.gem (100%)
Successfully installed json_pure-1.8.3
Fetching: rack-1.5.5.gem (100%)
Successfully installed rack-1.5.5
Fetching: cf-uaac-3.3.0.gem (100%)
Successfully installed cf-uaac-3.3.0
Parsing documentation for multi_json-1.12.1
Installing ri documentation for multi_json-1.12.1
Parsing documentation for cf-uaa-lib-3.4.0
Installing ri documentation for cf-uaa-lib-3.4.0
Parsing documentation for highline-1.6.21
Installing ri documentation for highline-1.6.21
Parsing documentation for eventmachine-1.0.9.1
Installing ri documentation for eventmachine-1.0.9.1
Parsing documentation for launchy-2.4.3
Installing ri documentation for launchy-2.4.3
Parsing documentation for cookiejar-0.3.3
Installing ri documentation for cookiejar-0.3.3
Parsing documentation for em-socksify-0.3.1
Installing ri documentation for em-socksify-0.3.1
Parsing documentation for http_parser.rb-0.6.0
Installing ri documentation for http_parser.rb-0.6.0
Parsing documentation for em-http-request-1.1.5
Installing ri documentation for em-http-request-1.1.5
Parsing documentation for json_pure-1.8.3
Installing ri documentation for json_pure-1.8.3
Parsing documentation for rack-1.5.5
Installing ri documentation for rack-1.5.5
Parsing documentation for cf-uaac-3.3.0
Installing ri documentation for cf-uaac-3.3.0
Done installing documentation for multi_json, cf-uaa-lib, highline, eventmachine, launchy, cookiejar, em-socksify, http_parser.rb, em-http-request, json_pure, rack, cf-uaac after 10 seconds
12 gems installed
   </pre>

0. Verify use of uaac:

   <tt><strong>
   uaac
   </strong></tt>

   The response:

   <pre>
UAA Command Line Interface

Miscellaneous
  version                          Display version
  help [topic|command...]          Display summary or details of command or topic
  target [uaa_url]                 Display current or set new target
   </pre>

0. Install bower for front-end UI flat (non-recursive) dependencies tree:

   <tt><strong>
   npm install -g bower
   </strong></tt>

   See https://coolestguidesontheplanet.com/installingbower-on-osx/

   Verify:

   <tt><strong>
   bower --version
   </strong></tt>

## Install Predix #

See https://www.predix.io/resources/tutorials/tutorial-details.html?tutorial_id=1523

0. Create a folder (~/gits/predix) to hold repos and cd to it.

   Predix offers two samples:

   * git clone https://github.com/PredixDev/predix-microservice-cf-jsr.git
   * git clone https://github.com/PredixDev/predix-microservice-cf-spring.git

0. Create repo for JSR and cd into it:

   <tt><strong>
   git clone https://github.com/PredixDev/predix-microservice-cf-jsr.git<br />
   cd predix-microservice-cf-jsr
   </strong></tt>

   The tree of folders and files for JSR is more complex than Spring:

   <pre>
|-- COPYRIGHT.md
|-- LICENSE.md
|-- README.md
|-- config
|   `-- application.properties
|-- manifest.yml
|-- pom.xml
`-- src
    |-- main
    |   |-- java
    |   |   `-- com
    |   |       `-- ge
    |   |           `-- predix
    |   |               `-- solsvc
    |   |                   |-- boot
    |   |                   |   |-- Application.java
    |   |                   |   |-- PredixBootSecurityConfig.java
    |   |                   |   `-- service
    |   |                   |       `-- cxf
    |   |                   |           |-- ApplicationJSONProvider.java
    |   |                   |           |-- DefaultService.java
    |   |                   |           |-- DynamicService.java
    |   |                   |           `-- DynamicServiceImpl.java
    |   |                   `-- spi
    |   |                       |-- IServiceManagerService.java
    |   |                       |-- NamedCxfProperties.java
    |   |                       `-- ServiceManagerServiceImpl.java
    |   `-- resources
    |       |-- META-INF
    |       |   `-- spring
    |       |       |-- predix-microservice-cf-jsr-cxf-context.xml
    |       |       `-- predix-microservice-cf-jsr-scan-context.xml
    |       |-- application-default.properties
    |       `-- application.properties
    `-- test
        |-- java
        |   `-- com
        |       `-- ge
        |           `-- predix
        |               `-- solsvc
        |                   `-- boot
        |                       `-- HelloControllerTest.java
        `-- resources
            `-- application.properties
&nbsp;
23 directories, 21 files
   </pre>

0. Create the repo for Spring and cd into it:

   <tt><strong>
   git clone https://github.com/PredixDev/predix-microservice-cf-spring.git<br />
   cd predix-microservice-cf-spring
   </strong></tt>

   The tree of folders and files for Spring is less complex than JSR:

   <pre>
|-- COPYRIGHT.md
|-- LICENSE.md
|-- README.md
|-- config
|   `-- application.properties
|-- manifest.yml
|-- pom.xml
`-- src
    |-- main
    |   |-- java
    |   |   `-- com
    |   |       `-- ge
    |   |           `-- predix
    |   |               `-- solsvc
    |   |                   |-- boot
    |   |                   |   |-- Application.java
    |   |                   |   `-- PredixBootSecurityConfig.java
    |   |                   `-- service
    |   |                       `-- HelloController.java
    |   `-- resources
    |       |-- application-default.properties
    |       `-- application.properties
    `-- test
        `-- java
            `-- com
                `-- ge
                    `-- predix
                        `-- solsvc
                            `-- boot
                                |-- HelloControllerIT.java
                                `-- HelloControllerTest.java
18 directories, 13 files
   </pre>


## Build using Maven #

   <tt><strong>
   mvn clean package 
   </strong></tt>

   The end of a long list is like this:

   <pre>
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 02:27 min
[INFO] Finished at: 2016-07-08T08:55:47-06:00
[INFO] Final Memory: 30M/152M
[INFO] ------------------------------------------------------------------------
   </pre>
