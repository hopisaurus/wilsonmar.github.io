---
layout: post
title: "AWS Lambda Serverless"
excerpt: "JavaScript for the masses"
tags: [node, javascript, apple, mac, setup]
image:
# feature: pic orange wm_mcnaughton_sunset_runner_1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622121/097d7550-0585-11e6-9543-27d45c2487c2.jpg
  credit: William McNaughton
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial aims to have you ending up with a serverless app running in the Amazon cloud.
We'll take it one step at a time in an order that makes natural sense.
Along the way are PROTIPs and notes so you'll understand how we get there.

## About Serverless #

The term "serverless" describes an <strong>architectural style</strong>
where developers shift concerned about the hardware and its ability to scale to AWS Lambda.

The name "serverless" has been adopted by enprepreneur
<a target="_blank" href="https://twitter.com/austencollins">
@austencollins</a>
who built the
<a target="_blank" https://serverless.com/">
Serverless company</a>
around its open-source
<a target="_blank" href="https://github.com/serverless/serverless-framework">
serverless framework on GitHub</a>,

   * <a target="_blank" href="https://github.com/serverless/serverless">
   serverless-framework</a>
   * <a target="_blank" href="http://docs.serverless.com/v0.5.0/docs">
   Docs on serverless</a>
   * <a target="_blank" href="https://github.com/serverless/serverless/milestones/">
   Roadmap</a>

Social media:

   * <a target="_blank" href="https://www.serverless.com/">
   serverless.com</a> is the company's home page.
   * <a target="_blank" href="https://gitter.im/serverless/serverless">
   gitter.im/serverless/serverless</a> for instant chatting
   * <a target="_blank" href="http://serverlessconf.io/">serverlessconf.io</a> conferences
   * <a target="_blank" href="https://twitter.com/search?q=goserverless&src=typd">
    @GoServerless</a> Twitter account
   * <a target="_blank" href="https://www.youtube.com/channel/UCFYG383lawh9Hrs_DEKTtdg">
   YouTube channel</a>
   * <a target="_blank" href="http://github.us11.list-manage1.com/subscribe?u=b4fad36768cab222f88338995&id=5f8407dded">
   Mailchimp Mailing List</a>
   * <a target="_blank" href="http://www.meetup.com/serverless/">
   Meetups on meetup.com</a> and at
   <a target="_blank" href="https://www.ServerlessMeetups.com/">
   ServerlessMeetups.com</a>

   * When <a target="_blank" href="https://news.ycombinator.com/item?id=10005415">
   Hacker News</a> announced it in 2015 when the product was first called JAWS.

   * Initial Serverless presentation at AWS:Invent 2015
   <amp-youtube data-videoid="D_U6luQ6I90" layout="responsive" width="480" height="270"></amp-youtube>

## Serverless framework install #

0. [Install Node.js](/node-osx-install/)
   as a pre-requisite since the framework is written in Node.js.

0. Install the serverless-framework

   <pre><strong>
   npm install -g serverless
   </strong></pre>

0. Verify version:

   <pre><strong>
   serverless -v
   </strong></pre>

   NOTE: Serverless was in Beta version 0.5.6 as of June 2016.

<a id="UpdateFramework"></a>

## Update Serverless #

   <pre><strong>
   npm update -g serverless
   </strong></pre>

   Nothing returns if you're up-to-date.

<a id="LookAround"></a>

## Look around #

0. Get summary of commands using the abbreviated command:

   <pre><strong>
   sls
   </strong></pre>

   <pre>
 _______                             __
