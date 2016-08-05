   <amp-img width="490" height="277" alt="jenkins2 build hello-world-490x277-i38.png" src="https://cloud.githubusercontent.com/assets/300046/17341552/59559492-58b2-11e6-84a1-f1acade300ae.png"></amp-img>


[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)


## Infrastructure as code #

We would like to treat Jenkins configuration settings as code.

   ### Configure permissions to repo #

0. 

   ### Install SCM plug-in #

0. In Manage Jenkins, Manage Plugins, among Available, in Filter enter enough of 
   <strong>"SCM Sync Configuration Plugin"</strong>
   to check it for install. Its URL is <br />
   <a target="_blank" href="http://wiki.jenkins-ci.org/display/JENKINS/SCM+Sync+configuration+plugin">
   http://wiki.jenkins-ci.org/display/JENKINS/SCM+Sync+configuration+plugin</a>

   "This plugin allows you to synchronize your hudson configuration files with an SCM, 
   allowing you to specify a commit message every time a config file is modified.""

   NOTE: "Hudson" is still referenced even in Jenkins2. Just ignore it.


   ### Configure repo #

0. In Manage Jenkins, Configure System, notice

   /var/lib/jenkins

0. In "SCM Sync Configuration", select Git and type in the Git repo
   where your Jenkins configuration resides. In our example:

   https://github.com/hotwilson/box.git

   PROTIP: Jenkins should detect when there is a change to Jenkins configuration
   and update the repo with a pop-up commit message such as this:
   <amp-img width="497" height="183" alt="jenkins2 scm on change 20160805-497x183-i21.jpg" src="https://cloud.githubusercontent.com/assets/300046/17452244/9f7af2da-5b2a-11e6-9cf0-ea6e1beb6e4e.jpg"></amp-img>

0. Check "Display SCM Sync Status".

0. Click Save.




0. [0:42] Install "Git Plugin"
   https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin<br />
   to provide Git client functionality on Jenkins servers.

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



<amp-youtube data-videoid="ISAUsBSI8G0" layout="responsive" width="480" height="270">
</amp-youtube>
This "Jenkins Tutorial - Part 03: Git Integration & Configuring jobs using Git".



An example Groove script:

<pre>
with.node('linux') {
git(url: 'git://server/myapp.git')
sh('mvn clean package')
archive('target/myapp.war')
stage('Test')
parallel({
sh('mvn -Psometests test')
}, {
sh('mvn -Pothertests test')
})
input('OK to deploy?')
stage(value: 'Deploy', concurrency: 1)
sh('mvn deploy')
} 
</pre>





## Dockerfile #

   <pre>
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
   </pre>

Installation of Docker-compose using pip is specified in a Dockerfile by:

   <pre>
RUN pip install docker-compose==${DOCKER_COMPOSE:-1.6.2} && \
    pip install ansible boto boto3
   </pre>

   CAUTION: Docker does not pull in the entire tree of dependencies like package managers do.


------

git ls-remote 
503ea56a890abbc5373b34242d95ca7701a7e394  HEAD
503ea56a890abbc5373b34242d95ca7701a7e394  refs/heads/master
cd82ccc7d372b8e0982d7e95b30a70ca2352b1d1  refs/pull/2/head
7ed5bd7f134819ea5a3d90a1d5ec7f83a7545381  refs/tags/username-pub-rsa

https://blog.bartbania.com/docker/jenkins-github-docker/

https://github.com/wakaleo/jenkins-the-definitive-guide-book
https://jenkins.io/doc/book/pipeline-as-code/

This will help you trigger jenkins builds from github.

https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin

   Directions for installation should be on the Jenkins web page.


0. In the Filter field at the upper right of the screen, type "Skype"
   for the "Skype Notifier plugin" at<br />
   https://wiki.jenkins-ci.org/display/JENKINS/Skype+Plugin

   Notice the <strong>Latest release date</strong>: May 14, 2011 

   Also notice it requires the https://wiki.jenkins-ci.org/display/JENKINS/Instant+Messaging+Plugin

   PROTIP: Watch out for obsolete plugins.

0. Check out<br />
   https://wiki.jenkins-ci.org/display/JENKINS/Slack+Plugin





Jenkins extras


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

It's 
People manage <strong>assets</strong>, what the company owns, 
such as trucks, buildings, computers, and other equipment.

Asset models

ThetaRay
Anomaly Detection

   * <a target="_blank" href="https://github.com/predixdev/">
   https://github.com/predixdev</a>



<a name="JenkinsIn"></a>

## Setup Jenkins Instance #

There are several options to creating

   * On a MacOS OSX MacBook for local development and experimentation

   * On a Windows 10 laptop for local development and experimentation

   * <a target="_blank" href="https://www.digitalocean.com/community/tutorials/how-to-set-up-jenkins-for-continuous-development-integration-on-centos-7">
   As a Jenkins instance in CentOS 7 droplet within Digital Ocean</a> SaaS cloud.

   * <a target="_blank" href="https://www.cloudbees.com/blog/jenkins-docker-hub-plugin-image-based-workflows">
   As a Jenkins instance within Cloudbees</a> SaaS cloud.

   * <a target="_blank" href="https://docs.pivotal.io/cloudbees/Jenkins.html">
   Jenkins within Pivotal Cloudbees</a> with a 15 day trial license.

   * Build Jenkins from <a target="_blank" href="https://github.com/docker-library/official-images">
   GitHub (stackbrew)</a>

docker pull jenkins

   * https://hub.docker.com/_/jenkins/
   * https://github.com/jenkinsci/docker

<a name="Dockerize"></a>

## Dockerize the app #

Dockerizing an application is the process of converting an application to run within a Docker container.

   <pre>
FROM node:0.10.44-slim
ADD . /home/demo/box/
RUN cd /home/demo/box && npm install
ENTRYPOINT ["/home/demo/box/boot.sh"]
   </pre>

See <a target="_blank" href="https://wilsonmar.github.io/docker-setup/">this blog</a>.

<hr />

<a name="JenkinsSetup"></a>

## Instantiate the CI server #

We are using a static (always on instance) within Digital Ocean.

0. Under "Manage Jenkins" -> "Manage Plugins", select and install plugins 
   for accessing GitHub and DockerHub:

   * Github Plugin from https://wiki.jenkins-ci.org/display/JENKINS/Github+Plugin
   * Git Plugin from https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin
   <br /><br />

0. Restart Jenkins so the installation takes.

0. In Manage Jenkins -> Configure System, 
   make sure the path to git is correctly set.

0. Choose "Manually manage hook URLs" under the "Github Web Hook" section. 

0. At the Jenkins home page, click "create new jobs".
0. Enter an item name such as "dv" for the Jenkins project.
0. Select "Freestyle project", then OK.
0. Under "Source Code Management", select "Git".
0. Type the Repository URL, such as https://github.com/hotwilson/dv.
0. Click Add, then Jenkins.
0. For Kind, select Certificate.

   PROTIP: Define a service account for Jenkins to use so several jobs can authenticate to Github.

0. Create a new set of private/public keys, and then either create a Github user for Bender or use the Github deploy keys feature. Follow those links for the excellent guides from Github.


0. Under "Build Triggers", tick "Build when a change is pushed to Github".

0. Save and build your job to get a successful build which clones the repository to the webhost.
 
0. Confirm by getting in the server and inspecting it.


The above are based on information from a variety of sources:

* http://fourkitchens.com/blog/article/trigger-jenkins-builds-pushing-github
* https://www.digitalocean.com/community/tutorials/how-to-set-up-jenkins-for-continuous-development-integration-on-centos-7


<hr />

<a name="Push2Dockerhub"></a>

