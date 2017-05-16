---
layout: post
title: "Swagger-codegen for JMeter"
excerpt: "Install from GitHub a generator of JMeter files to load test the PetStore sample app"
tags: [perftest, Swagger]
shorturl: "https://"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This repo is about programs that reads a Swagger specification for the Petstore sample app and 
generates a JMeter test .jmx file (among other outputs).


## Install swagger-codegen locally

After you install Git and Maven on your Mac:

   <pre>
cd ~
mkdir gits
cd gits
git clone https://github.com/swagger-api/swagger-codegen.git --depth=1
cd swagger-codegen
mvn clean install
   </pre>

   The "--depth=1" downloads only the latest version of the repo.

   mvn install takes a while (11 minutes), and ends with something like this:

   <pre>
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] swagger-codegen-project ............................ SUCCESS [  5.866 s]
[INFO] swagger-codegen (core library) ..................... SUCCESS [08:35 min]
[INFO] swagger-codegen (executable) ....................... SUCCESS [ 52.335 s]
[INFO] swagger-codegen (maven-plugin) ..................... SUCCESS [ 11.775 s]
[INFO] swagger-generator .................................. SUCCESS [01:07 min]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 10:56 min
[INFO] Finished at: 2017-05-14T17:50:28-04:00
[INFO] Final Memory: 75M/1239M
[INFO] ------------------------------------------------------------------------
   </pre>

   Next let's use the default assets to generate clients for the PetStore sample app.

## The Petstore API Swagger Spec

0. View the spec for edit in your browser:

   <a target="_blank" href="http://editor.swagger.io/">
   editor.swagger.io</a>

   In the future, you can use this same editor to work on your own API contents.

   ### 3 Pet Store Classes
   
   Notice the operations under each of these 3 classes (listed alphabetically):

   * PetApi - Everything about your pets
   * StoreApi - Access to Petstore orders
   * UserApi - Operations about user

   Also notice the Models: Order, Category, User, Tag, Pet, ApiResponse.

0. View the spec locally in your favorite text editor:

   <pre><strong>subl ~/gits/swagger-codegen/modules/swagger-codegen/src/test/resources/2_0/petstore.yaml 
   </strong></pre>


### Generate Go Server

On a Mac, <a target="_blank" href="https://wilsonmar.github.io/golang/">
install Go</a>, then:

   <pre><strong>
java -jar ~/gits/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar \
generate \
-i ~/gits/swagger-codegen/modules/swagger-codegen/src/test/resources/2_0/petstore.yaml \
-l go-server \
-o ~/Downloads/swagger-petstore-gen-go-server
   </strong></pre>

   The back-slash \ specifies line continuation in the CLI.

   * <tt>-i http://petstore.swagger.io/v2/swagger.json </tt><br />
   is an alternative to the downloaded Swagger spec for Petstore:

   * <tt>-i ~/gits/swagger-codegen/modules/swagger-codegen/src/test/resources/2_0/petstore.yaml </tt>

   * <tt>-l</tt> specifies the generator in folder:

   * ~/gits/swagger-codegen/samples/client/petstore

   * There are others such as jaxrs-cxf-client \

   * -o, CAUTION: If not specified, files are generated in the pwd.
   <br /><br />

The generated go-server folder contains:

   * .swagger-codegen folder
   * .swagger-codget-ignore file
   * api folder
   * go folder
   * main.go file

0. Invoke the Go server:

   <pre><strong>go run main.go
   </strong></pre>

   BLAH: I got this message:

   <pre>
main.go:11:2: 
go/logger.go:3:1: expected 'IDENT', found 'import'
   </pre>   

   See https://stackoverflow.com/questions/39665379/golang-fully-qualified-import-path-in-auto-generated-code


## PetStore JMeter specs

The jmeter generator folder contains a .jmx template file and .csv file for each of the above.

Each .jmx file contains variables surounded by mustache swiggly brackets {{ and }}.

In each .csv file are variable names in the first row and its corresponding value in the second row.

The generator creates useable .jmx files by subsituting variables in the .jmx file with values in the .csv file.


### Generate JMeter from default files

On a Mac, output to Downloads:

   <pre><strong>
java -jar ~/gits/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar \
generate \
-i ~/gits/swagger-codegen/modules/swagger-codegen/src/test/resources/2_0/petstore.yaml \
-l jmeter \
-o ~/Downloads/swagger-petstore-gen-jmeter
   </strong></pre>

   The back-slash \ specifies line continuation in the CLI.

* <tt>-l</tt> specifies the generator in folder:

   * ~/gits/swagger-codegen/samples/client/petstore

   * There are others such as jaxrs-cxf-client \

   * CAUTION: If not specified, files are generated in the pwd.
   <br /><br />

* <tt>-o</tt> specifies the output folder. PROTIP: Name it the same as the generator
 (jaxrs-cxf-client)

   Look for the console message like this to list the generated files:

   <pre>
[main] INFO io.swagger.codegen.AbstractGenerator - writing file /Users/mac/Downloads/JMETER/src/gen/java/io/swagger/model/ModelApiResponse.java
   </pre>

   On a Linux server:

   <pre>
-o /var/tmp/swagger-codegen/jaxrs-cxf-client
   </pre>


   ### Generated go PetStore server

0. Invoke the Petstore server app generated in the Go language.


   ### Use Generated JMeter load tests

0. After [Installing JMeter](/jmeter-install/)...

0. Edit the .csv file 

   * from "localhost"
   * from port 8080

0. Invoke a generated JMeter .jmx file to load test the sample Petstore app:

   <pre><strong>jmeter -n \
   -t ~/Downloads/swagger-petstore-gen-jmeter/UserApi.jmx \
   -l ~/Downloads/swagger-petstore-run-jmeter/UserApi.jtl \
   -e -o ~/Downloads/swagger-petstore-run-jmeter
   </strong></pre>

0. Since there are three .jmx files:

   * PetApi - Everything about your pets

   * StoreApi - Access to Petstore orders


   ### Generate your own .jmx

The .jmx template files in Swagger-gen are hard-coded.

Options to automate:

1. Edit the generated file using the JMeter GUI and convert values back to variables.

2. Write a program using JMeter's API, as described at:

   * https://github.com/uttesh/JmeterAPISample
   * http://uttesh.blogspot.in/2015/04/jmeter-load-testing-by-code-jmeter-api.html

3. Write a program to read the Swagger spec and generate a .jmx file
either containing variables to generate or containing values for use directly in JMeter.



   ### Go

The JMeterGo program is written in the Go language for processing by the 
Serverless framework running on Amazon Lambda and other clouds.

   * https://golang.org/pkg/encoding/xml/
   <br /><br />

Since Amazon Lambda does not natively process Go language programs,
we use the Go shim for Amazon Lambda.

### Another app under test

If you are to create a new Swagger (OpenAPI) spec file, 
verify its using the online validator:

http://online.swagger.io/validator/debug?url=http://petstore.swagger.io/v2/swagger.json