|   _   .-----.----.--.--.-----.----|  .-----.-----.-----.
|   |___|  -__|   _|  |  |  -__|   _|  |  -__|__ --|__ --|
|____   |_____|__|  \___/|_____|__| |__|_____|_____|_____|
|   |   |             The Serverless Application Framework
|       |                           serverless.com, v0.5.6
`-------'
&nbsp;
Commands
* Serverless documentation: http://docs.serverless.com
* You can run commands with "serverless" or the shortcut "sls"
* Pass "--help" after any &LT;context> &LT;action> for contextual help
* Add "--debug" to any command for extra useful logs
&nbsp;
project ........ create, init, install, remove
function ....... create, deploy, logs, remove, rollback, run
endpoint ....... deploy, remove
event .......... deploy, remove
dash ........... deploy, summary
stage .......... create, remove
region ......... create, remove
resources ...... deploy, diff, remove
plugin ......... create
variables ...... list, set, unset
   </pre>


0. Verify:

   <pre><strong>
   which serverless
   </strong></pre>

   <pre>
   /Users/mac/.npm-packages/bin/serverless
   </pre>

0. List framework folders and files:

   <pre><strong>
   cd ~/.npm-packages/lib/node_modules/serverless
   ls
   </strong></pre>

0. View the README.md file using a Markdown reader.

   In the Atom text editor (from GitHub),
   alt-click on the file to select <strong>Markdown Preview</strong>.

   This file lists projects,
   plugins, and consultants who provide services.


<a name="Projects"></a>

## Projects #

0. Create a folder to hold serverless projects.
   For example:

   <pre><strong>
   ~/gits/sls
   </strong></pre>

0. Pick a sample project from https://github.com:

   *  [serverless/serverless-graphql](https://github.com/serverless/serverless-graphql) - Official Serverless boilerplate to kick start your project

   * [serverless/serverless-starter](https://github.com/serverless/serverless-starter) - A simple boilerplate for new projects with a few architectural options

   * [serverless/serverless-graphql-blog](https://github.com/serverless/serverless-graphql-blog) - A blog boilerplate that leverages GraphQL in front of DynamoDB to offer a minimal REST API featuring only 1 endpoint

   * [laardee/serverless-authentication-boilerplate](https://github.com/laardee/serverless-authentication-boilerplate) - A generic authentication boilerplate for Serverless framework

   * [sc5/sc5-serverless-boilerplate](https://github.com/SC5/sc5-serverless-boilerplate) - A boilerplate for test driven development of REST endpoints

   * [microapps/MoonMail] (https://github.com/microapps/MoonMail) - Build your own email marketing infrastructure using Lambda + SES from http://microapps.com/


0. Load a sample project.

   <pre><strong>
   serverless project install project-name
   </strong></pre>

<a name="FrameworkStructure"></a>

## Serverless Framework #

The serverless framework save developers' time by standarizing the structure of folders and files.

   <pre>
s-project.json       // Project file (JSON or YAML)
s-resources-cf.json  // CloudFormation template
s-templates.json     // Config templates and variables
admin.env            // AWS Profiles (gitignored)
_meta                // Metadata (gitignored)
function1            // A custom function
  |__event.json
  |__handler.js
  |__s-function.json
   </pre>

This set of project file is what developers work with.

The serverless framework programming which read and process project files
is written in Node JavaScript.

The <strong>s-project.json</strong> lists plugins:

   <pre>
{
  "name": "notes",
  "custom": {},
  "plugins": [
    "serverless-client-s3"
  ]
}
   </pre>

A key differentiator with the Serverless Framework is that infrastructure specs are defined as code in one project.
<strong>s-resources-cf.json</strong> is a AWS CloudFormation template
specifying security (IAM) roles, SNS email topics, DynamoDB tables, Queues, ARNs.

Components are deployed per stage (dev, prod, etc.), 
allowing developers to easily deploy separate prod, test and dev environments.

Within the folder for each function is a <strong>s-function.json</strong>
file containing metadata such as <a href="#Plugins">plugins</a> installed with the project.

When the framework is created for a project, a <strong>.gitignore</strong> file is created with other files
to specify private and temporary work files that should not be publicly uploaded to GitHub.

Project metadata in file
<strong>_meta</strong> outputs and user variables used in function configurations.
But due to the sensitive nature of these variables, the file needs to be gitignore'd by default.
A workaround is to use the
Serverless Meta Sync plugin
which stores project metadata in S3.

<strong>admin.env<strong>

<a name="Plugins"></a>

## Plugins #

The heart of Serverless are its Plugins.
Several plugins come with the Framework.

PROTIP: Plugins need to be installed for each project that uses each.

0. List plugins installed.

   <pre><strong>
   ls _meta/
   </strong></pre>

0. Navigate your active directory to the root of your project.
0. Plugins are downloaded from GitHub by npm:

* [serverless/serverless-meta-sync](https://github.com/serverless/serverless-meta-sync) - Securely sync your the variables in your project's `_meta/variables` across your team.

     <pre><strong>
     npm install serverless-offline --save
     </strong></pre>

* [dherault/serverless-offline](https://github.com/dherault/serverless-offline) - Emulate AWS Lambda and Api Gateway locally to speed up your development cycles.

* [kennu/serverless-plugin-hookscripts](https://github.com/kennu/serverless-plugin-hookscripts) - Easily create shell script hooks that are run whenever Serverless actions are executed.

* [joostfarla/serverless-cors-plugin](https://github.com/joostfarla/serverless-cors-plugin) - Adds support for CORS (Cross-origin resource sharing).

* [Nopik/serverless-serve](https://github.com/Nopik/serverless-serve) - Simulate API Gateway locally, so all function calls can be run via localhost.

* [asprouse/serverless-webpack-plugin](https://github.com/asprouse/serverless-webpack-plugin) - Use Webpack to optimize your Serverless Node.js Functions.

    <pre>
    npm install serverless-webpack-plugin webpack --save-dev
    </pre>

* [serverless/serverless-client-s3](https://github.com/serverless/serverless-client-s3) - Deploy and config a web client for your Serverless project to S3.

* [martinlindenberg/serverless-plugin-alerting](https://github.com/martinlindenberg/serverless-plugin-alerting) -
   This Plugin adds Cloudwatch Alarms with SNS notifications for your Lambda functions.

* [serverless/serverless-optimizer-plugin](https://github.com/serverless/serverless-optimizer-plugin) -
   Optimizes your code for performance in Lambda. Supports coffeeify, babelify and other transforms

* [tmilewski/serverless-resources-validation-plugin](https://github.com/tmilewski/serverless-resources-validation-plugin) -
   Adds support for validating your CloudFormation template.

* [Nopik/serverless-lambda-prune-plugin](https://github.com/Nopik/serverless-lambda-prune-plugin) -
   Delete old versions of AWS lambdas from your account so that you don't exceed the code storage limit.

* [daffinity/serverless-base-path-plugin](https://github.com/daffinity/serverless-base-path-plugin) -
   Sets a base path for all API Gateway endpoints in a Component.

* [arabold/serverless-test-plugin](https://github.com/arabold/serverless-test-plugin) - A Simple Integration Test Framework for Serverless.

* [martinlindenberg/serverless-plugin-sns](https://github.com/martinlindenberg/serverless-plugin-sns) - This plugin easily subscribes your lambda functions to SNS notifications.

* [joostfarla/serverless-jshint-plugin](https://github.com/joostfarla/serverless-jshint-plugin) - Detect errors and potential problems in your Lambda functions.

* [nishantjain91/serverless-eslint-plugin](https://github.com/nishantjain91/serverless-eslint-plugin) - Detect errors and potential problems in your Lambda functions using eslint.

* [SC5/serverless-mocha-plugin](https://github.com/SC5/serverless-mocha-plugin) - Enable test driven development by creating test cases when creating new functions

* [HyperBrain/serverless-package-plugin](https://github.com/HyperBrain/serverless-package-plugin) - Package your lambdas without deploying to AWS.

* [arabold/serverless-sentry-plugin](https://github.com/arabold/serverless-sentry-plugin) - Automatically send errors and exceptions to [Sentry](https://getsentry.com).

* [arabold/serverless-autoprune-plugin](https://github.com/arabold/serverless-autoprune-plugin) - Delete old AWS Lambda versions.


## Serverless Command-line #

Lambda functions can be defined from a command-line using the Serverless framework.

AWS May 2016 Webinar Series - Deep Dive on Serverless Web Applications
   <amp-youtube data-videoid="fXZzVzptkeo" layout="responsive" width="480" height="270"></amp-youtube>

http://abalone0204.github.io/2016/05/22/serverless-simple-crud/


<a id="IAM"></a>

## Get Permissions #

Since

aws-lambda-node-js-programming


http://stackoverflow.com/questions/37779324/how-to-troubleshoot-serverless-iam-permissions

## Resources #

<a name="PhillipMuens"></a>
Phillip Muens (@pmmuens, github.com/pmuens) from Germany

   * Has an informative blog at
   <a target="_blank" href="http://justserverless.com/blog/">
   JustServerless.com</a>

   * http://justserverless.com/blog/your-first-serverless-application/

   * <a target="_blank" href="https://github.com/JustServerless/awesome-serverless">Awesome list</a>

    * <a target="_blank" href="http://justserverless.com/blog/nanoservices-microservices-monolith-serverless-architectures-by-example/">
    Nanoservices</a>

   * <a target="_blank" href="https://gumroad.com/l/learn-serverless-book">
   $28.13 Learn Serverless ebook</a> (5.7 MB in 5 PDFs),
   <a target="_blank" href="http://learnserverless.club/">learnserverless.club</a>,
   with the sample app at
   <a target="_blank" href="https://github.com/JustServerless/notes">
   github.com/JustServerless/notes</a>.

   https://github.com/JustServerless/learnserverless-book/issues

Matthew Fuller

   * <a target="_blank" href="https://www.amazon.com/AWS-Lambda-Guide-Serverless-Microservices-ebook/dp/B016JOMAEE/">
   AWS Lambda: A Guide to Serverless Microservices</a>
   $3.99

Jake Knowles

 * AWS Lambda: Serverless Microservices Guide with Simple Instructions

John McKim  @johncmckim  blogs on Medium:

   * <a target="_blank" href="https://medium.com/@johncmckim/serverless-framework-the-good-parts-9d84e5a02467#.yxruhhlna">
   Serverless Framework: The Good Parts</a>

## Future topics #

handlers that compress or transform objects while being uploaded to Amazon S3.


## More on Serverless #

This is one of a series on Serverless computing

{% include serverless_links.html %}