#!/bin/zsh -f
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
