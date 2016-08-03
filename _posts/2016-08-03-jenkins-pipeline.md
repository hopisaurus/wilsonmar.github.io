---
layout: post
title: "Jenkins 2 Pipeline"
excerpt: "The slaves have taken over as agents"
tags: [Jenkins, setup]
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

This describes use of Jenkins version 2.

{% include _intro.html %}


The objective of Jenkins2 is to install with a 
<a href="#RecommendedPlugins">recommended set of plugins</a>
that cover 80% of use cases out of the box.

This assumes that you have followed 
[Jenkins Setup](/jenkins-setup/) to install the latest version of Jenkins,
which went Version 2 April 26, 2016.

### Find and Select Jenkins Plugins #

Here is a generic set of steps to install a plug-in:

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.

   <amp-img width="362" height="285" alt="jenkins createuser_01b-362x285-t69" src="https://cloud.githubusercontent.com/assets/300046/17301184/f763c996-57d2-11e6-8b28-1faf907a3b60.png"></amp-img>

0. Click **Manage Plugins** to http://.../pluginManager/

   <amp-img width="650" height="53" alt="jenkins manage plugins 2016-08-01-650x53-i11.jpg" src="https://cloud.githubusercontent.com/assets/300046/17295483/95b3f7d4-57b9-11e6-94af-d8183f3ec77d.jpg"></amp-img>

0. Click **Installed** tab to view what has been installed already.
0. Click **Available** tab to http://.../pluginManager/available
0. Click **Advanced** tab and scroll to the bottom to see the 
   Update Site URL for the source of plugins listed:

   <pre>
   http://updates.jenkins-ci.org/update-center.json
   </pre>

   Notice the host name "jenkins-ci.org".

   NOTE: You can upload a plugin file with the file extension <strong>.hpi</strong> to folder
   &LT;jenkinsHome>/plugins/

   On a Mac, the jenkinshome is <strong>~/.jenkins</strong>.


0. View the <a target="_blank" href="http://wiki.jenkins-ci.org/display/JENKINS/Plugins">
   Wiki on Plugins</a>.

   PROTIP: The wide variety of plugins is why Jenkins is popular.


   * http://www.praqma.com/stories/top-jenkins-plugins/
   * http://zeroturnaround.com/rebellabs/top-10-jenkins-featuresplugins/
   * https://uttamkini.com/2012/12/01/jenkins-plugins-that-every-team-must-use/
   * http://www.hugeinc.com/ideas/perspective/list-of-useful-jenkins-plugins
   * http://devops.com/2015/01/15/15-must-jenkins-plugins-increase-productivity/
   * https://wiki.jenkins-ci.org/display/JENKINS/Plugin+Installation+Statistics
   is broken
   <br /><br />

0. Click on a category (such as ".NET Development") to contract or expand items in each category.

   PROTIP: There are dozens of categories, so it may be easier to search for plugins by name
   or from the list of categories online at <br />
   <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Plugins">
   https://wiki.jenkins-ci.org/display/JENKINS/Plugins</a>

   ### Install Green Balls icon plugin #

0. In the Filter field at the upper right of the screen, type "Green Balls",
   which is one of the most popular among DevOps people who can't stand that 
   the Jenkins default for healthy (successful) is blue, not green.
   (<a target="_blank" href="https://jenkins.io/blog/2012/03/13/why-does-jenkins-have-blue-balls/">
   due to a historical/cultural artifact</a>).

   PROTIP: When a plugin is installed, Jenkins removes that plugin among the "Available"
   and shows the plugin among the "Installed".
   
0. When you click the name of a plug-in you'll be sent to another website, such as:<br />
   <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Green+Balls">
   https://wiki.jenkins-ci.org/display/JENKINS/Green+Balls</a>

0. Return to the previous screen: Hit the browser return key or command + left arrow.

   PROTIP: Instead of clicking plugin names, right-click to 
   <strong>open link in New Tab</strong> on your browser
   so a tab with the Jenkins icon remains among browser tabs.

0. Return to the root console page (by clicking "Jenkins" at the upper left corner).

0. Click "S" among "S M L" under the icons to show Small icons.


## Restart Jenkins server #


0. [0:42] Install "Git Plugin"
   https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin<br />
   to provide Git client functionality on Jenkins servers.

0. PROTIP: Restart Jenkins by changing the URL from:

   <pre>
   http://.../pluginManager/installed
   </pre>

   to

   <pre>
   http://.../restart
   </pre>

   Click Yes to "Are you sure".

   "Please wait while Jenkins is restarting".

