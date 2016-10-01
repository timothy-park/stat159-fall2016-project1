

### Discussion

The first computational tool every statistician or computer programmer needs to know is bash. Bash is short for Bourne Again Shell and is the shell for the GNU operating system. All shells including bash require either a terminal emulator or command line interpreter. Inside the shell contains the kernel. The kernel is the core of Unix-like operating systems, and it is responsible for allocating memory and time to program. The user types in commands into the Terminal that are handled by shell, which then translates our commands interpretable by the kernel. These commands are executed, and the command line is reset again.
First, open up terminal by searching through your applications folder. A screen will pop up, displaying the command line within the bash interface. The default present working directory for bash is the user folder, which often includes the following:  Desktop, Documents, Downloads, Music, and etc. In this project, we will create a folder called *stat159-fall2016-project1* and initialize a git repository. 

* Locate what your present working directory is by the pwd command. 
	* `pwd`
* View all the files and folders in your current working directory by typing in the ls command. 
	* `ls`
* Change the working directory by using the cd command following the directory you want to change into. In this case, change into the Desktop directory.
	* `cd Desktop`
* To create a folder called *stat159-fall2016-project1*, use the mkdir command following the name of the folder
	* `mkdir stat159-fall2016-project1`
* Change your working directory into this new folder
	* `cd stat159-fall2016-project1`

![](../images/github-logo.png)

Before initializing any Git repository, you first need to understand the workings of GitHub. **GitHub** is a collaboration platform built on top of Git, a free open source distributed version control system. This platform facilitates the collaboration and sharing of files and projects to the public or to private groups. You will be able to start your own data science projects in your own team and contribute to the open source movement. Open source is a way for non-collaborators to reproduce or replicate your experiment, and becoming a GitHub/Git expert is the first step to an open source world. In this project, you will use GitHub to create your own remote repository where you and your collaborators, using Git, can make changes. push them remotely to GitHub, and collaborate with your team easily with multiple versions of each change.

![](../images/git-logo.png)

Now, we will learn about the commonly-used version control system called **Git**. A version control system keep tracks of changes over time, allows you to track your progress, allows you to revert to earlier versions, and makes it easier to collaborate with others all in a virtual project setting. You can track your changes on various files and directories and work with others on the same file (automatically creating different versions). Git is a distributed version control system that can create both a local and remote repository. You can initialize a git repository at home, pull the work from the centralized repository on the GitHub project site, work on the project at home without the internet, and finally push all the changes to the central repository once you are done. 

* If you are using git for the first time, you should configure your git information (on the user level) using the `git config` command.
	* `git config --global user.name “timothy-park”`
	* `git config --global user.email timothypark713@gmail.com`
	* `git config --global color.ui “auto”`
* Initialize a local git repository by typing in `git init`. This would create a hidden file called .git that would keep track of all changes in the directory it is located in.
	* `git init`
* To create a remote git repository, you have to log into your account on github.com and click on *new repository* in the drop down list from the *+* icon. This action would direct you to a page to customize the settings of your new remote repository. For this project, we want the repository to be named the same as your local repository, to be public, and initialized with a README.md file. A README file is a text file that contains information about the software program including, but not limited to: installation of the program, use of the functions in the program, and the main goal of the program as a whole.
* To connect the folder *stat159-fall2016-project1* to the remote repository, click on the green button called *Clone or download*. You will see a link in either a SSH or HTTP format. SSH is used for security purposes, but for this project, we will use the HTTP link. Copy the link and use the following command to link the folder to this remote repository. The argument *origin* shown below can be of any name; it is basically your own personal alias for that specific remote respository. Note: your present working directory must be in the local repository you initialized earlier
	* `git remote add origin https://github.com/timothy-park/stat159-fall2016-project1.git`
* Since a README.md was created, you need to pull the files from the remote repository to have everything in sync. The master argument in the command below pulls the contents from the main branch called *master* of the remote repository.
	* `git pull origin master`

After completing these commands, your remote and local repositories are now in sync and up-to-date. You can check this by typing in `git status`. If you make any changes in your local repository, typing in `git status` will report to you the following files need to be added to the staging area. 

Git records changes in a 3-step process. When the user makes any change to a file in the git-initialized repository, the .git file will track these changes. The user must use the “git add” command to take a *snapshot* of these changes. This action will bring all the recorded changes to the staging area, which then will be converted to a *stored photo* by typing in the `git commit` command. These commits can be pushed to the centralized repository on Github by the `git push origin master` command.
* Adding a file called files.txt to the staging area
	* `git add files.txt`
* Committing a file to your local repository with a message describing the main changes
	* `git commit –m “insightful message”`
* Checking your log/history of your commits
	* `git log`
