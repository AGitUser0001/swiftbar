#!/bin/zsh -f
# <xbar.title>Show App Windows</xbar.title>
# <xbar.version>v1</xbar.version>
# <xbar.author>Lucas Zheng</xbar.author>
# <xbar.desc>Shows all windows.</xbar.desc>
# <xbar.dependencies>zsh</xbar.dependencies>
# <swiftbar.type>streamable</swiftbar.type>
# <swiftbar.runInBash>false</swiftbar.runInBash>
echo ':chevron.down:'
while (( 1 )) {
  text="$( osascript -e 'set text item delimiters to "\n"
  tell application "System Events" to get the title of every window of every application process as text' | sed -e '/^$/d' -e 's/$/ | symbolize=false emojize=false/' )"
  echo '~~~'
  echo ':chevron.down:'
  echo "$text"
  sleep 1
}
