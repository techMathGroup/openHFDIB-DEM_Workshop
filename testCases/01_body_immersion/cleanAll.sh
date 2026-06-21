#!/bin/sh

if [ "$1" = "clean" ]; then
    do_clean=true
else
    do_clean=false
fi

rootDir=$(pwd)

echo "Working from directory: $rootDir"

# directories to skip during compilation
skip_dirs="VoFHFDIB multiphaseInterHFDIBFoam"

# clean the test cases
for pd in ./*/ ; do
    [ -L "${pd%/}" ] && continue
    cd $pd
            bash ./Allclean
            rm -rf *.OpenFOAM
    cd ..
done
cd $rootDir

exit 0
