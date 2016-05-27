---
layout: post
title: "Python on Mac OSX"
excerpt: "Get it here"
tags: [python, apple, mac, setup]
image:
# feature: pic white python logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622164/4230c848-0585-11e6-957b-be11147346e6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

"Speed, reproducibility, easy rollbacks, and predictability is what we strive for when deploying our diverse Python applications."

<a id="PackagInstallerz"></a>

## Hard-core #

The hard-core approach is to download the <strong>pip-x.x.x.tar.gz</strong> (tarball) containing source
(The version may be different when it comes time for you to do this.)

* [python.org/downloads/mac-osx/](https://www.python.org/downloads/mac-osx/)

But there are more "civilized" approaches.

## Python Package Install Options #

CAUTION: There is a conflict of choice here:

   * Conda
   * MiniCorda 
   * Anacorda 
   * easy_install
   * pip

Differences:

* Pip is a package manager.
* Virtualenv is an environment manager. 
* Conda is both.

* pip can install anything from pypi in one command. 
* conda requires three commands: skeleton, build, install and possibly more

* Conda handles library dependencies outside of the Python packages as well as the Python packages themselves. 
  Conda also creates a virtual environment, like virtualenv does.

* pip compiles everything from source if a wheel is not available.

   <tt><strong>
   pip install --use-wheel <em>package</em>
   </strong></tt>

* Conda installs from binary, meaning that someone (e.g., Continuum) has already done the hard work of compiling the package, and so the installation is easy. 

* pip is built on top of setuptools.
* conda uses its own format, which has some advantages (like being static, and again, Python agnostic). 

### Virtualenv and Docker #

<a target="_blank" href="https://hynek.me/articles/virtualenv-lives/">
Hynek Schlawack recommends</a>

   * Don’t pip-install anything into its global site-packages beyond virtualenv.

   * Install <strong>both</strong> virtualenv and system isolation (they are not mutually exclusive):

      * Isolate your application server’s OS from its host using Docker/lxc/jails/zones/kvm/VMware/… to one container/vm per application.

      * inside of them also do isolate your Python environment using virtualenv from unexpected surprises in the system site-packages.

Remove hassles from managing per-project virtualenvs by using one of these, depending on the shell and operating system used:

   * virtualenvwrapper
   * virtualenvwrapper-win on MS Windows
   * <a target="_blank" href="https://github.com/adambrenecki/virtualfish"> virtualfish</a>

<a id="corda"></a>

### Corda #

Many prefer to install Python using Conda for better package and environment management. 

Conda installs, runs, and updates packages and their dependencies. Its home page:

*   [http://conda.pydata.org/docs/install/quick.html](http://conda.pydata.org/docs/install/quick.html)


<a id="PIPz"></a>

## PIP (Python Installation Packager)

As of Python 2.7.9 and Python 3.4.x, python.org installers for OS X install pip as well.
Activestate.com and download ActivePython. 
It's a simple install that gives you Python and pip. 

According to https://www.python.org/download/mac/tcltk/,
download from
http://www.activestate.com/activetcl/downloads
file ActiveTcl8.6.3.1.298624-macosx10.5-i386-x86_64-threaded.dmg
After install, the 
<a target="_blank" href="file:///Library/Documentation/Help/ActiveTcl-8.6/index.html">
ActiveTcl User Guide</a> is popped up.
Yours will be different.


Jesse Noller notes in
<a target="_blank" href="http://jessenoller.com/blog/2009/03/16/so-you-want-to-use-python-on-the-mac">
So you want to use python on the Mac</a>:
"Now, some people may recommend you install macports or fink: 
these are both "sorta" package managers for OS/X, and while I do have macports installed, I do not use it for Python work. 
I prefer compilation and self management."

### Easy_install #

Others use 
<strong>easy_install</strong> (with setuptools) 
to install packages from the web. 

   <tt><strong>
   sudo easy_install pip
   </strong></tt>

"To be effective in the world, you're going to want to install both, 
and only fall back to easy_install if  <a target="_blank" href="https://pypi.python.org/pypi/pip">
pip</a> fails you.

### Homebrew install pip #

Alternately, use Homebrew to install pip (as <a target="_blank" href="http://penandpants.com/2012/02/24/install-python/">recommended by this site</a>):

   <tt><strong>
   brew install pip
   </strong></tt>


<a id="VirtualPyEnvz"></a>

## Virtual Python environments

The best way to have painless and reproducible deployments is to package whole virtual environments of the application you want to deploy including all dependencies but without configuration.

> In the world of Python, an **environment** is a folder (directory) containing everything that a 
   Python **project** (application) needs to run in an organised, isolated fashion. 

When it is initiated, it automatically comes with its own Python interpreter 
- a copy of the one used to create it - alongside its very own pip.

The ability to work with either version 3 or 2.7 on the same machine is needed
because, <a target="_blank" href="http://www.macobserver.com/tmo/article/how-to-upgrade-your-mac-to-python-3"> as this MacWorld article</a>
points out, Mac Mavericks and Yosemite are installed with Python 2.7,
cannot run python3 scripts.

You can work on a Python project which requires Django 1.3<br />
while also maintaining a project which requires Django 1.0.

It's done by creating isolated Python environments using
<a target="_blank" href="https://pypi.python.org/pypi/virtualenv">
virtualenv</a> (Virtual python environment builder).

<tt><strong>
sudo pip install virtualenv
</strong></tt>

As the reponse requests, activate:

<tt><strong>
source /usr/local/opt/autoenv/activate.sh
<strong></tt>

This does not issue a response.


Instead of &quot;venv&quot;, substitute your project name to to create:

<tt><strong>
cd my_project_folder
$ virtualenv venv
</strong></tt>

Exclude the virtual environment folder from source control by adding it to the git ignore list.

List all environments:

<tt><strong>
lsvirtualenv
</strong></tt>

To use a particular Python interpreter:

<tt><strong>
virtualenv -p /usr/bin/python2.7 venv
</strong></tt>


Activate your project:

   <tt>
   source venv/bin/activate
   </tt>

The name of the current virtual environment should now appear on the left of the prompt 
(e.g. (venv)Your-Computer:your_project UserName$). 

From now on, any package that you install using pip will be placed in the venv folder, isolated from the global Python installation.

If you want to automatically activate an vironment when you cd into it:

   <tt>
   brew install autoenv
   </tt>


Install packages as usual, for example:

   <tt>
   pip install request
   </tt>

When you are done working in the virtual environment for the moment:

   <tt>
   deactivate
   </tt>

The above puts you back to the system's default Python interpreter with all its installed libraries.

To delete a virtual environment, just delete its folder. (In this case, it would be 

   <tt>
   rm -rf venv
   </tt>

To keep your environment consistent, 
<srong>freeze</srong> the current state of the environment packages:

   <tt>
   pip freeze > requirements.txt
   </tt>

This creates a <strong>requirements.txt</strong> file containing a simple list of all the packages in the current environment, and their respective versions. Later it will be easier for a different developer (or you, if you need to re-create the environment) to install the same packages using the same versions:

   <tt>
   pip install -r requirements.txt
   </tt>

   This ensures consistency across installations, deployments, and developers.

As noted in 
http://docs.python-guide.org/en/latest/dev/virtualenvs/
this create a folder in the current directory containing the Python executable files, 
and a copy of the pip library which you can use to install other packages. 
The name of the virtual environment (in this case, it was venv) can be anything;
omitting the name will place the files in the current directory instead.

Open an internet browser to 
<a target="_blank" href="https://www.python.org/downloads/">
https://www.python.org/downloads/</a>
and download file python-3.4.2-macosx10.6.pkg.

See 	http://docs.python-guide.org/en/latest/dev/virtualenvs/
https://www.digitalocean.com/community/tutorials/common-python-tools-using-virtualenv-installing-with-pip-and-managing-packages

To list what packages have been installed:

   <tt>
   pip list
   </tt>

Look for packages by keyword:

   <tt>
   pip search django
   </tt>

<!--
 I would like to backup the contents of my gmail account.
 A recommended solution is 
 https://github.com/jay0lee/got-your-back/releases
 But within its setup.py file there is a reference to Windows py2exe .
 
 File "setup.py", line 2, in &LT;module>
 import py2exe, sys, os
 ImportError: No module named py2exe
 
 This is more like a StackOverflow question, but 
 I'd like to take this opportunity to install a virtual environment for Python, so I can use python3 on Yosemite, perhaps as described by
 http://www.macobserver.com/tmo/article/how-to-upgrade-your-mac-to-python-3
 
 
 virtualenv creates a folder which contains all the necessary executables to use the packages that a Python project would need.
 
	Create a virtual environment for a project:
 <tt>
 cd my_project_folder
 virtualenv venv
 </tt>
	
	create a folder in the current directory which will contain the Python executable files, and a copy of the pip library which you can use to install other packages. The name of the virtual environment (in this case, it was venv) can be anything; omitting the name will place the files in the current directory instead.
 
 This creates a copy of Python in whichever directory you ran the command in, placing it in a folder named venv.
 
	Specify a Python interpreter:
 <tt>
 virtualenv -p /usr/bin/python2.7 venv
 </tt>
 
 
	Activate the new virtuali environment for use:
 <tt>
 source venv/bin/activate
 </tt>
 
	In a Terminal, install easy_setup and pip and
 <tt>
 sudo pip install virtualenv
 </tt>
 
	<a target="_blank" href="https://pypi.python.org/pypi/virtualenv">
	virtualenv</a>.
 
 virtualenv into the 2.6.1 install we installed previously. The binaries are installed to /Library/Frameworks/Python.framework/Versions/2.6/bin. Your egregious modification of this pristine install is almost complete.
 
 Next install virtualenvwrapper:
 
 sudo pip install virtualenvwrapper
 
	Open <a target="_blank" href=http://peak.telecommunity.com/dist/ez_setup.py">
	the ez_setup.py python script</a> which
	bootstraps setuptools and easy_install for you - just run:
	control-click on it to save it to your Downloads folder.
 
 sudo python ez_setup.py
 Once that's complete, head over to pypi and download the pip tarball. Unpack it and execute "sudo python setup.py install".
 
 Next up, well - let's cheat - in terminal, type:
 
 sudo pip install virtualenv
 
 su root
 easy_install [LIBRARY NAME]
 
 
 
 
 
 -->
This explanation forks 
http://coolestguidesontheplanet.com/getting-started-vagrant-os-osx-10-9-mavericks/

Setup a provider VM solution to store the image (like VMware, AWS, Hyper-V).
https://www.virtualbox.org/wiki/Downloads
click "x86/amd64" next to <strong>VirtualBox 4.3.20 for OS X hosts</strong>
to download VirtualBox-4.3.20.96.dmg (109 MB)
Read the 368 page User Manual.

Install https://github.com/dotless-de/vagrant-vbguest
to keep VirtualBox guest additions up to date.
http://schof.org/2014/03/31/working-around-virtualbox-bug-12879/

In the Finder, in the <strong>Applications</strong> folder, 
drag and drop it onto your Dock for quicker use later.
Double-click on VirtualBox for the <strong>VirtualBox Manager</strong>. 

Click New
</p>


## Vagrant #

Download the 224.3 MB vagrant_1.7.1.dmg

The binary gets installed in the Applications folder with a link to the /usr/bin so it is added to the shell path.

List commands:

   <tt>
   vagrant<br />
   vagrant list-commands
   </tt>

Change directory to where you want to store the Vagrant project and run

   <tt>
   vagrant init
   </tt>

The response:<br />

<tt>A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
</tt>

<tt>
ls
</tt>
shows Vagrantfile (with capital V).

https://www.vagrantup.com/downloads.html


vagrant up --provider=PROVIDER


https://vagrantcloud.com/boxes/search
lists boxes created by the community.

I am pulling the box from ATT M2X https://m2x.att.com/developer/sample-code
This Repo provides a Vagrant virtual machine that contains several demo applications (Ruby and Python) that report data to AT&T M2X.
https://github.com/attm2x/m2x-demo-vagrant
<tt>
git clone https://github.com/attm2x/m2x-demo-vagrant.git
</tt>
vagrant box add chef/centos-6.5	

bootstrap.bash


User data for Vagrant is filed in the directory from which vagrant was used and is stored in an invisible directory .vagrant.d



<a id="Pythonz"></a>

## Using Python 2 #

<div class="sidenote">
<a target="_blank" href="http://youshoulddoityourself.blogspot.com/2010/11/test.html">
This advice from 2010</a>
</div>

Where you are picking up Python from?

   <tt><strong>type python</strong></tt>

   If Python was installed:

   <tt>python is hashed (/usr/bin/python)</tt>

   Alternately, if Conda was installed:

   <tt>python is hashed (/Users/mac/miniconda2/bin/python)</tt>

In a Terminal issue command:

   <tt><strong>
   python --version
   </strong></tt>

The response is its version. My Mac Yosemite shows this:

<pre>
Python 2.7.6 (default, Sep  9 2014, 15:04:36)
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.39)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
</pre>

Exit the interpreter with Command+D.


Get the folder:

<tt><strong>
python -m site --user-site
</strong></tt>

The response I got is this:

   <tt>
   /Users/wilsonmar/Library/Python/2.7/lib/python/site-packages
   </tt>

   Alternately:

   <tt>
   /Users/mac/.local/lib/python2.7/site-packages
   </tt>

Open Python command-line:

<pre>
python
</pre>

My Yosemite Mac responds with:

<pre>
Python 2.7.6 (default, Sep  9 2014, 15:04:36)
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.39)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> </pre>

The >>> is the Python interpreter prompt.


Exit Python by specifying a function:

<pre><strong>
exit()
</strong></pre>

Get back into python.

Display Python's current working directory:

<pre><strong>
>>> import os
>>> os.getcwd()
</strong></pre>

Also:

<pre><strong>
import os, sys
os.path.dirname(os.path.abspath(sys.argv[0]))
</strong></pre>

The response is your home folder (substitue my name with yours)

<tt>
'/Users/wilsonmar'
</tt>

Do not delete or modify the system-provided Python in<br />
/System/Library/Frameworks/Python.framework and /usr/bin/python<br />
or you will hose your operating system and need to reinstall Yosemite.

Install packages:

<pre><strong>
pip install numpy
pip install scipy
</strong></pre>

Instead of downloading
http://www.scipy.org/scipylib/download.html#
linear algebra, standard distributions, signal processing, data IO

http://www.numpy.org/

which are needed by
http://www.pymvpa.org/installation.html



<a id="PythonHTTP"></a>

## Start a HTTP Server Using Python


A simple HTTP server service can be started with command:

<pre><strong>
python -m SimpleHTTPServer
</strong></pre>

For Python3: 

<pre><strong>
python -m http.server
</strong></pre>

 


<a id="Python3z"></a>

## Using Python 3

<div class="sidenote">
<a target="_blank" href="sub">
This post on Qita (from Japan)</a> describes step to setup a developer's environment on Yosemite.
</div>

Python3 is not backward compatible with Version 2.

After installing Python3, obtain the Python 3 command line with:

<tt><strong>python3</strong></tt>

The response I get:

<pre>
ython 3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)
[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
</pre>

Unlike Apple's default install of 2.x, version 3.x installs into your own library folder. 
Using the symbol ~ as a shorthand for /Users/&LT;your acct name>, then we can write the location as:

<pre>
~/Library/Frameworks/Python.framework/Versions/3.4/bin/python3
</pre>



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
