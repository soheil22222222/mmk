package.path = package.path .. ';.luarocks/s     end
        end
      end
      -- One patterns matches
      return
    end
  end
end

-- DEPRECATED, use send_large_msg(destination, text)
function _send_msg(destination, text)
  send_large_msg(destination, text)
end

-- Save the content of _config to config.lua
function save_config( )
  serialize_to_file(_config, './data/config.lua')
  print ('saved config into ./data/config.lua')
end

-- Returns the config from config.lua file.
-- If file doesn't exist, create it.
function load_config( )
  local f = io.open('./data/config.lua', "r")
  -- If config.lua doesn't exist
  if not f then
    print ("Created new config file: data/config.lua")
    create_config()
  else
    f:close()
  end
  local config = loadfile ("./data/config.lua")()
  for v,user in pairs(config.sudo_users) do
    print("Sudo user: " .. user)
  end
  return config
end

-- Create a basic config.json file and saves it.
function create_config( )
  -- A simple config with basic plugins and ourselves as privileged user
  config = {
    enabled_plugins = {
    "plugins",
    "antiSpam",
    "antiArabic",
    "banHammer",
    "broadcast",
    "inv",
    "password",
    "welcome",
    "toSupport",
    "me",
    "toStciker_By_Reply",
    "invSudo_Super",
    "invSudo",
    "cpu",
    "badword",
    "aparat",
    "calculator",
    "antiRejoin",
    "pmLoad",
    "inSudo",
    "blackPlus",
    "toSticker(Text_to_stick)",
    "toPhoto_By_Reply",
    "inPm",
    "autoleave_Super",
    "black",
    "terminal",
    "sudoers",
    "time",
    "toPhoto",
    "toPhoto_Txt_img",
    "toSticker",
    "toVoice",
    "ver",
    "start",
    "whitelist",
    "plist",
    "inSuper",
    "inRealm",
    "onservice",
    "inGroups",
    "updater",
    "qrCode",
    "groupRequest_V2_Test",
    "inAdmin"

    },
    sudo_users = {192281402},--Sudo users
    moderation = {data = 'data/moderation.json'},
    about_text = [[ ]],
    help_text_realm = [[
📥Realm Commands📤

︿﹀︿﹀︿﹀︿﹀︿﹀︿﹀
💎 /creategroup [نام]

گروه جدید بسازید

💎 /createrealm [نام]
گروه اصلی بسازید
 
💎 /setname [اسم]
اسم گروه اصلی را تغییربدهید

💎 /setabout [GroupId] [Text]
درمورد ان گروه توضیحاتی را بنویسید (ایدی گروه را بدهید)

💎 /setrules [GroupID] [Text]
درمورد ان گروه قوانینی تعیین کنید (ایدی گروه رابدهید)

💎 /lock [GroupID] [setting]
تنظیمات گروهی را قفل بکنید

💎 /unlock [GroupID] [setting]
تنظیمات گروهی را ازقفل در بیاورید

💎 /settings[GroupID]
تنظیمات گروه را تغییر بدهید 

💎 /wholist
لیست تمامی اعضای گروه را با ایدی نشان خواهد داد

💎 /who
لیست تمامی اعضای گروه را باایدی نشان خواهد داد

💎 /type
درمورد نقش گروه بگیرید

💎 /kill chat [GroupID]
تمامی اعضای گروه را حذف میکنید

💎 /kill realm [RealmID]
تمامی اعضای گروه مادر را حذف میکند

💎 /addadmin [id|username]
اضافه شدن به ادمین بات

💎 /removeadmin [id|username]
حذف از ادمینی بات 

💎 /list groups
لیست گروه های بات

💎 /list realms
لیست گروه های اصلی بات

💎 /support
اضافه شدن به ساپورت بات (ترفیع)

💎 /-support
حذف شدن از ساپورت بات 
(تنزل)
💎 /log
تمامی عملیات گروه رامیدهد

💎 /broadcast [text]
فرستادن پیام به تمامی گروه های بات

میتوانید از هردوی کاراکتر های { /و ! } برای دستورات استفاده کنید

︿﹀︿﹀︿﹀︿﹀︿﹀︿﹀

Channel: @teleirans

]],
    help_text = [[
Commands list :
#kick [username|id]
You can also do it by reply
#who
Members list
#modlist
Moderators list
#promote [username]
Promote someone
#demote [username]
Demote someone
#kickme
Will kick user
#about
Group description
#setname [name]
Set group name
#rules
Group rules
#id
return group id or user id
#help
Returns help text
#lock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]
Lock group settings
*rtl: Kick user if Right To Left Char. is in name*
#unlock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict]
Unlock group settings
*rtl: Kick user if Right To Left Char. is in name*
#mute [all|audio|gifs|photo|video]
mute group message types
*If "muted" message type: user is kicked if message type is posted 
#unmute [all|audio|gifs|photo|video]
Unmute group message types
*If "unmuted" message type: user is not kicked if message type is posted 
#set rules <text>
Set <text> as rules
#set about <text>
Set <text> as about
#settings
Returns group settings
#muteslist
Returns mutes for chat
#muteuser [username]
Mute a user in chat
*user is kicked if they talk
*only owners can mute | mods and owners can unmute
#mutelist
Returns list of muted users in chat
#newlink
create/revoke your group link
#link
returns group link
#owner
returns group owner id
#setowner [id]
Will set id as owner
#setflood [value]
Set [value] as flood sensitivity
#stats
Simple message statistics
#save [value] <text>
Save <text> as [value]
#get [value]
Returns text of [value]
#clean [modlist|rules|about]
Will clear [modlist|rules|about] and set it to nil
#res [username]
returns user id
"!res @username"
#log
Returns group logs
#banlist
will return group ban list
other commands :
#vc [text]
#tosticker
#tophoto
#webshot [url]
#qr [text|link]
#echo [text]
#reqgp
#insta [id|video/photo link]
#tosupport
#version
**You can use "#", "!", or "/" to begin all commands
*Only owner and mods can add bots in group
*Only moderators and owner can use kick,ban,unban,newlink,link,setphoto,setname,lock,unlock,set rules,set about and settings commands
*Only owner can use res,setowner,promote,demote and log commands
]],
	help_text_super =[[
SuperGroup Commands:
#info
Displays general info about the SuperGroup
#admins
Returns SuperGroup admins list
#owner
Returns group owner
#modlist
Returns Moderators list
#bots
Lists bots in SuperGroup
#who
Lists all users in SuperGroup
#kick
Kicks a user from SuperGroup
*Adds user to blocked list*
#ban
Bans user from the SuperGroup
#unban
Unbans user from the SuperGroup
#id
Return SuperGroup ID or user id
*For userID's: !id @username or reply !id*
#id from
Get ID of user message is forwarded from
#setowner
Sets the SuperGroup owner
#promote [username|id]
Promote a SuperGroup moderator
#demote [username|id]
Demote a SuperGroup moderator
#setname
Sets the chat name
#setrules
Sets the chat rules
#setabout
Sets the about section in chat info(members list)
#newlink
Generates a new group link
#link
Retireives the group link
#rules
Retrieves the chat rules
#lock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict|tgservice]
Lock group settings
*rtl: Delete msg if Right To Left Char. is in name*
*strict: enable strict settings enforcement (violating user will be kicked)*
#unlock [links|flood|spam|Arabic|member|rtl|sticker|contacts|strict|tgservice]
Unlock group settings
*rtl: Delete msg if Right To Left Char. is in name*
*strict: disable strict settings enforcement (violating user will not be kicked)*
#mute [all|audio|gifs|photo|video]
mute group message types
*A "muted" message type is auto-deleted if posted
#unmute [all|audio|gifs|photo|video]
Unmute group message types
*A "unmuted" message type is not auto-deleted if posted
#setflood [value]
Set [value] as flood sensitivity
#settings
Returns chat settings
#muteslist
Returns mutes for chat
#muteuser [username]
Mute a user in chat
*If a muted user posts a message, the message is deleted automaically
*only owners can mute | mods and owners can unmute
#mutelist
Returns list of muted users in chat
#banlist
Returns SuperGroup ban list
#clean [rules|about|modlist|mutelist]
#del
Deletes a message by reply
#public [yes|no]
Set chat visibility in pm !chats or !chatlist commands
#res [username]
Returns users name and id by username
#log
Returns group logs
*Search for kick reasons using [#RTL|#spam|#lockmember]
other commands :
#vc [text]
#tosticker
#tophoto
#webshot [url]
#qr [text|link]
#echo [text]
#reqgp
#insta [id|video/photo link]
#tosupport
#version
#inv
**You can use "#", "!", or "/" to begin all commands
*Only owner can add members to SuperGroup
(use invite link to invite)
*Only moderators and owner can use block, ban, unban, newlink, link, setphoto, setname, lock, unlock, setrules, setabout and settings commands
*Only owner can use res, setowner, promote, demote, and log commands
Channel : @black_ch
]],
  }
  serialize_to_file(config, './data/config.lua')
  print('saved config into ./data/config.lua')
end

function on_our_id (id)
  our_id = id
end

function on_user_update (user, what)
  --vardump (user)
end

function on_chat_update (chat, what)
  --vardump (chat)
end

function on_secret_chat_update (schat, what)
  --vardump (schat)
end

function on_get_difference_end ()
end

-- Enable plugins in config.json
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("Loading plugin", v)

    local ok, err =  pcall(function()
      local t = loadfile("plugins/"..v..'.lua')()
      plugins[v] = t
    end)

    if not ok then
      print('\27[31mError loading plugin '..v..'\27[39m')
	  print(tostring(io.popen("lua plugins/"..v..".lua"):read('*all')))
      print('\27[31m'..err..'\27[39m')
    end

  end
end

-- custom add
function load_data(filename)

	local f = io.open(filename)
	if not f then
		return {}
	end
	local s = f:read('*all')
	f:close()
	local data = JSON.decode(s)

	return data

end

function save_data(filename, data)

	local s = JSON.encode(data)
	local f = io.open(filename, 'w')
	f:write(s)
	f:close()

end


-- Call and postpone execution for cron plugins
function cron_plugins()

  for name, plugin in pairs(plugins) do
    -- Only plugins with cron function
    if plugin.cron ~= nil then
      plugin.cron()
    end
  end

  -- Called again in 2 mins
  postpone (cron_plugins, false, 120)
end

-- Start and load values
our_id = 0
now = os.time()
math.randomseed(now)
started = false
