#!/bin/zsh -f
# <xbar.title>Show App Windows</xbar.title>
# <xbar.version>v1</xbar.version>
# <xbar.author>Lucas Zheng</xbar.author>
# <xbar.desc>Shows all windows.</xbar.desc>
# <xbar.dependencies>zsh</xbar.dependencies>
# <swiftbar.type>streamable</swiftbar.type>
# <swiftbar.runInBash>false</swiftbar.runInBash>
setopt extended_glob
echo ':chevron.down:'
while (( 1 )) {
  text=${${${${"$( osascript -e '
  use scripting additions
  set text item delimiters to ASCII character 0
  tell application "System Events" to get the title of every window of ¬
    (every process whose background only is false) as text'; echo $'\0' )"\
//$'\n'/}//$'\0'##/$'\0'}//$'\0'/$' | symbolize=false emojize=false\n'}%$'\n'}
  echo '~~~'
  echo ':chevron.down:'
  echo '---'
  echo "$text"
  sleep 1
}
