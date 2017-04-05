# ULX ttt_mark

git remote add origin https://github.com/zikeji/ulx-ttt_mark.git
git push -u origin master

## Installation

Install as you would a normal ULX addon, or install from the Workshop here: http://steamcommunity.com/sharedfiles/filedetails/?id=899130656

## Usage

The command is available to all players. If no target is specified, will mark the person the player is looking at, if valid.

### From Chat

- Mark player as friendly
 - `!mark f [player]`
 - `!mark friend [player]`
 - `!mark friendly [player]`
- Mark player as suspicious
 - `!mark s [player]`
 - `!mark susp [player]`
 - `!mark suspicious [player]`
- Mark player as avoid
 - `!mark a [player]`
 - `!mark avoid [player]`
- Mark player as kill
 - `!mark k [player]`
 - `!mark kill [player]`
- Mark player as kill
 - `!mark m [player]`
 - `!mark miss [player]`
 - `!mark missing [player]`

### From Console
You can use the short forms (f, m, etc.) however console does have ULX autocomplete support.

- Mark player as friendly
 - `ulx_mark friendly [player]`
- Mark player as suspicious
 - `ulx_mark suspicious [player]`
- Mark player as avoid
 - `ulx_mark avoid [player]`
- Mark player as kill
 - `ulx_mark kill [player]`
- Mark player as kill
 - `ulx_mark missing [player]`