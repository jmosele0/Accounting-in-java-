-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


local widget = require( "widget" )
local json=require("json")
 


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local W

local widget = require ("widget")



local function networkListener( event )
 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
	  if (event.response=="") then
	  	  print ("email or password invalid")
		  native.showAlert( "Corona", "Invalid email or password.", { "OK" } )

	  else
	  	  print(event.response)
	  	  local customParams={OwnerID=event.response}
	  	  composer.gotoScene("Menu",{effect = "slideUp", time = 500, params=customParams})	  
	  end      
    end
end


 
 local function home ()	
	composer.gotoScene("home",{effect = "slideUp", time = 500})
end

local function login ()	
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"
	local body="Email="..username.text.."&password="..pw.text
	local params = {}
    params.headers = headers
    params.body = body
	network.request( "http://192.168.123.109:2431/pup/select.php", "POST", networkListener, params)
	
	
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 

--input listener

-- create()
function scene:create( event )
	
    local sceneGroup = self.view
	
	
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
	
	
	--Adding Welcome Message
	W = display.newText("Log-in",display.contentCenterX,display.contentCenterY*0.60, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(W)
	
	
	
	
	username = native.newTextField(160,200,180,30)
	username.placeholder = "Username"
	username.hasBackground=true
	sceneGroup:insert(username)
	


	
	pw = native.newTextField(160,240,180,30)
	pw.placeholder = "password"
	pw.isSecure=true
	pw.hasBackground=true
	sceneGroup:insert(pw)
 
 local Login = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 280,
        id = "Login",
        label = "Login",
        onEvent = userLogin,
       fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
       labelColor = { default={  0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } },
	}
)
sceneGroup:insert(Login)
Login:addEventListener("tap", login)
end

 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
	  composer.removeScene("Login")
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene







