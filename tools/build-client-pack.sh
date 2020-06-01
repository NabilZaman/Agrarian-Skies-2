#!/usr/bin/env bash
# Must have zip installed

# Find the root of the project, follow symlinks
project_root=$( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )

# Subshell to go there and build the archive
(
    cd $project_root/..;
    rm -rf build/
    mkdir -p build/temp/agrarian_skies_2/overrides;
    cp manifest.json build/temp/agrarian_skies_2/;
    cp -r config maps mods resources scripts build/temp/agrarian_skies_2/overrides/;
    # subshell aganin because zip builds up the relative path in the archive
    (
        cd build/temp;
        zip -r9 ../agrarian_skies_2.zip agrarian_skies_2;
    )
    rm -rf build/temp
)

