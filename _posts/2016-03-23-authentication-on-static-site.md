---
layout: post
title: "Authenticate users on Jekyll sites"
excerpt: "So you can personalize content"
tags: [authentication, personalization, jekyll]
image:
# feature: pic blue findbiometrics.com 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621979/1268244a-0584-11e6-8bb2-446af589f158.jpg
  credit: Findbiometrics
  creditlink: http://findbiometrics.com/ear-based-authentication-system-patented-by-amazon-26183/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

## The Annoyance

One of the limitations of using a static site Jekyll template is visitors don't sign in.

Jekyll was not built to ask users for their login credentials
(like Wordpress and other CMS systems do).

Since there is currently no mechanism for additional plug-ins to GitHub.io hosting,
an alternative hosting service is needed.

So what to do?

## Jekyll-auth

All is described at: https://github.com/benbalter/jekyll-auth

0. Create a GitHub **Organization** to make use of its membership authentication and access features.
0. Create a GitHub **project** under that organization.
0. Create a Jekyll **site** within that project.
0. Create a GitHub **Application**
0. Install <a target="_blank" href="https://toolbelt.heroku.com/">Heroku toolbelt</a>
   to work with Heroku (Heroku gem doesn't work for this).
0. Host the site on Heroku, which has extra capabilities not offered by GitHub.io.

Fabian kostadinov
[explains it all](http://fabian-kostadinov.github.io/2014/11/13/installation-of-jekyll-auth/)
with this diagram:

<img alt="Jekyll-auth workflow" src="http://fabian-kostadinov.github.io/public/img/2014-11-13-installation-of-jekyll-auth.png"><!-- 1280x720 -->


## GitHub Application

0. Apply at
https://github.com/settings/applications/new

An article of how this works:
http://fabian-kostadinov.github.io/2014/11/13/installation-of-jekyll-auth/


## Heroku hosting

Having the site hosted on Heroku and using Jekyll-Auth
keeps the website itself in a protected zone and
enables control of access to both website and data.


## Database using Prose

http://fabian-kostadinov.github.io/2015/02/04/how-i-created-a-simple-dbms-using-github-jekyll-prose-and-heroku/

See http://labs.panchadsaram.com/jekyll-db/

Text files in Github can serve as a "database" of data about users, etc.

https://github.com/rypan/jekyll-db

Items are stored in text markdown tables within .md files named like any post
(such as 2013-09-02-item-1.md).


## Forms

http://www.alpacajs.org/

Build HTML forms for user input from JSON Schema.

https://github.com/joshfire/jsonform
is not maintained anymore.

http://fabian-kostadinov.github.io/2014/09/22/validation-in-jsonform/


## Prose online editor

https://github.com/prose/prose

is an online editor for editing (markdown, HTML and other) files in a repository on GitHub.com.
