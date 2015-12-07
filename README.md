# Spacesuit [BETA]
A script that will turn your computer into a software development workhorse.

You can run the script multiple times on the same machine safely. It installs,
skips, or upgrades software based on what is available on the machine already.

# Requirements

You can use the `mac` script on:

* OS X Mavericks (10.9)
* OS X Yosemite (10.10)
* OS X El Capitan (10.11)

And the `windows.ps1` script on:

* Windows 7
* Windows 8.1
* Windows 10

# Using Spacesuit

## OS X

Open up Terminal and run this command:

```
curl -sSL https://raw.githubusercontent.com/dlsucomet/spacesuit/master/mac | sh
```

## Windows

Open up command prompt with administrative privileges and run this command:

```
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/dlsucomet/spacesuit/master/windows.ps1'))"
```

# What's included in Spacesuit?

## All

* [git](https://git-scm.com/)
* [Sublime Text 3](https://www.sublimetext.com/3)
* [Slack](https://slack.com/)

## OS X

* [Homebrew](http://brew.sh/)
* [Homebrew Cask](http://caskroom.io/)

## Windows

* [chocolatey](chocolatey.org)
* [cmder](http://cmder.net/)

# Inspiration

Inspiration for this project mainly comes from thoughtbot's awesome
[`laptop`](https://github.com/thoughtbot/laptop) script.
