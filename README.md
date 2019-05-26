# arduino-makefile

This script lets you simply compile and upload a simple arduino project from command line 

## Installation:

You have to install arduino-cli

`wget https://downloads.arduino.cc/arduino-cli/arduino-cli-latest-linux64.tar.bz2`</br>
`tar -xjvf arduino-cli-latest-linux64.tar.bz2`</br>
`mv arduino-cli-latest-linux64 /usr/local/bin/arduino-cli`</br>
`rm arduino-cli-latest-linux64`</br>
`arduino-cli core install arduino:avr`

## create your project:

`arduino-cli sketch new <project-name>`</br>

## compile your project:

- copy this Makefile in your project path
- change the 3 firsts lines:
    - the name of the project (same of the current folder)
    - the board (uno by default)
    - the CPU if your board is an Arduino Nano

`make configure #to automatically find the right board port`</br>
`make`


open the root file of your project to correct and type `norminette`, select errors to correct.
