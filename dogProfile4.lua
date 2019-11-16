----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")


local function networkListener(event)
    if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=="-1") then
	    print ("error inserting details")
	else
	    print(event.response)    
	    customParams={dogID=DogID,
	                  address=ipAddress,
	                  ownerID=OwnerID}
	    composer.gotoScene("dogProfile5",{effect = "slideLeft", time = 500, params=customParams})
 end
end


local function Next()
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="KnowledgeOfBreed="..on.."&DogID="..DogID
	local params = {}
    params.headers = headers
    params.body = body
	network.request( ipAddress.."generalinfo1.php", "POST", networkListener, params)
end


local function back ()	
	composer.gotoScene("dogProfile3",{effect = "slideRight", time = 500})
end


local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
end

 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    local params=event.params
    DogID=params.DogID
    ipAddress=params.address
    OwnerID=params.ownerID
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
	
		--add border
	local rect = display.newRect( 170, 200, 190, 170 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	sceneGroup:insert(rect)
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)
	
	--back button
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	

	
	local rgp = display.newGroup()
	
	local bd = display.newText( " * Did you know about the breed? ", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	sceneGroup:insert(bd)
	
		local lots = widget.newSwitch(
		{
			left = 200,
			top = 125,
			style = "radio",
			id = "lots",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	on=lots.id	
	rgp:insert( lots)
	sceneGroup:insert(lots)
	
	local ls = display.newText( " Lots ", display.contentCenterX*0.78, display.contentCenterY*0.6, native.systemFont, 18 )
	sceneGroup:insert(ls)
	
	local some = widget.newSwitch(
		{
			left = 200,
			top = 175,
			style = "radio",
			id = "some",
			onPress = onSwitchPress,
		
		}
	)
	rgp:insert( some)
	sceneGroup:insert(some)
	
	local s = display.newText( " Some ", display.contentCenterX*0.8, display.contentCenterY*0.8, native.systemFont, 18 )
	sceneGroup:insert(s)
	
	local none = widget.newSwitch(
		{
			left = 200,
			top = 225,
			style = "radio",
			id = "none",
			onPress = onSwitchPress,
		
		}
	)
	rgp:insert( none)
	sceneGroup:insert(none)
	
	local n = display.newText( " None ", display.contentCenterX*0.8, display.contentCenterY*1.0, native.systemFont, 18 )
	sceneGroup:insert(n)
	

	
    local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 300,
        id = "nxt",
        label = "Next",
		width='98',
		height='30',
        onEvent = userNext,
       fillColor = { default={  255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647}, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(nxt)
nxt:addEventListener("tap", Next )
	

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
	        composer.removeScene("SignUp")
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


