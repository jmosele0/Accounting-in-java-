-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )
 
local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- local function Canine ()	
--	composer.gotoScene("Canine",{effect = "slideLeft", time = 500})
--end



  
  
-- create()
function scene:create( event )
	
    local sceneGroup = self.view
	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	
	

	
	m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	local msg = native.newTextField(110,490,200,30)
	msg.placeholder = "Send Message"
	sceneGroup:insert(msg)
	
	
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 220,
        top = 476,
        id = "Send",
        label = "Send",
		width='90',
		height='27',
        onEvent = userSubmit,
       fillColor = { default={255,255,255}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={0.4117647059, 0.6823529412, 0.9294117647}, over={ 2, 5, 1.5, 2.2 } },

    }
)

     sceneGroup:insert(Submit)

	
end


 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
	local scrollView = self.view
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
	local scrollView = self.view
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
	local scrollView = self.view
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


