# ldeck macOS setup #

Scripted installation of all your apps and utilities.

## Features: ##

### 0. Simply requires a macOS with Xcode install  ###

The intension is to automate as much as possible beyond a basic install.

Simply install / update your macOS and Xcode intalls.

Then clone this repo and run the setup.

### 1. Homebrew automatically installed ###

If `brews` or `casks` options are enabled and `which brew` fails, [Homebrew](https://brew.sh) will be automatically installed.

i.e., the script [installers/install_homebrew.sh](installers/install_homebrew.sh) will be executed if needed.

### 2. Simulation mode ###

    ./setup.sh --simulate ...

To see what would happen if you installed everything simply add the switches for both `all` and `simulate`:

    ./setup.sh -sa

This will simply print out the commands that would be run to the console.

### 3. Three optional kinds of apps / utilities automatically installed ###

1. **brews** to install are listed in [brews.txt](brews.txt).

    These are anything you would manually install via `brew install`.

2. **casks** to install are listed in [casks.txt](casks.txt).

    These are anything you would manually install via `brew cask install`.

3. **utils** are custom shell scripts you add to the [utils](utils) folder.

    These can be executed _if_ they are marked as executable in the filesystem. Otherwise they'll be ignored.

    This allows you to enable only those scripts you want. NB, the utils are sorted numerically and are then executed in that order.

## Quick Help ##

Help can be printed out using `./setup.sh -h` or `./setup.sh --help`.

    $ ./setup.sh --help
    ldeck macOS setup
    Usage: ./setup.sh [-a|--all] [-b|--brews] [-c|--casks] [-s|--simulate] [-u|--utils] [-v|--version] [-h|--help]
        -a,--all: install everything (off by default)
	    -b,--brews: brew install all uncommented items in brews.txt (off by default)
	    -c,--casks: brew cask install all uncommented items in casks.txt (off by default)
	    -s,--simulate: simulate execution only (off by default)
	    -u,--utils: find, sort and execute utils/*.sh that are executable (off by default)
	    -v,--version: Prints version
	    -h,--help: Prints help

## Contributing ##

Hey if you find this useful and can see opportunities to make this even better that'd be great.

Why not open an issue to chat about it and then raise a pull request?

## Credits ##

Thanks to [Argsbash](https://argbash.io/) for command line option processing.
