----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")

local function submit()
 composer.gotoScene("",{effect = "slideLeft", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

local function back ()	
	composer.gotoScene("Tracker",{effect = "slideRight", time = 500})
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
	msg = display.newText("Your experience:",display.contentCenterX,display.contentCenterY*0.20, "Forte", 30)
	sceneGroup:insert(msg)
	
	--back button
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 70,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 0,
			bottomPadding = 70,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
			backgroundColor = {0.4117647059, 0.6823529412, 0.9294117647},
		}
	)
	sceneGroup:insert(scrollView)
	
	local txt = display.newText( "(fetch experience from database ", display.contentCenterX*1.0, display.contentCenterY*0.1, native.systemFont, 18 )
	scrollView:insert(txt)
	
	
    

 
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


