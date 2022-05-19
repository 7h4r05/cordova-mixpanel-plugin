
#/bin/bash

# set -e
set -v

VERSION="4.1.5"
ZIPFILE="v$VERSION.zip"
pwd=$(pwd)
echo $pwd
if [[ $pwd != *"/src/ios" ]]; then
 echo "must run the script from within src/ios itself, cd into it and then run again"
 exit 1
fi

# download mixpanel-iphone code and copy over src, keeping the needed LICENSE
curl -Ls https://github.com/mixpanel/mixpanel-iphone/archive/$ZIPFILE -O $ZIPFILE
unzip $ZIPFILE
rm -f $ZIPFILE
mv Mixpanel Mixpanel_bak
mv mixpanel-iphone-$VERSION/Sources .
mv Sources Mixpanel
mv Mixpanel_bak/LICENSE Mixpanel/
rm -rf mixpanel-iphone-$VERSION

# next steps: git add Mixpanel dir. 
# if any files are newely added or deleted then run "assetsHelper.js" and copy the output to plugin.xml as needed

# cd ../../
# git apply src/ios/ios_wathckit_removal.patch 
