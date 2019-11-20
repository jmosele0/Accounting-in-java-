 -----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
local composer = require( "composer" )

local path = system.pathForFile( "ip-address.txt", system.ResourceDirectory )

local file, errorString=io.open(path, "r")
email=""

if not file then
	print("File error: " .. errorString)

else
    local ipAddress=file:read("*a")	
    io.close(file)
    file=nil
    customParams={address=ipAddress}
    composer.gotoScene( "Home1" , { effect="fade", time=500, params=customParams })

end

