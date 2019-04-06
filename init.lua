------------------------------------------
--  [Bookmarks]  rewritten by Joe Koop  --
------------------------------------------

function round(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

local write_gofile = function()
	local output = ''
	for player, user in pairs(GONETWORK) do
		output = output..player..'{'
		for name, coords in pairs(GONETWORK[player]) do
			output = output..name..'('..coords.x..','..coords.y..','..coords.z..')'
		end
		output = output..'}'
	end
	local f = io.open(minetest.get_worldpath()..'/bookmarks.dat', "w")
    f:write(output)
    io.close(f)
end

GONETWORK = {}

local gonfile = io.open(minetest.get_worldpath()..'/bookmarks.dat', "r")
if gonfile then
	local contents = gonfile:read()
	io.close(gonfile)
	if contents ~= nil then
		local users = contents:split("}")
		for h,user in pairs(users) do
			local player, bookmarks = unpack(user:split("{"))
			GONETWORK[player] = {}
			local entries = bookmarks:split(")")
			for i,entry in pairs(entries) do
				local goname, coords = unpack(entry:split("("))
				local p = {}
				p.x, p.y, p.z = string.match(coords, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
				if p.x and p.y and p.z then
					GONETWORK[player][goname] = {x = tonumber(p.x),y= tonumber(p.y),z = tonumber(p.z)}
				end
			end
		end
	end
end

minetest.register_chatcommand("bmset", {
	params = "<bookmark name>",
	description = "Set a bookmark",
	func = function(name, param)
		local target = minetest.env:get_player_by_name(name)
		if target then
			if GONETWORK[name] == nil then
				GONETWORK[name] = {}
			end
			GONETWORK[name][param] = target:getpos()
			write_gofile()
			minetest.chat_send_player(name, "Bookmark \""..param.."\" set")
			return
		end
	end,
})

minetest.register_chatcommand("bm", {
	params = "<bookmark name>",
	description = "Go to bookmark",
	func = function(name, param)
		if GONETWORK[name] == nil then
			minetest.chat_send_player(name, "You have no bookmarks")
			return
		end
		if GONETWORK[name][param] == nil then
			minetest.chat_send_player(name, "No such bookmark: \""..param..'"')
			return
		end
		teleportee = minetest.env:get_player_by_name(name)
		teleportee:setpos(GONETWORK[name][param])
		minetest.chat_send_player(name, "Teleported to bookmark \""..param.."\"")
	end,
})

minetest.register_chatcommand("bmdel", {
	params = "<bookmark name>",
	description = "Delete bookmark",
	func = function(name, param)
		if GONETWORK[name] == nil then
			minetest.chat_send_player(name, "You have no bookmarks")
			return
		end
		if GONETWORK[name][param] then
			GONETWORK[name][param] = nil
			write_gofile()
			minetest.chat_send_player(name, "Bookmark \""..param.."\" deleted")
		end
	end,
})

minetest.register_chatcommand("bmls", {
	params = "<bookmark name>",
	description = "List all your bookmarks",
	func = function(name, param)
		if GONETWORK[name] == nil then
			minetest.chat_send_player(name, "You have no bookmarks")
			return
		end
		minetest.chat_send_player(name, 'Your bookmarks:')
		for go, coords in pairs(GONETWORK[name]) do
			minetest.chat_send_player(name, '"' ..go.. '" at '..round(coords.x)..','..round(coords.y)..','..round(coords.z))
		end
	end,
})
