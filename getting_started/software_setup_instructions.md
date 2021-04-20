Installation and Configuration Instructions
================
Elise Gould
30/01/2017

# For all operating systems: Set-up your GitHub account

Go to [www.github.com](www.github.com) and activate a GitHub account.
Ensure you use your University email address, if you have one (should
contain `.edu`), this will get you free private repositories. If you
don’t have an `.edu` email address, set up your free acounty anyway,
noting that there will be a limitation on the number of private
repositories you can create.

# Installation Guide For Windows

## Install R

Install R for windows: <https://cran.r-project.org/bin/windows/base/>.
Click on the ‘Download R 3.3.2 for Windows’ link.

## Install RStudio

RStudio is the interface we will be using to edit and interact with our
code using R. Download the version of RStudio for your operating system
here: <https://www.rstudio.com/products/rstudio/download/>

Note that the best option is to install RStudio using an installer,
under the heading: ‘Installers for Supported Platforms.’

## Install Git via GitHub Desktop

Install GitHub Desktop for windows 7 or greater here:
<https://github-windows.s3.amazonaws.com/GitHubSetup.exe>

Note that GitHub Desktop is an application with a graphical user
interface for interacting with git. Although we will be using the
interface to git within RStudio directly, installing GitHub Desktop is
the easiest method for installing git on windows machines. Note that git
is automatically installed when you install GitHub Desktop.

After you have installed GitHub Desktop, open the app and login with
your github credentials. This should automatically link your GitHub
account to the local git installation. More information on GitHub
Desktop can be found here: <https://desktop.github.com>.

But wait, there’s more\! Please scroll down to the bottom of the page to
complete your git configuration in RStudio, see the heading:
‘Configuring RStudio for use with Github and Git (mac and windows)’.
Note that this step is necessary for both Mac and Windows operating
systems.

# Installation Guide For Mac

## Install XQuartz

<https://www.xquartz.org>

## Install R

Download R, for Mavericks and higher:
<https://cran.r-project.org/bin/macosx/R-3.3.2.pkg>

For earlier OS X operating systems or more details on installing R on
Mac, visit this page: <https://cran.r-project.org/bin/macosx/>

## Installing RStudio

RStudio is the interface we will be using to edit and interact with our
code using R. Download the version of RStudio for your operating system
here: <https://www.rstudio.com/products/rstudio/download/>

Note that the best option is to install RStudio using an installer,
under the heading: ‘Installers for Supported Platforms.’

## Install Git:

*Mac OS X Mavericks and higher (10.9+)*

Mac OS X Mavericks and higher include a version of git already, but you
need to install the command line tools for your version of mac.

1.  Open the application called ‘Terminal’. This gives you access to the
    Unix command line or *shell*, allowing you to interact with your
    computer with typed commands, rather than with the regular graphical
    user interface. You can find the Terminal app by hitting
    Command-Spacebar and searching for ‘Terminal’.
2.  Check if Xcode is already installed by typing the following and
    hitting enter: `$ xcode-select -p` Note that you do not type the
    `$`, just type everything appearing after the `$`. If you see the
    following, or similar: `/Applications/Xcode.app/Contents/Developer`
    Xcode is already installed.
3.  Type the following into Terminal: `$ xcode-select --install`
4.  Follow the prompts to install Xcode, but make sure you select
    ‘install’ rather than ’Get Xcode from the app store.
5.  Alternatively, if the download fails or takes a very long time. You
    can install Xcode Command Line tools from
    <https://developer.apple.com/downloads/more> using your Apple ID and
    password.

*Git installation for pre-Mavericks Mac OS X*

Git is not pre-installed, so you’ll have to install it separately.

Follow the Mac-specific instructions here:
<https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>. You can
download the git-installer here: <http://git-scm.com/download/mac>.

## Tell git who you are on GitHub

1.  Tools \> Shell
2.  Type the following into the shell, substituting the username and
    email address with your own credentials you used to sign up to
    GitHub with.

<!-- end list -->

    git config --global user.email "mail@someemailaddress.com"
    git config --global user.name "your_username"

# Configuring RStudio for use with Github and Git (mac and windows)

You need to activate git for use in RStudio on your system:

1.  Tools \> Global Options
2.  Click Git/SVN
3.  Enable version control interface for RStudio projects
4.  If blank, enter the path for your git executable where provided by
    clicking ‘Browse’ Windows, if you followed the installation
    instructions above it will located
    here:

<!-- end list -->

    C:\Users\'username'\AppData\Local\GitHub\PortableGit_'numbersandletters'\cmd\git.exe

Mac:

    /usr/bin/git

5.  Link git to github:

<!-- end list -->

  - click on ‘create RSA key’
  - close the window
  - click on view public key, and copy tje text to your clipboard.
  - Head back to GitHub (ensure you are logged in)
  - Go to your account settings, select ‘SSH and GPG keys’
  - Click ‘New SSH key’ and paste in the public key you have copied from
    RStudio, save your key.

# R package installation:

Open RStudio and type the following into the console (make sure to hit
enter so your command is sent to R):

``` r
install.packages("tidyverse")
```

This will install the required packages, just in case we encounter
issues on the day of the workshop.
