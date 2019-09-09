-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
 


--Adding Welcome message
--local function header()
--display.newText("Welcome",display.contentCenterX,display.contentCenterY, "Comic Sans MS", 50)
--end
--header()

local Welcome

local widget = require ("widget")
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 



 local function newscene()
 composer.gotoScene("SignUp",{effect = "slideLeft", time = 500})
end

local function menu()
 composer.gotoScene("Menu",{effect = "slideLeft", time = 500})
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
	--adding background
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight*1.20)
	bg:setFillColor( 0.26666666666, 0.44705882352, 0.76862745098 )
	sceneGroup:insert(bg)
	
	--Adding Welcome Message
	Welcome = display.newText("Overall Tracker",display.contentCenterX,display.contentCenterY*0.40, "Comic Sans MS", 40)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
     
	 --menu button
    m = display.newImage("menu.png", 30, -7 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	 
-- Slider listener
local function sliderListener( event )
    print( "Slider at ",value, "%" )
end
 
-- Create the widget
local slider = widget.newSlider(
    {
        x = display.contentCenterX*0.30,
        y = display.contentCenterY,
        orientation = "vertical",
        height = 200,
        value = 10,  -- Start slider at 10% (optional)
        listener = sliderListener,
    }
)
sceneGroup:insert(slider)
slider: addEventListener("touch", sliderListener)	
	
	--HomePage = display.newText("HomePage",display.contentCenterX*0.90,display.contentCenterY*2.0, "Comic Sans MS", 25)
	--sceneGroup:insert(HomePage)
	--HomePage:addEventListener("tap", newscene)


	

	--Adding Timer in this app which display how long a user is seing the app
	
	--sceneGroup:insert(Timer)
	
 
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
