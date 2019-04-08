# Bookmarks

Licence: [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html)

Minetest mod to keep location bookmarks.  This is a drastic improvment over [mauvebic](https://forum.minetest.net/viewtopic.php?id=2321)'s [bookmarks](https://github.com/cornernote/minetest-megapack/tree/master/mods/bookmarks).

![screenshot](https://raw.githubusercontent.com/joek2/bookmarks/master/screenshot.png)

It features a better command set: `bm` for **b**ook**m**arks, and is player-specific.

The data file is incompatible with mauvebic's bookmarks, but it uses a different filename, `bookmarks.dat`.

To convert your \*.go file, file and replace:

`:` with `(` and

`;` with `)` and prepend the file with `singleplayer{` and append it with `}`.

## Commands:

`/bm <bookmark name>` Go to bookmark

`/bmset <bookmark name>` Set a bookmark

`/bmdel <bookmark name>` Delete a bookmark

`/bmls <bookmark name>` List all your bookmarks
