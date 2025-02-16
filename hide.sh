#!/bin/zsh -f
# <xbar.title>Hide Menu Extras</xbar.title>
# <xbar.version>v1</xbar.version>
# <xbar.author>Lucas Zheng</xbar.author>
# <xbar.desc>Hide menu bar extras to the left. Click to toggle visibility.</xbar.desc>
# <xbar.dependencies>zsh</xbar.dependencies>
# <swiftbar.runInBash>false</swiftbar.runInBash>

name=$0:t/1
opt="refresh=true"
file=$SWIFTBAR_PLUGIN_DATA_PATH/status
sfconfig=$(base64 <<< '{"renderingMode": "Hierarchical", "colors": [], "scale": "medium", "weight": "medium"}')
put() {
  print -- ${2:+$2} '|' ${1:+sfimage=$1 sfconfig=$sfconfig} ${3:+$3} $opt
  open -gu "swiftbar://setephemeralplugin?name=$name&content=$4";
}

pos=$(defaults read com.ameba.SwiftBar "NSStatusItem Preferred Position $0:t" 2>/dev/null)
let stat=0; touch $file; read stat < $file;

if [[ $SWIFTBAR_PLUGIN_REFRESH_REASON == MenuAction ]] (( stat = !stat ));
echo $stat > $file

if [[ -z $pos ]] {
  put 'dot.arrowtriangles.up.right.down.left.circle'
} elif (( stat )) {
  defaults write com.ameba.SwiftBar "NSStatusItem Preferred Position $name" -int $(( $pos + 1 ))
  put 'chevron.left' '' '' "${(l(500)( ))} | trim=false"
} else {
  put 'chevron.right'
}
