---
layout: post
title: "Scenarios for load"
excerpt: "Artificial"
tags: [scenarios, load, testing, artificial]
image:
# feature: pic brown blowholes sunset 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622013/564257e4-0584-11e6-8b3f-b2a14eea98a4.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

"S01" and such in file refer to these values
which designates the file's usage.

## Single-user

<amp-youtube data-videoid="6VmAX3DM78s" layout="responsive" width="480" height="270"></amp-youtube>

* <strong>S01-Landing</strong> – Landing page from URL only for 
   <strong>connection variability testing</strong>.
   This may be the page that comes with the web container 
   (IIS, Apache, Jetty, etc.).


* <strong>S02-Home_page</strong> for the page that appears when the application is invoked.
  Appearance of this page indication that the application is "alive", and can deliver resources.
  This page can be used for <strong>connection load testing</strong>.

## Multi-user

* <strong>S03-Sign-up</strong> to build user database build timing tests.

* <strong>S04-Log-in</strong> for authentication load testing.

* <strong>S05-Menu traversal</strong> for variety and to ensure menus can be invoked in order to reach functionality to be load tested.

* <strong>S06-Add</strong> for app transaction DB build timings.

* <strong>S07-Updates</strong> for app user variety.

* <strong>S08-Report</strong> for app user mix load testing.

* <strong>S09-Deletes</strong> needed for emulating real work patterns during longitudinal/soak load test.

* There may be additional ones such as pure API access.

## Footnotes

Reference to this page:

http://wilsonmar.github.io/scenarios-for-load
