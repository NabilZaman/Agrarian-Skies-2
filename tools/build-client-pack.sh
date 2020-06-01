#!/usr/bin/env bash
# Must have zip installed

# Find the root of the project, follow symlinks
project_root=$( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )

# Subshell to go there and build the archive
(
    cd $project_root/..;
    mkdir -p build/;
    rm build/agrarian_skies_2.zip;
    zip -r9 build/agrarian_skies_2.zip config/ maps/ mods/ resources/ scripts/ manifest.json
)

