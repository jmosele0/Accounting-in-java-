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
 
 local function Canine ()	
	composer.gotoScene("Canine",{effect = "slideLeft", time = 500})
end

 local function dog ()	
	composer.gotoScene("Profile",{effect = "slideLeft", time = 500})
end

 local function Tracr ()	
	composer.gotoScene("Tracker",{effect = "slideLeft", time = 500})
end
 

 local function logout ()	
	composer.gotoScene("Login",{effect = "slideLeft", time = 500})
end


 local function Training ()	
	composer.gotoScene("Training",{effect = "slideLeft", time = 500})
end
 
 
 
-- create()
function scene:create( event )
	
    local sceneGroup = self.view
	--adding background
	display.setDefault( "background", 0.26666666666, 0.44705882352, 0.76862745098 )
	
	
	Can = display.newText("Canine Enrichment",display.contentCenterX,display.contentCenterY*0.60, "Comic Sans MS", 30)
	sceneGroup:insert(Can)
	Can:addEventListener("tap", Canine )
	--Writing Message "About"
	Tracker = display.newText("Experience Tracker",display.contentCenterX,display.contentCenterY*0.40, "Comic Sans MS", 30)
	sceneGroup:insert(Tracker)
	Tracker:addEventListener("tap", Tracr)
	
	dogP = display.newText("view Profile",display.contentCenterX,display.contentCenterY*0.80, "Comic Sans MS", 30)
	sceneGroup:insert(dogP)
	dogP:addEventListener("tap", dog)
	--Writing Message "About"
	
	logT = display.newText("Log Out",display.contentCenterX,display.contentCenterY*1.20, "Comic Sans MS", 30)
	sceneGroup:insert(logT)
	logT:addEventListener("tap", logout)
	--Writing Message "About"
	
	T = display.newText("Training",display.contentCenterX,display.contentCenterY*1.0, "Comic Sans MS", 30)
	sceneGroup:insert(T)
	T:addEventListener("tap", Training)
	
	
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
