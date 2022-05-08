# Push Your Rails App on Github

## Configuring Git ##

We'll be using Git for our version control system so we're going to set it up to match our Github account. If you don't already have a Github account, make sure to [register](https://github.com/). It will come in handy for the future.

Replace 'YOUR NAME' and 'YOUR@EMAIL.com' in the following steps with the ones you used for your Github account.

    $ git config --global color.ui true
    $ git config --global user.name "YOUR NAME"
    $ git config --global user.email "YOUR@EMAIL.com"

**Note:** If you want to config github with ssh, generate a ssh key

    $ ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

## Setup a new Rails app ##

Navigate to the directory in which you want the new app created using 'change directory' (cd).

Use the 'make directory' (mkdir) command if you want to create a new directory, such as rails_projects (Note: Rails will automatically create a directory for all your app files).

    $ cd <correct_directory>

Create a new app. It's good practice to append your new app name with 'app' so that it will not be confused with any classes you create later.

The 'rails new' command will create the default Rails file structure inside a directory with the name you gave in the command above.

    $ rails new <new_app>

Navigate to the newly created directory using 'cd'

    $ cd <new_app>

## Initialize a git repository ##

Initialize a new git repository locally (This initializes a repository in the current working directory, so ensure you are in the correct one.)

    $ git init

Add everything in the current directory to the repository

    $ git add .

Check git status to show you what is currently in the 'staging area'.

    $ git status

Commit all the changes in the 'staging area' to the LOCAL git repository and add a comment.

    $ git commit -m "Initial commit"

Check the log to show a list of commit messages.

    $ git log

## Create a new GitHub repository and set as master branch ##

Create a new GitHub repository

- Log in to GitHub
- Select 'New repository' or navigate to https://github.com/new
- Add a Repository name that matches your app name (<new_app>)
- Deselect 'Initialize this repository with a README.
- Copy one <remote url> (`HTTPS` https://github.com/<username>/<new_app>.git OR `SSH` git@github.com:<username>/<new_app>.git)

Tell git to add Github as the origin for the 'master' branch.

    $ git remote add origin <remote_url>

## Generate an access token or config ssh to push your code on github

If you added `SSH` remote URL to your repository then follow `Config SSH` otherwise Generate a `Personal Access Token`.

### Config SSH

Get you SSH key. (generated on [first step](#configuring-git))

    $ cat ~/.ssh/id_rsa.pub

- Copy the ssh key
- Navigate to https://github.com/settings/keys
- Enter the any title and paste whole key here (ssh-rsa ABC....... = name@username) and save it

### Generate Personal Access Token

- Navigate to `github.com` > `Developer Settings` > `Personal access tokens` or `https://github.com/settings/tokens`
- Enter any note here and customize token scopes by selecting checkboxes and generate a new token

## Push the local repository up to Github (the remote repository)

    $ git push origin master

**Note:** If you added SSH remote then it automatically pushes the code otherwise you have to enter your email address and access token.
