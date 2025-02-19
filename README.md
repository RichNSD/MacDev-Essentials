# MacDev Essentials

Essential tools and scripts to get you setup for coding in MacOS.


# Tools & Apps
## Homebrew
Homebrew is a package manager for MacOS, and it's probably the easiest and most popular option for installing and maintaining most (if not all) CLI & Dev Tools. It allows you to install and manage software packages from the command line.

Visit the [Homebrew website](https://brew.sh/) for more information.

### Installation

To install Homebrew, run the following command in your terminal:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## CLI Tools
Once you have Homebrew installed, you can use it to install a variety of CLI tools. Start by installing the **Absolute Essentials** below. Then, you can explore my **Recommended Tools** to see what else you might want to install. Or you can just take my word for it and install all of them with the **CLI Tools Easy Installer** script below.

### Absolute Essentials
**The following packages are literally the *bare minimum* you need to get started** with coding on MacOS, or any other system.

| Package Name | CLI Name | Description |
| :--- | :---: | :--- |
| Git SCM | `git` | Version control system. The entire coding and development  world revolves around this tool. |
| GitHub CLI | `gh` | GitHub's official CLI tool, usually easier to use than `git` (but it is *not* a replacement) |
| Bash (update) | `bash` | The universal standard for [UNIX](https://en.wikipedia.org/wiki/Unix) (Linux & MacOS) scripting and development. |


Can you *technically* code without them? Sure, if you enjoy pain and suffering, and if you want to render pretty much every guide and tutorial you find online useless. So if you're a masochist, feel free to skip this section.

You can install them all at once by running the **CLI Tools Easy Installer** script below.



---

# Custom CLI Commands
This section contains custom CLI commands that I've created to make my life easier. You can add them to your `.bash_profile` or `.bashrc` file to use them in your terminal. They are all just simple aliases or functions using existing CLI tools with some custom options.

## Detailed LS Command
This command is a custom alias for the `ls` command that displays a detailed list of files and directories in the current directory. It's a simple way to get a more detailed view of the files in your current directory. There are two alias options for this command. Both perform the same function.
- `lsd` uses a unique alias so you can still use the original `ls` command.
- `ls` will override the original `ls` command so that it always displays the detailed list (not recommended for beginners).

### Option 1: `lsd` Alias
```bash
alias lsd="ls -agGFBh --group-directories-first --hyperlink=auto --color=auto"
```

### Option 2: `ls` Alias
```bash
alias ls="ls -agGFBh --group-directories-first --hyperlink=auto --color=auto"
```



---

Write me a bash script that will do the following:
1. Check to see if Homebrew is installed.
2. If Homebrew is not installed, install it.
3. Check to see if Git is installed.
4. If Git is not installed, install it.
	- If Git is installed, check to see if it's up to date.
	- If Git is not up to date, update it.

Include verbose output for each step, and include a summary at the end of the script that tells the user what was installed or updated.