0. [1:41] Create a Jenkins Freestyle project, OK.

0. [2:01] The <strong>Source Code Management</strong> section, select <strong>Git</strong>.

0. [2:15] Enter your repo, with the .git at the end.

   The plugin makes a call such as:

   <pre>
   git ls-remote -h https://github.com/hotwilson/box.git HEAD
   </pre>

   NOTE: When done on my Mac Terminal, this returns nothing.

   If you <a target="_blank" href="http://stackoverflow.com/questions/36126664/jenkins-git-repo-url-error">(like others)</a>
   get the error message <br />
   "Failed to connect to repository : Error performing command:"

0. [2:15] If your repo is private, provide your SSH keys.

   https://developer.github.com/guides/managing-deploy-keys/
   
   https://docs.docker.com/docker-hub/builds/



## Jenkins 2 Pipeline Plugin #

Instead of manually clicking through the Jenkins UI, the 
<a target="_blank" href="https://jenkins.io/solutions/pipeline/">
Pipeline plugin</a> in Jenkins 2
by author Jesse Glick (<a target="_blank" href="https://twitter.com/tyvole/">@tyvole</a>)
reads a text-based <strong>Jenkinsfile</strong>
Groovy script code checked into source control.

0. Install the "Pipeline" (in Manage Jenkins, Manage Plugins, Available) at<br />
   https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin

0. Right-click to open in a new tab the 
   "See Pipeline as Code with Jenkins for more details" "link at<br />
   <a target="_blank" href="https://jenkins.io/solutions/pipeline/">
   https://jenkins.io/solutions/pipeline</a>

0. Return to the root console page (by clicking "Jenkins" at the upper left corner).

0. Click <strong>New Item</strong> at http://.../view/All/newJob

0. Enter item name and click "Pipeline", then OK. ("Orchestrates long-running activities that can span multiple build slaves. Suitable for building pipelines (formerly known as workflows) and/or organizing complex activities that do not easily fit in free-style job type.").

0. Among Build Triggers click "Build when a change is pushed to GitHub".

0. Click "GitHub project". 

0. For Project url: https://github.com/hotwilson/box.git

   NOTE: The word "slave" and "node" and "computer"
   have been replaced with the word "agent".

0. Click "Advanced" and type the Display name, "Box" in our example.

0. Click "Pipeline" tab to bring that section up.

0. Select from the "try sample" pull down "Hello World".

   Notice the Groovy script:

   <pre>
node {
   stage 'Stage 1'
   echo 'Hello World 1'
   stage 'Stage 2'
   echo 'Hello World 2'
}
   </pre>

0. Click Save for the item screen.

0. Double-click on "Build Now" (in rapid succession).

   A sample response:

   <amp-img width="490" height="277" alt="jenkins2 build hello-world-490x277-i38.png" src="https://cloud.githubusercontent.com/assets/300046/17341552/59559492-58b2-11e6-84a1-f1acade300ae.png"></amp-img>
   NOTE: Text in headings were specified in state keywords in the Groovy script above.

   PROTIP: Only click once on Jenkins links or two executions will result from a double-click.

   ### Run results #

0. Cursor over one of the "ms" numbers (for milliseconds or thousands of a second) 
   in the green area and 
   click the Log button that appears.

   A pop-up appears with the text specified by the echo command within the Groovy script.

0. Click the "X" at the upper-right of the dialog to dismiss it.

0. To remove the menu on the left, click "Full Stage View".

   PROTIP: The "full stage view" will be needed when there are more stages going across the screen.

   ### Build History #

0. To return to the menu with Build History, <br />
   click the item/job name in the breadcrumbs or press command+left arrow.

0. Click one of the jobs in the Build History section in http://.../job/box/5/

   Notice the number in the URL corresponds to the number listed.

   PROTIP: The time of the run is the server's time, not your local time on your laptop.

0. Click "Console Output" for log details created from that run.

## Latest Info about Pipeline #

Tweet #Jenkins2


## Info about Pipeline #

* <a target="_blank" href="https://jenkins.io/doc/pipeline/">
   https://jenkins.io/doc/pipeline = Getting Started with Pipeline</a>
* https://jenkins.io/solutions/pipeline/
* https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin
* https://github.com/jenkinsci/pipeline-plugin/blob/master/README.md#introduction
* https://jenkins.io/blog/2015/12/03/pipeline-as-code-with-multibranch-workflows-in-jenkins/


## Info about Pipeline #

If you prefer videos, these are specifically about Jenkins 2.0+

