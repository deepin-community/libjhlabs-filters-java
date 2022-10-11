#!/bin/sh -e

# $1 = debian version
TAR=../libjhlabs-filters-java_$2.orig.tar.gz
DIR=jhlabs-filters-$2

# clean up the upstream tarball
mkdir $DIR
(cd $DIR; jar xf ../$3)
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' $DIR
rm -rf $3 $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
