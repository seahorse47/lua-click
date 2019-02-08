#!/bin/sh

# entry_file="./tests/main.lua"

if [ x$LUA == x ]
then
    LUA="lua"
    # LUA="luajit"
fi

$LUA -v

$LUA -e "package.path=package.path..[[;./src/?.lua]]" "$@"
