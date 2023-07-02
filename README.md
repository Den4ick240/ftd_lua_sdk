# From the Depths LUA SDK

A couple of tools to make it easier and for you to write Lua scripts for your From the Depths crafts.

It includes:

- build.py script for separating your lua code in several files
- I.lua file that contains all From the Depths interface functions with documentation. Can be used for with some IDE (I use neovim) for autocompletion and displaying documentation.

## build.py

With this you can write your code in separate files and than have it combined into one file that you can copy-paste into LUA Box.

BTW this script was ~95% written by ChatGPT

### Features

- Combines several files into one
- Can collapse files to a single line to save space in the LUA Box
- Can exclude some files that you don't want in the LUA Box (stubs for example)
- Automatically copies the result into your clipboard if you have pyperclip installed

### Usage

build.py must be run from the root of your lua project. It will scan for all lua files in the current working directory.

Use require('path.to.file.lua') inside your lua files to indicate that some files depend on others (see [example](./low/ExampleClass.lua)).

When run without arguments, build.py will combine all the files into one. If you pass some file as argument, it will only combine the given file and it's dependencies.

If you want some file to be collapsed into a single file, just add following line to it:

```
-- ONE LINE
```

If you don't want some file to be included in the result (like I.lua for example), just add following line to it:

```
-- NO INCLUDE
```

The result will be saved in .build folder.

## I.lua

This file contains stubs for all From the Depths functions and fields that can be used inside LUA Box. All of them are documented based on in game description.

Just add this to your lua script:

```
require('I.lua')
```

And than your IDE should pick it up and start giving you autocompletion suggestions.

I generated this file by parsing [this file](https://gist.github.com/SurvivorBob/955f815a10b104183983a5cd44377892).