Pipeline author Jesse Glick (<a target="_blank" href="https://twitter.com/tyvole/">@tyvole</a>)

   * <a target="_blank" href="https://www.youtube.com/watch?v=_aLPahlSFHU">
   Jenkins Workflow: security model &amp; plugin compatibility
   Aug 2015</a>

Jenkins creator Kohsuke Kawaguchi (Creator of Jenkins and CTO of Cloudbees)
<a target="_blank" href="https://www.youtube.com/channel/UCT_pjuBAYn6Sm_u4YJt59Rw">
YouTube channel</a> :

   * <a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0/">
   Jenkins 2.0 Virtual Conf. (take 2) 
   4 May 2015</a>

      * Grow with you from simple to complex
      * Text-based, in your VCS
      * Handle lots of jobs without repetition
      * Survive Jenkins restart
      * Brings next level of reuse to Jenkins

   * <a target="_blank" href="https://www.youtube.com/watch?v=2eVyc_n8i1c/">
   on 7 Oct 2015</a>



   * <a target="_blank" href="https://www.youtube.com/watch?v=fl5xfqtiNko/">
   Jenkins 2.0 Virtual Conf. 2015</a>

<a target="_blank" href="https://se.linkedin.com/in/robertsandell/">
Robert "Bobby" Sandell</a>
(<a target="_blank" href="<a target="_blank" href="https://www.rsandell.com/">rsandell.com</a>), 
Software Engineer at Cloudbees Stockholm since June 2010
has these videos:

   * <a target="_blank" href="https://www.youtube.com/watch?v=_iFtmp72p_E">
   Jenkins pipeline plugin demo</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=M-rxJBdYIrw">
   Jenkins 2.0. What? When? What is in it for me?</a>

Jim Leitch

   * <a target="_blank" href="https://www.youtube.com/watch?v=th_0jGRTnJ4">
   Jenkins 2.0 What's is new?</a>

James Nord

   * <a target="_blank" href="https://www.youtube.com/watch?v=PsgQ4v4aBhA">
   Jenkins 2.0 and Beyond (and Q&A)</a>



### GitHub to Jenkins #


   ### Install GitHub plugin #

https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin


### NodeJS Plugin #

https://wiki.jenkins-ci.org/display/JENKINS/NodeJS+Plugin

also installs Grunt
http://gruntjs.com/getting-started

### Plug-in files #

0. Switch to Terminal to open a new command line window and
   navigate to the hidden Jenkins folder to view files:

   <pre><strong>
   cd ~/.jenkins
   cd plugins
   ls -al
   </strong></pre>

   NOTE: Each plug-in has a <strong>.jpi</strong> binary file for each folder which contains a META-INF and WEB-INF folder.

0. To provision a Docker box, this Gist script<br />   
   https://gist.github.com/micw/e80d739c6099078ce0f3

   does not require Jenkins to be running. 
   It does the following:

   * Download one or more plugins to the plugin directory
   * Scan all plugins in that directory for missing dependencies
   to download those dependencies as well
   * Loop until no open dependencies are left.
   
0. To install a Git client in the Console:

   <pre><strong>
   curl -XPOST http://localhost:8080/pluginManager/installNecessaryPlugins -d '<install plugin="git@current" />'
   </strong></pre>


### Rake Environment Variable #

0. In the Manage Jenkins menu, click Configure System.
0. Check Environment variables under the Global properties section.
0. Click Add.
0. In the name value, type "PATH".
0. In the value field, type "$PATH /usr/local/bin" for Linux or OSX.

   Alternately, on Windows type "???". TODO:

<a id="MorePlugins"></a>

## More plug-ins #

<a name="BasePlugins"></a>

### Base Plug-ins #

   * Email Extension Plugin
   * Git Plugin
   * Graddle Plugin
   * SSH Slaves
   * Translation Assistance
   * Workspace Cleanup Plugin
   
### For Microsoft developers #

   * MSBuild
   * MSTest
   * MSTest Runner
   * VSTest Runner

<a id="OtherPlugins"></a>

### Other plugins #

<a target="_blank" href="https://www.cloudbees.com/jenkins/jenkins-certification">
Cloubees' Study Guide PDF</a>
lists these plug-ins that all Certified Jenkins Engineers should know:

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Script+Security+Plugin">
   Script Security Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Trigger+Plugin">
   Parameterized Trigger Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Credentials+Plugin">
   Credentials Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Fingerprint+Plugin">
   Fingerprint Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Amazon+EC2+Plugin">
   Amazon EC2 Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin">
   Docker Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Folders+Plugin">
   CloudBees Folders Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Disk+Usage+Plugin">
   Disk Usage Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Workflow+Plugin">
   Pipeline Plugin (formerly known as Workflow)</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin">
   Build Pipeline Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Delivery+Pipeline+Plugin">
   Delivery Pipeline Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Build+and+Publish+plugin">
   CloudBees Docker Build and Publish Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Promoted+Builds+Plugin">
   Promoted Builds Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin">
   Git Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Copy+Artifact+Plugin">
   Copy Artifact Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin">
   JUnit Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Matrix+Project+Plugin">
   Matrix Project Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/NodeLabel+Parameter+Plugin">
   NodeLabel Parameter Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Radiator+View+Plugin">
   Radiator View Plugin</a>

* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Email-ext+plugin">
   Email-ext Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Jabber+Plugin">
   Jabber Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Mailer">
   Mailer Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/IRC+Plugin">
   IRC Plugin</a>
* <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/SMS+Notification">
   SMS Notification Plugin</a>
* https://wiki.jenkins-ci.org/display/JENKINS/Skype+Plugin">
   Skype Plugin</a>

<hr />

### Safe Restart Plugin #

Some install the 
<a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/SafeRestart+Plugin"> 
SafeRestart plug-in</a> which adds the <strong>Restart Safely</strong> option to the 
<a title="jenkins saferestart_plugin" href="https://cloud.githubusercontent.com/assets/300046/12584913/9681b1d2-c3fe-11e5-9359-e51fc5809734.png">
Jenkins left menu</a> to avoid needing to be at the server console at all.


<a id="JMeterPlugin"></a>

## JMeter plug-in #

QUESTION: Are there more plug-ins for JMeter?

### JMeter Performance Plug-in for JMeter #

WARNING: This is no longer maintained, with a large <a target="_blank" href="https://issues.jenkins-ci.org/browse/JENKINS-28426?jql=project%20%3D%20JENKINS%20AND%20status%20in%20(Open%2C%20%22In%20Progress%22%2C%20Reopened)%20AND%20component%20%3D%20'performance-plugin">bug list</a>.

To add the
<a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Performance+Plugin"> 
Performance plug-in</a> to display results from JMeter runs:

1. Click the Manage Jenkins link.
2. Click the Manage Plugins link.
3. Select the Available tab.
4. In Filter type "Performance".
5. Check to select "Performance plugin".
6. Click "Download now and install after restart".
7. Click to restart server.

If you prefer a manual approach:

0. Create a folder to hold the folder created during cloning (such as jmeter or jenkinsci).
1. cd to that folder, then:

   ```
git clone https://github.com/jenkinsci/performance-plugin.git performance
cd performance
   ```
   
   This contains a pom.xml file for Maven to compile the src folder.
   
0. If you haven't already:

   ```
brew install maven
   ```
   
0. Compile in a command window:

   ```
mvn package
   ```

   This downloads a bunch of files specified as dependencies, ending in this:
   
   ```
   [INFO] Total time: 09:20 min
[INFO] Finished at: 2016-01-26T08:31:04-08:00
[INFO] Final Memory: 52M/259M
   ```

0. Get the address of the Jenkins server. To find (ignoring case)

   ```
   find . -iname "jenkins.war"
   ```

0. Copy to the target server the .hpi file which <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Plugin+Structure">defines a plug-in</a>:

   ```
cp <target>/performance.hpi <path_to_jenkins>/data/plugins
   ```

0. To fix <a target="_blank" href="http://stackoverflow.com/questions/33126279/jenkins-performance-plugin-for-jmeter">this</a>
switching report format to xml in jmeter properties file:

   ```
   jmeter.save.saveservice.output_format=xml
   ```

0. Configure the search pattern to select the files to be parsed by the Performance plugin. JMeter generates <strong>.jtl</strong> files.

0. Configure the error percentage thresholds which would make the project unstable or failed 

  
0. When no jobs are running, restart the Jenkins server to reload the plugin.

## Read more about plugins #

   * http://wiki.jenkins-ci.org/display/JENKINS/Checking+out+existing+plugins
   * http://wiki.jenkins-ci.org/display/JENKINS/Plugin+tutorial
   * http://wiki.jenkins-ci.org/display/JENKINS/Hosting+Plugins
   * https://www.blazemeter.com/blog/continuous-integration-101-how-run-jmeter-jenkins
   * https://www.linkedin.com/pulse/continuous-automated-web-tests-using-jenkins-jmeter-mahanta

   * https://dzone.com/articles/orchestrating-workflows-with-jenkins-and-docker

   * https://github.com/jenk

   * http://udaypal.com/jenkins-workflow-getting-started/

## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
