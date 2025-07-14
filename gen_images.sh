#!/usr/bin/env bash

mkdir -p build/examples

for file in $(ls src/examples/*); do
    file=${file#src/}
    module=${file%.*}
    gleam run --module $module > build/$module.svg
done