Test using <a target="_blank" href="http://requestb.in/">RequestBin (http://requestb.in)</a>, 
which gives you a URL that collects requests made to it 
and let you inspect them in a human-friendly way.
Use RequestBin to see what your HTTP client is sending or to inspect and debug webhook requests.

See https://docs.docker.com/docker-hub/webhooks/

If you have an automated build repository in Docker Hub, you can use Webhooks to cause an action in another application in response to an event in the repository. Docker Hub webhooks fire when an image is built in, or a new tag added to, your automated build repository.

With your webhook, you specify a target URL and a JSON payload to deliver. The example webhook below generates an HTTP POST that delivers a JSON payload:





<a name="DockerDaemon"></a>

## Run Docker Daemon on Mac #

The automated pipeline

0. On a Mac, use Homebrew cask to install the UI app within a Virtualbox:

   <tt><strong>
   brew cask install dockertoolbox
   </strong></tt>

   The response:

   <pre>
Warning: The default Caskroom location has moved to /usr/local/Caskroom.
&nbsp;
Please migrate your Casks to the new location and delete /opt/homebrew-cask/Caskroom,
or if you would like to keep your Caskroom at /opt/homebrew-cask/Caskroom, add the
following to your HOMEBREW_CASK_OPTS:
&nbsp;
  --caskroom=/opt/homebrew-cask/Caskroom
&nbsp;
For more details on each of those options, see https://github.com/caskroom/homebrew-cask/issues/21913.
==> Satisfying dependencies
==> Installing Cask dependencies: virtualbox
virtualbox ...
==> Downloading http://download.virtualbox.org/virtualbox/5.1.2/VirtualBox-5.1.2
==> Verifying checksum for Cask virtualbox
==> Running installer for virtualbox; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are i
Password:
   </pre>

0. Enter your system password when prompted.

   The additional response:

   <pre>
==> installer: Package name is Oracle VM VirtualBox
==> installer: Upgrading at base path /
==> installer: The upgrade was successful.
🍺  virtualbox was successfully installed!
done
complete
==> Downloading https://github.com/docker/toolbox/releases/download/v1.11.2/Dock
######################################################################## 100.0%
==> Verifying checksum for Cask dockertoolbox
==> Running installer for dockertoolbox; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are i
Password:
==> installer: Package name is Docker Toolbox
==> installer: Installing at base path /
==> installer: The install was successful.
🍺  dockertoolbox was successfully installed!
   </pre>

0. Use docker-machine

   Refer to https://docs.docker.com/machine/get-started/

0. On Linux server, start the Docker daemon background process:

   <tt><strong>
   dockerd
   </strong></tt>

   PROTIP: This would be placed in Jenkins start-up scripts.

   It listens on the Unix socket unix:///var/run/docker.sock

   In most cases, the system administrator configures a process manager such as SysVinit, Upstart, or systemd to manage the docker daemon’s start and stop.

   Volumes are units of highly available block storage that you can attach to your Droplet.
   Use volumes to store assets, backups, databases, and more.
   Volumes can be moved between Droplets and you can increase their size as needed.

0. Run Docker using a command such as:

   <tt><strong>
   docker run  -t -i ubuntu:14.04 /bin/echo 'Hello world'
   </strong></tt>

   If you don't have the Docker Daemon running, you'll see a message such as:

   <pre>
docker: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
See 'docker run --help'.
   </pre>

   See https://docs.docker.com/machine/get-started/

   See https://docs.docker.com/v1.8/userguide/dockerizing/

0. Create docker machine:

   docker-machine create --driver virtualbox default

0. List docker machines created:

   <tt><strong>
   docker-machine ls
   </strong></tt>

   The response:

   <pre>
   NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
   default   *        virtualbox   Running   tcp://192.168.99.187:2376           v1.9.1
   </pre>

0. Define

   docker-machine env default

0. Connect to shell:

   eval "$(docker-machine env default)"



<a name="TagDocker"></a>

## Add Docker semantic tags

   * <a target="_blank" href="https://docs.docker.com/engine/reference/commandline/tag/">
   About Docker tags</a>


<a name="Push2Dockerhub"></a>

## Push into Dockerhub #

   * Read <a target="_blank" href="https://docs.docker.com/engine/tutorials/dockerrepos/">
   https://docs.docker.com/engine/tutorials/dockerrepos</a>

   * https://jenkins.io/solutions/docker/

   * https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin


0. Login:

   <tt><strong>
   docker login
   </strong></tt>


<a name="TagGitHub"></a>

## Tag GitHub release #

* Tester flags a build as ready to add to a release, release manager approves and adds it to a release


https://help.github.com/articles/creating-releases/


<a name="CommitTrigger"></a>

## Hook GitHub to trigger Build on commit #

- Now we create a APP release anytime any of the BOX or DV images change and
this is also a semantic version number that is independent of the above

- We then deploy this Release into a AWS cluster called Test.
Deployment is automatic every time a new release is created

- We need have a manual step where the release that is currently deploy to test,
will be updated with “RC” tag.


<a name="JenkinsAutoTests"></a>

## Jenkins Auto Test Trigger #

* Trigger automated tests of build



<a name="VaryDockerOptions"></a>

## Vary Docker Options #

- We also want to use different docker options for BOX in test vs prod

- we also want to use different env vars for BOX in test vs prod


<a name="SlackNotification"></a>

## Slack notification #

- we want to get notified into a slack room called test and prod
depending on what env what service and what version is getting deployed

QUESTION: Which room?  We need a public one not associated with a vendor.



<a name="SmokeTests"></a>

## Smoke Test Trigger #

Trigger automated tests after successful deployment to a Test environment


<a name="FullReleaes"></a>

## Full Release #

* Manage a full release (e.g. combination of versions across multiple services)


<a name="Artifactory"></a>

## Artifactory #

QUESTION: We using this?


https://www.youtube.com/watch?v=JR-ccCTmMKY
GOTO 2012 • Continuous Delivery: The Dirty Details • Mike Brittain
Etsy.com

working on mainline, trunk, master
feature flags
