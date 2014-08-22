#!/bin/sh
#
# Teeny file to pull down and use the latest images disk, if we don't already
# have one.
#
# Chris Weyl <christopher.weyl@savvis.com> 2014

IMAGES_TARBALL='images.tar.gz'
IMAGES_URL="http://download.panamax.io/$IMAGES_TARBALL"

# bail (in a good way) if we find a disk
if [ -f images.vdi      ] ; then
    echo "images.vdi exists; reusing it."
    exit 0
fi

# download the tarball iff we don't have it and explode it
[ -f $IMAGES_TARBALL ] || curl $IMAGES_URL || exit $?
tar -zxvf $IMAGES_TARBALL

echo "Success!"
# fin...
