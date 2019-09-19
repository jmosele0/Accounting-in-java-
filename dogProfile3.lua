----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local widget = require ("widget")


local function Next()
 composer.gotoScene("dogProfile4",{effect = "slideLeft", time = 500})
end


local function back ()	
	composer.gotoScene("dogProfile2",{effect = "slideRight", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
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
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647  )
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)
	
	--back button
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	
	local txt = display.newText( "* Where did I come from?", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	sceneGroup:insert(txt)
	
	local rg = display.newGroup()
	
		local breeder = widget.newSwitch(
		{
			left = 220,
			top = 115,
			style = "radio",
			id = "breeder",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( breeder)
	sceneGroup:insert(breeder)
	
	
	local rb = display.newText( "Registered breeder", display.contentCenterX*0.8, display.contentCenterY*0.55, native.systemFont, 18 )
	sceneGroup:insert(rb)
	
	local pound = widget.newSwitch(
		{
			left = 220,
			top = 155,
			style = "radio",
			id = "pound",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( pound)
	sceneGroup:insert(pound)
	
	local pd = display.newText( "Pound", display.contentCenterX*0.49, display.contentCenterY*0.73, native.systemFont, 18 )
	sceneGroup:insert(pd)
	
	local litter = widget.newSwitch(
		{
			left = 220,
			top = 195,
			style = "radio",
			id = "litter",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( litter)
	sceneGroup:insert(litter)
	
	local bl = display.newText( "Backyard litter", display.contentCenterX*0.69, display.contentCenterY*0.88, native.systemFont, 18 )
	sceneGroup:insert(bl)
	
	local friend = widget.newSwitch(
		{
			left = 220,
			top = 235,
			style = "radio",
			id = "friend",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( friend)
	sceneGroup:insert(friend)
	
	local frd = display.newText( "Friend ", display.contentCenterX*0.5, display.contentCenterY*1.05, native.systemFont, 18 )
	sceneGroup:insert(frd)
	
	local member = widget.newSwitch(
		{
			left = 220,
			top = 275,
			style = "radio",
			id = "member",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( member)
	sceneGroup:insert(member)
	
	local fm = display.newText( "Family member", display.contentCenterX*0.72, display.contentCenterY*1.22, native.systemFont, 18 )
	sceneGroup:insert(fm)
	
	local rescue = widget.newSwitch(
		{
			left = 220,
			top = 315,
			style = "radio",
			id = "rescue",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( rescue)
	sceneGroup:insert(rescue)
	
	local ra = display.newText( "Rescue association", display.contentCenterX*0.82, display.contentCenterY*1.38, native.systemFont, 18 )
	sceneGroup:insert(ra)
	
	local found = widget.newSwitch(
		{
			left = 220,
			top = 355,
			style = "radio",
			id = "found",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( found)
	sceneGroup:insert(found)
	
	local fd = display.newText( "Found dog", display.contentCenterX*0.62, display.contentCenterY*1.55, native.systemFont, 18 )
	sceneGroup:insert(fd)
	
	local fail = widget.newSwitch(
		{
			left = 220,
			top = 395,
			style = "radio",
			id = "fail",
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( fail)
	sceneGroup:insert(fail)
	
	local ff = display.newText( "Foster fail", display.contentCenterX*0.61, display.contentCenterY*1.72, native.systemFont, 18 )
	sceneGroup:insert(ff)
	
	
    local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 450,
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


