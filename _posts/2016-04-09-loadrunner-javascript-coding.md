---
layout: post
title: "LoadRunner JavaScript Coding"
excerpt: "Sample code and tutorial here"
tags: [JavaScript, Load Testing, LoadRunner]
author: anil_mainali
image:
  feature: pic brown running horses 1900x500.jpg
  credit: Steve Mckinzie
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

[This tutorial](/loadrunner-javascript-coding/)
 is one in a <strong>series</strong> about coding of JavaScript 
within LoadRunner.

> This can get complicated. But help is just a phone call away.
  Call in the experts. Call us.


## Why Script LoadRunner in JavaScript language?

Writing in JavaScript is more comfortable to some.

> JavaScript code requires more memory and CPU to run than C code
  within LoadRunner load generators.
  About 50% more is the estimate.

### Obtain Sample Script with Utilities

0. Go to <a target="_blank" href="https://github.com/wilsonmar/LoadRunner">
   github.com/wilsonmar/LoadRunner</a>
   and either click <strong>Download ZIP</strong> then unzip it or
   fork the repo and clone it to your desktop if you would like changes.

   NOTE: This repo is actively improved over time,
   so forking and cloning is the recommended approach.

0. Use Finder or File Explorer to view a folder containing a sample
   script coded in JavaScript:

   <strong>WJS1_sample_WJS1250_v01</strong>

  This sample script contains a library of functions that provide both
  examples of JavaScript coding and 
  provides useful utilities.

> Use of some library functions such as md5 and SHA1
  for OAuth2 are explained in a separate tutorial by Wilson Mar.

To create a script folder containing your own application test code,
the options are:

1. Add your own application test code into this sample script.

2. Open a C-script saved immediately after recording and
   re-generate it into JavaScript,
   then copy the sample utility file into it.

3. Create a new folder, 
   then copy the sample library file into it, 
   as explained in the next section:

Alternately:

### Generate new script folder

To use VuGen to generate a LoadRunner script in JavaScript: 

1. Create a File as protocol <strong>Web HTTP/HTML</strong>.

2. Switch to Windows Explorer to see that the
   <strong>Action.js</strong> file was created 
   (rather than Action.c).
   
3. Switch back to VuGen.

4. In menu Record > Recording Options > Script, 
   click the drop-down for Scripting Language 
   to change from C to JavaScript.

### Config wi_library_init file in vuser_init

0. In General: Script, to the right of
   "Generate think time greater than threshold",
   double-click on the number (default 3) and change it to 0.

0. In the <strong>vuser_init</strong> file, add a call to 
   identify environment variables for the run:

   {% highlight JavaScript %}
   function vuser_init(){
      var rc=0;
      rc=wi_library_init();
      return rc;
   }
   {% endhighlight %}

   PROTIP: When definiting functions,
   put the curly braces immediately after the end parenthesis
   instead of the next line to make function definitions 
   different than calls to functions, using
   search specifications such as "){".

   NOTE: Function names beginning with "wi_" are defined within file
  <strong>wi_library.js</strong> obtained from GitHub.


What follows is a hands-on tutorial to show you the most important edits to make to LoadRunner scripts. 

> I write programs that makes these edits for you. Call me!


### Generate Recording to Recording File

PROTIP: Record into a file which is not executed so that whatever is generated can be gradually copy and pasted into a working script. And the script continues to be runnable after generation

NOTE: Not all script protocols are able to record within an existing script. Only scripts for Web, Java, WAP, Oracle NCA, or RTE Vuser script can be recorded this way.

NOTE: Each script file listed in the Action list is a separate 
.js file within the script folder. 

CHALLENGE: Create a separate file to receive generated code 
durng recordin, but will never be edited or executed
so its line numbers stay in sync with code generation logs.

1. Right-click on Actions in the Solution Explorer at the left.

2. Select Create New Action… from the pop-up.

3. Type "Recording". 

4. Press OK to dismiss the dialog. 

   The Recording.js file should appear among vuser_init, Action, etc.

### Remove custom files from Run-Time Logic

CHALLENGE: Remove extra custom files (such as Recording) 
from Run Logic so that it does not get executed automatically by LoadRunner.

1. Press F4 or menu Replay.

2. Click on Run-Time Settings 

3. Click Run Logic. 