* Push all these changes to your remote repository
	* `git push origin master`

Since we have finally initialized a git repository remotely and locally, let us download some png images found on Gaston Sanchez's Project 1 folder in his Stat 159 repository. Instead of downloading them manually, use the `curl` command in the terminal to download their outputs in the current directory.

```
curl -o git-logo.png https://raw.githubusercontent.com/timothy-park/stat159-fall-2016/master/projects/proj01/images/git-logo.png

curl -o github-logo.png https://raw.githubusercontent.com/timothy-park/stat159-fall-2016/master/projects/proj01/images/github-logo.png

curl -o pandoc-logo.png https://raw.githubusercontent.com/timothy-park/stat159-fall-2016/master/projects/proj01/images/pandoc-logo.png

curl -o markdown-logo.png https://raw.githubusercontent.com/timothy-park/stat159-fall-2016/master/projects/proj01/images/markdown-logo.png

curl -o stat159-logo.png https://raw.githubusercontent.com/timothy-park/stat159-fall-2016/master/projects/proj01/images/stat159-logo.png
```

Since the present working directory is in the *stat159-fall2016-project1* folder, the png images were downloaded there. We should now create a new directory called *images* and move these files there using the mv command in the terminal. The following command will use a wildcard to select all png images.

```
mkdir images
mv *.png images
```

Since the files in the main directory have been changed, let us check how git handles with these changes. We type in `git status` to check if changes needed to be added to the staging area and thereafter can be committed to git.

`git status`

We can see that this command provided a list of the untracked files in the directory. Type in `git add *.png`, which would put all png files to the staging area. Then, the command `git commit -m "create a folder called images and moved the png files into the folder"` This commit is stored in the git log and the remote repository is changed until the user types in the following command: `git push origin master`. This command would push all the committed changes to the master branch in the origin, which is connected to the project's remote repository. Looking at the remote repository on GitHub, the directory is now updated and in sync with the local directory on your desktop.

Now, let us create a new directory called paper. In this directory, we will create an html and markdown file using Makefile (to be discussed shortly). In the paper directory, create another directory called sections, which would include the main content of your project. We will create four text files in markdown format with the following titles: 00-abstract.md, 01-introduction.md, 02-discussion.md, and 03-conclusions.md.

```
mkdir paper
cd paper
mk sections
cd sections
```

To create a text file, you can use any text editor. In this project, I will use the sublime text editor. I type in `subl 00-abstract.md` onto the command line to create the abstract text file. You can use any text editor of your preference. For every text file you create, you have to type something into each file and save it. The result will show the markdown files in your present working directory, which is named *sections*.

```
subl 00-abstract.md
subl 01-introduction.md
subl 02-discussion.md
subl 03-concludions.md
```

![](../images/markdown-logo.png)

**Markdown** is a lightweight markup language that can be easily converted into HTML and other common formats. Markdown is known for its easy-to-read formatting syntax. You can write your markdown-formatted content in another basic text editor like TextEdit for Mac and Notepad on Windows. You can format your code and comments in various ways that is both easily read in the source code and the output file.

To finalize your report, we are going to use a **Makefile**, one of the effective ways to compile your source code files. A Makefile is a unique file that works with the *make* utility, which, in synergy, organizes and builds your projects. Go through a tutorial for Makefile to know its functions and how it works, but the main point of Makefile is to facilitate the project's reproducibility. By just typing `make` into the terminal, the project's html and markdown file are newly created. If you type in `make clean`, the html and markdown outputs will be deleted and the project will be made clean without the finalized reports. 

```
make
make clean
```

Within the Makefile, you can have variables, automatic variables, and wildcards for purposes of changing your file output names or specifically subsetting a list of files in a selected directory. The phony variables, all and clean, are just how makefile outputs or erases files, respectively. In addition, we use the cat function in the command to compile the 4 source files created earlier into a markdown file called paper.md. 

Make sure to place your Makefile in the main directory *stat159-fall2016-project1*. The Makefile should produce the mardkdown and paper outputs in the paper directory.

![](../images/pandoc-logo.png)

To create an html format of paper.md, we will use a command-line tool called **Pandoc**. There is no graphical user interface for Pandoc, but we can use the terminal to run it. Pandoc is an extremely useful tool since it fills in much of the unfamiliar syntax used in Markdown files and can then be used to easily convert a markdown file to html/pdf/latex, and vice-versa. We use the following code to convert paper.md to paper.html

```
pandoc paper/paper.md -s -o paper/paper.html
```

Once you have updated the four sections with valuable content, save it, git add them to the staging area, commit them to git using meaningful messages, and finally push all changes to the GitHub remote repository. Play around with make and make clean to see if it works and to understand how Makefile facilitates the reproducibility of the project.

---



