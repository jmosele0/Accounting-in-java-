-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


local widget = require( "widget" )
 


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local W

local widget = require ("widget")
 
local function nott ()	
	composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
end
 

 local function home ()	
	composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
end 

local function menu()
 composer.gotoScene("Menu",{effect = "slideLeft", time = 500})
end

-- create()
function scene:create( event )
	
    local sceneGroup = self.view
	
	
	
	display.setDefault( "background", 0.26666666666, 0.44705882352, 0.76862745098 )
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(255,255,255)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(0.26666666666, 0.44705882352, 0.76862745098)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 --menu button
    h = display.newImage("home.png", 300, -17 )
	sceneGroup:insert(h)
	h:addEventListener("tap", home )
	 
	
	 m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	--Adding Welcome Message
	W = display.newText("Add notes",display.contentCenterX,display.contentCenterY*0.60,  "Forte", 30)
	W:setFillColor( 0.26666666666, 0.44705882352, 0.76862745098)
	sceneGroup:insert(W)
	
	
	
	
	local notes = native.newTextField(160,200,280,30)
	notes.placeholder = "Add notes"
	sceneGroup:insert(notes)
	
	
	

 local submit = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 280,
        id = "Submit",
        label = "submit",
        onEvent = usersubmit,
       fillColor = { default={0.26666666666, 0.44705882352, 0.76862745098 }, over={ 1, 0.5, 0.8, 4 } },
       labelColor = { default={ 255,255,255}, over={ 2, 5, 1.5, 2.2 } },
	}
)
sceneGroup:insert(submit)
submit:addEventListener("tap", nott)
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





	