4. Right-Click on Recording. 

5. Select <strong>Remove Item</strong>.

6. Click OK to dismiss the dialog.

7. Press Ctrl+Shift+F4 or menu File.

8. Click Save to save the script.

9. Make a recording using WebTours (after starting it).

10. Login as "jojo" with password "bean".
   Click Flights.
   In "Find Flights", click "Sign Off", then Stop recording.

  ![designstudio](https://cloud.githubusercontent.com/assets/10678180/14401664/43a45932-fdde-11e5-9e3a-b3cf5108a61e.png)

11.After code generation is done, Design Studio screen pops up.

12.Review the dynamic values. For example: Look this userSession value:

   ```
   118266.392466586zAiDDcHpfzcfDztQQpQzfDHf
   ```

   To understand the context of these values,
   use a text editor to read the recording generation log 
   and search for it.

13.Select those that need to be correlated and click on Correlate.

    NOTE: Design Studio can be reached manually by 
    clicking the ‘Design Studio’ button in the toolbar or 
    in the Design menu.

14.Run the generated script.

   NOTE: In Recording Options dialog. Automatic correlations are enabled/disabled by selecting the ‘Correlation Scan’ checkbox under     General > Code Generation.
   
   NOTE: Most application recordings require additional
   manual changes after recording.

<a name="CreateCustomScripts"></a>

### Create custom script files

PROTIP: Generally, it's best to leave the automatically 
created Action.js file with the fewest custom lines. 
This would reserve use of Action for more flexibility in the future.

0. Create a use case file to hold custom functions
   using the steps to create a file above. An example is
   WJS1_Access (if you are not building from the sample script).

   PROTIP: Specify a standard naming convention such as
   "WJS1" for the app under test, etc.

   Use cases for the Web Tours (WT3_) application include:

   * WT3_Tour
   * WT3_Booking

   &nbsp;

   PROTIP: With JavaScript, you also need to add custom files as
   an Extra File so functions within them are recognized.

0. Right-click on Extra Files in the Solution Explorer and
   select <strong>Add Files to Script ...</strong>.

0. Select the custom file name just created.

CAUTION: Deleting an entry under Extra Files, 
that physical file is deleted from the file system as well.

There is also a file <strong>WJS1_Config.js</strong> 
to hold functions configuring overall script behavior
such as printing and 
common start and end transaction handling.


### Create custom Access functions

You are likely able to use the typical functions defined
within WJS1_Access by doing a Replace-All command to
your custom app name.

* WJS1_Access_Landing()
* WJS1_Access_SignUp()
* WJS1_Access_SignIn()
* WJS1_Access_SignOut()
* WJS1_Access_Reset_Password()


### Create negative Access functions

Additional functions include:

* WJS1_Access_SignUp_error()
* WJS1_Access_SignIn_error()

Such <strong>negative test cases</strong> 
causing errors deliberately
may be useful because an app's error handling
sometimes have performance issues. 
But attention to them are usually
held for development until
additional time becomes available for scripting.

<hr />

## Basic edits to sample script

What follows are explorations of LoadRunner's JavaScript,
which is based on the
<a target="_blank" href="http://www.ecma-international.org/ecma-262/5.1/#sec-15.8.2.14">
ECMAScript 5.1 standard</a> followed by HTML4 browsers
such as IE8.

0. <a href="#IdRunConditions"> Capture and display run conditions</a>
0. <a href="#ControlOutputMessage"> Control message output</a>
0. <a href="#ForcePrint"> Force print then restore logging level</a>
0. <a href="#DefineVerbosity"> Define verbosity</a>
0. <a href="#UseReturnCodes"> Use return codes</a>
0. <a href="#DataInAttributes"> Specify Data Source Attribute</a>
0. <a href="#CustomCalls"> Code call details in a custom file</a>
0. <a href="#Randomize"> Randomize execution</a>
0. <a href="#Retries"> Retry execution</a>
0. <a href="#GenericFunctions"> Use generic functions</a>
0. <a href="#SpecifyLinkRetrieval"> Specify link retrieval mode</a>
0. <a href="#GenericStartStop"> Use generic Start and End Transaction</a>
0. <a href="#VaryThinkTime"> Automatically vary Think Time</a>
0. <a name="#CaptureResponses"> Capture response to be returned</a>
0. <a href="#VerifyResponses"> Verify response returned</a>
0. <a href="#HandleErrors"> Design error handling</a>

> In addition to these basic ones, 
  several TODO items are covered in private advanced courses.
  Call me to take the class.



<a name="IdRunConditions"></a>

### Capture and display run conditions

Among the first activities in <strong>wi_library_init()</strong>
is to capture and display conditions external to the script:

* Loggging and other specifications in Run-Time Settings
* Host name and IP address of the load generator running the script
* That plus the starting date and time of the run as the basis for a 
  an identifier unique in time and space.

A combination of JavaScript utilities, built-in LoadRunner functions, 
and custom library functions are used to obtain
and format the current date and time.

Conditions of the run are printed to the output log:

   {% highlight html %}
   Run-Time Settings > Log DebugMessage level=0.
   [X] Enable logging =1.
   Send messages:
       [X] Always =512.
   Detail level:
   [X] Standard log =16.
       [_] Parameter substitution =4.
       [_] Data returned by server =2
       [_] Advanced trace =8
   {% endhighlight %}

<a name="ControlOutputMessage"></a>

### Control message output

This output is created by calling a library function:

   {% highlight JavaScript %}
    wi_msg_level_print();
   {% endhighlight %}

That function contains LoadRunner print functions such as:

   {% highlight JavaScript %}
    lr.outputMessage(">> wi_msg_level_at_init = " + wi_msg_level_at_init +".");
   {% endhighlight %}

   PROTIP: Specify a special set of characters at the front of output messages
   so they are easy to identify among potentially many output lines.

NOTE: Message text in message functions are built using concatenation
rather than formatting codes in sprintf() functions.

CHALLENGE: Look in Help for other types of messages.

   NOTE: LoadRunner's lr.outputMessage() function 
   includes the script file name and line number 
   whereas LoadRunner's lr.logMessage function does not.


<a name="ForcePrint"></a>

### Force print then restore logging level

Conditions of the run are printed to the output log regardless of the
log settings by inclusion of a library function:

   {% highlight JavaScript %}
   wi_msg_force_print();
   {% endhighlight %}

Output according to the log level selected in Run-time settings
is honored by the rest of the script by this library function:

   {% highlight JavaScript %}
   wi_msg_print_reset();
   {% endhighlight %}

CHALLENGE: Add this pair of functions around message functions
you want to force printing anywhere in your script 
even though logging is not enabled:

   {% highlight html %}
   wi_msg_force_print();
   lr.outputmessage(...);
   wi_msg_print_reset();
   {% endhighlight %}


<a name="DefineVerbosity"></a>

### Define verbosity

> Our advanced workshops goes through use of additional
   functions which enable you to specify levels
   used in the popular Log4J library for Java and other platforms.

   * Info - shows essential run conditions.
   * Error - shows conditions of concern.
   * Warning - shows conditions which may be of concern.
   * Trace - shows major conditions, such as a line for each iteration and row processed.
   * Debug - shows minor conditions, such as data considered for processing.

An example of a Trace level statement is:

   {% highlight JavaScript %}
    WJS1_Config_print_trace();
    lr.outputMessage(">> Action Iteration=" + lr.evalString("{pIteration}") +".");
    wi_msg_print_reset();
   {% endhighlight %}


<a name="UseReturnCodes"></a>

### Use return codes

PROTIP: Code a return code variable to receive values returned from
functions called, then if an error occured, return execution up
to the caller rather than continue to the next statement.

This is especially on blocking errors such as landing and login.

The simplest example of error handling is in the main Action() file
in the sample script:

   {% highlight JavaScript %}
   var rc=0;
   rc=WJS1_Access_loop();
   if( rc != 0 ){ return rc; }
   {% endhighlight %}


CHALLENGE: Define a strategy for how to deal with errors,
especially during stress test runs.

> On advanced editions of this course,
  LoadRunner functions are used to stop on various levels of error.


<a name="DataInAttributes"></a>

## Specify Data Source Attribute

In the sample script, there is coding making use of the
<strong>RunDataIn</strong> JavaScript variable defined at the top
of the vuser_init script file.

NOTE: Variables defined the first function in a file 
are <strong>global</strong> variables.

`lr.getAttribString("RunDataIn");` obtains a value from
the script's Run-Time Settings UI or from the LoadRunner Scenario
at Run-Time.

In the vuser_init file, a default value is enforced by this code:

   {% highlight html %}
    if( RunDataIn === undefined){
      RunDataIn = "1"; // the default, not "FILE" or "VTS".
      lr.outputMessage(">> RunDataIn not defined. Using default "+ RunDataIn +".");
    }else{
      RunDataIn = RunDataIn.toUpperCase();
    }
   {% endhighlight %}

For attributes that have a limited number of values,
the various values are tested so that if the value specified
is not recognized by the code, an error condition can be issued
at the beginning of the script rather than later during the run.

In the <strong>WJS1_Access_loop()</strong> function with the sample
WJS1_Access script file,


<a name="CustomCalls"></a>

### Code call details in a custom file

PROTIP: Most experienced LoadRunner engineers hand-craft calls.
They use code generated from recordings to analyze coding patterns.

Rather than leaving all the details of calls in the Action.js file,
details are moved to a separate file such as WJS1_Access,
leaving high-level calls such as this:

   ```
   rc=WJS1_Access_landing( "T01_landing","http://contoso.net/",100);
   ```

PROTIP: Name functions beginning with the name of the 
file within which they are defined.


<a name="Randomize"></a>

### Randomize execution

There are some situations where requests are not executed 100%
but occassionally.
The code here can be used to execute something 72.3% of the time.
That static number can be substituted with another number or a variable.

   {% highlight html %}
  var trans_random_number = 72.3;
      wi_random_seed = Math.random() * 100 ;
  if( wi_random_seed <= trans_random_number ){
    lr.outputMessage(">> Within range. wi_random_seed = " + wi_random_seed + " <= " + trans_random_number );
    // Do stuff
    // ...
  }else{
    lr.outputMessage(">> Out of range. wi_random_seed = " + wi_random_seed + " NOT <= " + trans_random_number );
  }
   {% endhighlight %}

The seed is between 0 and 100 because the number obtained from the 
JavaScript randomizer is a number between zero and 1,
multiplied by 100.

The <strong>wi_random_seed</strong> variable is defined when
the <strong>wi_library_init()</strong> function within the wi_library 
is executed within vuser_init.

To obtain distribution, consider 
<a target="_blank" href="http://jsfiddle.net/dje3z093/1/">
this</a> technique that produces a "bell curve" of numbers 
clustered around .5 between 0 and 1.

<a name="GenericFunctions"></a>

### Use generic functions

The wi_library.js file contains several generic functions such as
function WJS1_Access_landing() called from the sample Action file.

    ```
    rc=wi_web_url_http( in_trans , in_url );
    ```

Look at file wi_library.js and scroll to the above-mentioned function.
Notice there are two similar functions:

  * wi_web_url_html( in_trans , in_url ){
  * wi_web_url_http( in_trans , in_url ){

The sample code in these function's definition contain retry logic.


<a name="Retries"></a>

### Retry execution

During stress test runs, the server may not be respond to some requests.
Such behavior should not cause the script to stop because
the whole point of the script is to create stress conditions.

However, there needs to be a limit on how many times a particular 
request (with a particular set of data values) are retried.

That limit is specified by the <strong>Retries</strong> 
Run-time attribute. A zero value (the default) means no retries occur.

{% highlight JavaScript %}
function wi_web_url_http( in_trans , in_url ){
   var rc=0;
   var i=0;
   
   for( i = 1; i < Retries; i++ ){ 

      rc=wi_web_url( in_trans , in_url, "HTTP" );
      if( rc == 0 ){
        break;
      }
      // else loop back.
    }
   return rc;
}
{% endhighlight %}

<a name="SpecifyLinkRetrieval"></a>

### Specify link retrieval mode 

The wi_web_url() function called contains this:

   {% highlight html %}
   web.url({
    name : in_trans, 
    url :  in_url, 
    targetFrame : '', 
    resource : 0, 
    recContentType : 'text/html', 
    referer : '', 
    snapshot : 't1.inf', 
    mode : in_mode
   });
   {% endhighlight %}

NOTE: A value in <strong>referer</strong> is
not needed with the Web Tours sample application which does not use it.

NOTE: The `mode: ` activates a feature of LoadRunner which 
scans the html returned and issue requests for 
links to CSS, JavaScript, images, etc.

(Images specified within CSS are not retrieved this way)

CHALLENGE: Change to `mode: HTTP` for LoadRunner to NOT request links as well.
Generate just individual resource requests during recording by setting:

   <img src="/images/LR1250 Recording Recording option 1034x204.png">

The <strong>in_mode</strong> variable is obtained from the function
which called it:

  * `rc=wi_web_url( in_trans , in_url, "HTML" );`
  * `rc=wi_web_url( in_trans , in_url, "HTTP" );`

To recap, there are several levels of generic functions:

   * Generic function called by application custom code 
   contain retry logic, such as `wi_web_url_http()`.

   * Generic functions called by those functions
   in turn call LoadRunner built-in functions such as `web_url()`.
   Such are displayed in red by VuGen.

PROTIP: Using generic functions reduce the amount of code. 
The less coding, the smaller the script's memory footprint.
Smaller scripts allow for more Vusers to fit into available memory on load generator machines.

NOTE: Generic functions do not contain message output.


<a name="GenericStartStop"></a>

### Use generic Start and End Transactions

The lowest-level functions surround LoadRunner call functions are
surrounded by a pair of wi_library functions:

   ```
   WJS1_Config_StartTrans( in_trans );
   ```

   and

   ```
   rc=WJS1_Config_StartTrans( in_trans , rc );
   ```

PROTIP: Specify Start and End transactions names using a parameter
("in_trans") so the code is more easily pastable and 
there is no danger of typos in transaction start vs. end names,
avoiding the most common cause of runs being aborted.

<a name="VaryThinkTime"></a>

### Automatically vary Think Time

PROTIP: Putting think-time functions within a generic start and end function
ensures eliminates a common coding error of 
having think time statements placed after start transaction statements that make think time and data preparating time 
be counted in the transaction time.

   {% highlight html %}
   lr.thinkTime( nThinkTimeSecs );
   {% endhighlight %}

The variable <strong>nThinkTimeSecs</strong> is defined at the top
of the sample vuser_init script file.

CAUTION: Think times are only added during the run
if Run-Time Settings has been set to do so:

<img width="495" alt="lr1250 rts think time replay" src="https://cloud.githubusercontent.com/assets/300046/14413611/72c4aa1e-ff3c-11e5-9ca7-256effd1ff46.png">


<a name="CaptureResponses"></a>

### Capture response to be returned

How do you know whether the correct screen was returned?

PROTIP: After each user action, use script code to verify whether response from the server is what is expected (positive or negative).

LoadRunner provides several functions. 

   * web.regFind() 
   registers a search for a text string for the next action function.

   * web.regSaveParamEx 
   registers a request to save dynamic data located between specified boundaries to a parameter.

   * web.regSaveParamJson
   registers a request to save dynamic data in an buffer that has been formatted as Json. The data is saved to a parameter.

   * web.regSaveParamRegexp 
   registers a request to save dynamic data that matches a regular expression to a parameter.

   * web.regSaveParamXpath 
   registers a request to find dynamic data in an HTML buffer that has been formatted as XML and save the data to a parameter.

CHALLENGE: Look for additional information
on these functions in VuGen Help on LoadRunner's Functional Reference

This call searches for text in the Body (rather than HTTP header)
to be returned from the server:

   {% highlight JavaScript %}
    if( in_title ){
        web.regFind({
           search : 'Body',
//           relFrameId: '',
//           fail : 'NotFound',
           saveCount : 'title_found_count',
           text : in_title
        });
    }
   {% endhighlight %}

The regFind() function is invoked only there is a title to be compared,
within the in_title variable provided as part of the call.

This function is in the start transaction code because, as the 
"reg" in the function name implies, <strong>registers</strong>
the evaluation to be carried out as the response streams in.

Evaluation of the response is performed in 
the endTransaction() function.

The `relFrameId` attribute refers to the HTML frame to search in.

VuGen does not record such functions. They must either be manually coded into the script. The VuGen UI provides a way to insert the function using a mouse. 

This is a simple approach to <strong>stop execution</strong> 
with an error at the point in the script
that makes the call related to the above code.

NOTE: The fail attribute specifies whether finding the string specified
if it's Found or NotFound.


<a name="VerifyResponses"></a>

### Verify response returned

In the endTransaction function, the `title_found_count` specified
in registration function is examined:

   {% highlight JavaScript %}
   if( lr.evalString("{title_found_count}") == "0" ){
      // Not found 
   }
   {% endhighlight %}

The `title_found_count` in registration functions specify the name of a
<strong>LoadRunner parameter</strong>, 
which transcends all JavaScript functions.

The parameter is also a string, so needs to be converted to a number
to do arithmetic.

What to do about information that the web page title is found or not
in the response depends on the application.
But most web pages do contain a title.

CHALLENGE: Look at the Help screen for the function to come up with a way to  
fail if the text is found (such as an error message).


NOTE: An error is raised immediately if the text is not found,
but at where the request is made, not at this script line 
which registers the capture during request execution.


### For loops

   {% highlight html %}
   for (i = 0; i < count; i++) {
       // code block.
   }
   {% endhighlight %}

* "i = 0" is executed before the loop (the code block) starts.

* "i < count" defines the condition for running the loop (the code block).

* "i++" is executed each time after the loop (the code block) has been executed.


### Additional JavaScript libraries

These are of interest. I haven't tested them yet.
So please let me know what you find.

* <a target="_blank" href="http://momentjs.com/">
  Moment.js</a> is a lightweight JavaScript date library for parsing, manipulating and formatting dates.

* <a target="_blank" href="http://momentjs.com/timezone/">
  Moment.js/timezone</a> parses and displays dates in any timezone.

* <a target="_blank" href="http://www.boilerjs.com/">
  boilerjs.com</a>
  which provides 115 methods to make it easier to work with arrays, collections, functions, numbers, objects, and strings. It's the JavaScript equivalent of a Swiss Army Knife.

* Underscore.js

* <a target="_blank" href="https://github.com/caolan/async">
  github.com/caolan/async</a>
  provides around 70 functions that include the usual 'functional' suspects (map, reduce, filter, each…) as well as some common patterns for asynchronous control flow (parallel, series, waterfall…).

NOTE: To save space (and memory while running),
mimify JavaScript to remove "white space" such as spaces and tabs.

<hr />

### Get Image by Screen Name

LoadRunner can generate script code like this based on the text of the link
(rather than the URL of the link):

{% highlight html %}
web.image(
{
name : 'Search Flights Button', 
alt : 'Search Flights Button', 
snapshot : 't3.inf'
}
);
{% endhighlight %}



### Submit form to Sign-up

To submit an HTML form:

{% highlight html %}
web.submitForm(
{
name : 'login.pl_2', 
snapshot : 't11.inf', 
itemData :  [
{name : 'username', value : '{UserIds_userid}'},
{name : 'password', value : '{UserIds_pwd}'},
{name : 'passwordConfirm', value : '{UserIds_pwd}'},
{name : 'firstName', value : ''},
{name : 'lastName', value : ''},
{name : 'address1', value : ''},
{name : 'address2', value : ''},
{name : 'register.x', value : '53'},
{name : 'register.y', value : '3'}
]
}
);
{% endhighlight %}

Some of the fields, such as register.x, can be marked hidden within the form
captured by LoadRunner.

### Submit data to POST Sign-in

{% highlight html %}
web.submitData(
{
name : 'login.pl', 
action : '{pProtocolHostPort}/cgi-bin/login.pl', 
method : 'POST', 
recContentType : 'text/html', 
referer : '{pProtocolHostPort}/cgi-bin/nav.pl?in=home', 
snapshot : 't2.inf', 
mode : 'HTML', 
itemData : 
    [
    { name : 'userSession', value : '{userSession}' }, 
    { name : 'username', value : '{UserIds_userid}' }, 
    { name : 'password', value : '{UserIds_pwd}' }, 
    { name : 'JSFormSubmit', value : 'on' }, 
    { name : 'login.x', value : '42' }, 
    { name : 'login.y', value : '8' }
    ]
  }
);
{% endhighlight %}


## Additional topics

* To keep memory use low, instead of large parameter files,
  use VTS (Virtual Table Service) on a separate machine.


## Resources to Learn JavaScript

There are many tutorials which teach JavaScript string manipulation and other topics:

* <a target="_blank" href="http://freecodecamp.com">freecodecamp.com</a>
  has learners use tutorials on codeacademy.com and other sites, then adds
  quizzes, all for free.
