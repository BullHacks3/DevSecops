### A Short Introduction of Git ###

GIT

1. LCS (Local Control Systems )
A database was maintained ,responsible to keep track of various local changes to a specific directoy or a files
Example :- RCS


2. CVS ( Centralised Version Control System )
	Allows developers or multiple people to collaborate on the same project
        Includes various features such as versioning of the software ,log messages generation

Example :-
	1. Subversion
	2. Perforce
Disadvantages
	: Single Point Of Failure
  	: Corruption of hard-disk leads to havoc
	: No hierarchical model is possible i.e multiple collaboration at a time

3. DVCS ( Distributed Version Control System )

Each contributors have its own copy of the project.In case if the server goes down,and server data is corrupted.Then any of the contributors that upload the code to the repository.
No single point of failure
Flexbility to push local changes to the remote repository

>Example :-
>	1. Git
>	2. Mercurial
>   3. Bazaar
>	4. Darcs


History of GIT

|  Year        |   Milestone																|		
|--------------|----------------------------------------------------------------------------|
|  2002        | Linux kernel uses proprietary DVCS called bitkeeper                        |
|  2005        | Relationship between BitKeeper and Linux kernel maintainer broke down      |
|  2005        | Lead towards the development of open source dvcs (git)                     |


GIT
Storing scheme :
   Streams of snapshot

Other :
  Store changes as list of file based cahnges
	Also known as delta version control


Git has integrity
	: Checksummed every piece of information with SHA-1 algorithm (40 characted string)


Three states of GIT
1. Committed : Means data is successfully stored in the local database
2. Modified  : Means u have changed the file but not yet committed
3. Staged    :


Three section of Git project :-
1. Git Directory   : Stores the metadata and object database
2. Working Tree    :
3. Staging Area

| echo "Hello" > first.txt ; echo "World" > second.txt |  ----> working Tree
| git add first.txt                                    |  ----> staging Tree
| git commit -m "Ready to be committed"                |  ----> git Directory


**Installation on ubuntu**
``` sudo apt-get install -y git-all ```

**Check the git version**
``` git --version ```

**Location of gitconfig file**
```
locate gitconfig
find . -name .gitconfig -type f

cat ~/.gitconfig | cat ~/.git/config | cat /etc/gitconfig
```

**Intial Git Setup**

**Step 1 :- Setup your name**
```
git config --global user.name "Bakul Gupta"
```

**Step 2 :- Setup your email-id**
``` 
git config --global user.email "bakulgupta11@gmail.com"
```

**Step 3 :- Setup the default editor for git**
``` 
git config --global core.editor vim 
```

**Step 4 :-  See the git configuration settings**
``` 
git config --list
```

**Step 5 :- Also show the location of git config file**
``` 
git config --show-origin --list
```


----------------------------------------------------------------------
GIT BASICS

|Command                     | Functionality						                               |
|----------------------------|---------------------------------------------------------------------|
| git init                   | Used to initialize a git repository								   |
| git add [filename]         | used to add files to staging aread                                  |
| git commit -m "Message"    | Commit a file                                                       |
| git clone  <url>           | clone a existing repository to local system                         |
| git status                 | Check the status of the file                                        |
| .gitignore                 | Ignore particular to be included in the repository                  |
| git diff                   | show the differences between different file                         |
| git commit                 | to move a file from staged area to git repository                   |
| git commit -a              | used to skip the staging area                                       |
| git rm [filename]          | used to remove the file from directory as well as unstaged it       |
| git mv                     | rename as well as move the file                                     |
| git log                    | see the log of the git repository                                   |
| git reset HEAD [file_name] | unstaged a staged file                                              |
| git checkout -- [file_name]| unmodifying a modified file                                         |
| git remote -v              |                                                                     |
| git remote add origin [url]|                                                                     |
| git fetch origin           | download all the latest changes to local system ,but it doesn'tmerge|
| git remote show origin     | used for the inspection of remote named origin                      |
| git remote rename f1 f2    | rename a branch in git                                              |
| git remote rm f2           | remove a branch in git                                              |
| git tag -a v1.0 -m "Tag"   | used to add a tag to repository                                     |
| git push origin v1.0       | push the tag to the server                                          |
| git branch -v              | show branch wise information                                        |
| git branch --merged        | show which branch are merged                                        |
| git branch --no-merged     | branch which are yet to be merged                                   |



### Initialize a git repository
```
cd /home/bakul/Git
git init
```

### Add files to staging area
```
echo "Hello World" > first.txt
git add first.txt
```
### Commit the file
```
git commit -m "First file added"
```

### Clone an exisiting repository
```
git clone <url of the repository>

Example :- git clone https"//github.com/BullHacks3/try.git
```
### Clone a git repo into a particular diectory
```
git clone <url of git repo> <name_of_destination_directory>
```
### Stage of a file
```
Untracked -> Unmodified -> Modified -> Staged
```

