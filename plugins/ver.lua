do

function run(msg, matches)
  return [[ T e L e S e e d +
-----------------------------------
A new bot for manage your Supergroups.
-----------------------------------
#Channel: @TeleIran
-----------------------------------
#SUDO: @Xxx_sargardan_xxX
-----------------------------------
#Name_bot: Teleseedplus
-----------------------------------
#Bot number : +989011455635
-----------------------------------
Bot version : 1.1 ]]
end

return {
  description = "Shows bot version", 
  usage = "version: Shows bot version",
  patterns = {
    "^[#!/]version$"
  }, 
  run = run 
}

end
