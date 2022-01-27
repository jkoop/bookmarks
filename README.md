# Bookmarks

## :warning: NOTICE

This mod has moved to [jkoop/better-bookmarks](https://github.com/jkoop/better-bookmarks).

This old copy is here only because GitHub doesn't like redirecting stuff and I didn't want you to get a 404.

## Old ReadMe

Minetest mod to keep location bookmarks like sethome https://joekoop.com/bookmarks

Licence: MIT

Minetest mod to keep location bookmarks.  This is a drastic improvment over [mauvebic](https://forum.minetest.net/viewtopic.php?id=2321)'s [bookmarks](https://github.com/cornernote/minetest-megapack/tree/master/mods/bookmarks).

![screenshot](https://raw.githubusercontent.com/joek2/bookmarks/master/screenshot.png)

It features a better command set: `bm` for **b**ook**m**arks, and is player-specific.

The data file is incompatible with mauvebic's bookmarks, but it uses a different filename, `bookmarks.dat`.

To convert your \*.go file, find and replace:

`:` with `(` and

`;` with `)` and prepend the file with `singleplayer{` and append it with `}`.

## Commands:

`/bm <bookmark name>` Go to bookmark

`/bmset <bookmark name>` Set a bookmark

`/bmdel <bookmark name>` Delete a bookmark

`/bmls <bookmark name>` List all your bookmarks