### Check the status of the files
```
git status [file_name]
```
### Attribute of git status command
```
git status -s
     or
git status --short
```

### Ignoring the files
```
echo " *.cpp " >> .gitignore
It means ignore all the files with extensions .cpp to be added in the git repository
```
### Example of git ignore file includes
```
# Ignore all files ending with .secret
*.secret
# Do track bakul.secret ,even u r ignoring the *.secret files
!bakul.secret
#Ignore all files in the directory hacking
hacking/
#Ignore all the files in the doc/direcotry an any of its subdirectories
doc/**/*.pdf

For more example refer to the following link :- https://github.com/github/gitignore
```

### To show the differences between the various files in git 
```
git diff
git diff --staged
git diff --cached
```

### Remove a file or directory from git repository
```
git rm first.txt
git rm /directory
```
### Rename a file in git
```
git mv first.txt second.txt
       or
mv first.txt second.txt
git rm first.txt
git add second.txt
```
### See the logs of the repository
```
git log                   : Show the commit log ,in reverse chronological order
git log -p (--patch)      : Show the logs along with the differences
git log --stat            : Show the stat of the log
git log --pretty=oneline  : Provide the one line output for each commit
git log --pretty=short
git log --pretty=full
git log --pretty=fuller
git log --pretty=format: "%h %s" --graph
git log --since=1.weeks
git log --grep
git log -S function_name
```

### Undoing the changes
```
If u make an early commit ,and forgot to add the file ,then u can make use of ammend option
git commit --amend
```
# Unstaging a staged file
```
git reset HEAD [fiile_name]
Example:-
git add first.txt
git reset HEAD first.txt
```

# Unmodifying  a modified file
```
git checkout -- [file_name]
```

### Working with Remotes

### To see the remote urls 
```
git remote
git remote -v
```

### To add a remote to a repository
```
git remote add origin [git_repo url]
```

### To update the repository
```
git fetch <remote>
```
### Git fetch vs git pull
```
git pull : git fetch + git merge
git fetch : download all the changes to local system but doesn't merge the changes automatically
```
### Pushing your remotes
```
git push <remote> <branch>
Example: git push origin master
```
### Inspecting a remote
```
git remote show origin
```

### Renaming and removing remotes
```
git remote rename origin newremote
git remote rm newremote
```
### Tagging
```
Tagging allows to keep track of versioning of the projects
git tag           : used to list the tag available in the git repository
git tag -l "v1.0" : used to search the repo with particular version
```

### Creation of tags
```
Annonated Tags
git tag -a v1.0 -m "First version 1.0"

LightWeight Tags
git tag v1.1-lw
```
### Pushing the tag
```
git push origin <tagname>
            or
git push origin --tags
```

### Git Aliases
```
git config --global alias.c checkout
git config --global alias.br branch
git config --global alias.unstage 'reset HEAD --'
```
---------------------------------------------------------------------------------------------
### Git Branching
Finds its application when one need to perform multiple features related tasks on git repository.
                                 Or
When multiple developers need to work on same project 
 Creates a new branch with name testing
```
git branch testing 
```
### Switch to a different branch
```
git checkout testing
```
### Creation as well as switching to different branch
```
git checkout -b testing
```

### Git Merging Techniques
1. Fast Forward techinque
2. Recursive merge technique

### Delete a remote branch
```
git push origin --delete [remote_branch_name]
```

### Git Rebasing
In git there are two ways to integrate the changes from one branch to another branch
1. rebase
2. merge

Rebase : it used to deploy the changes on branch to another branch
Used to make commit looks like in serial order instead of parallel execution
```
git checkout testing
git rebase master

Example:
git rebase --onto master server client
It means consider the client branch,and apply those patches that are diverged from the server branch
git rebase master server
It will rebase a server branch on top of master branch
```



### Git Insights
Various protocols used by the git.Usually git make use of four protocols 
1. Local
2. HTTP
	2.1 Smart HTTP Protocol
	2.2 Dumb HTTP Protocol
3. Secure Shell
4. Git
	4.1 Dedicated port(9418)

### Types Of Workflow in Git

1. Centralised workflow
2. Integration-Manager Workflow
3. Dictator and Lieutenants Workflow

### Git Tools
Contains information about the HEAD and branch references
```git reflog
git log -g
```

To view the logs in more descriptive way
```
git log --pretty=format: '%h %s' --graph
```

Show the changes that have not been merged into the master branch
```
git log testing..master
```

### Stashing the work
git stash command is used to temporarily save work on current working directory 
```
git stash 
git stash apply
git stash --list
git stash drop
```



