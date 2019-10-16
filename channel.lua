local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local function back ()	
	composer.gotoScene("Menu",{effect = "slideRight", time = 500})
	webView:removeSelf()
	composer.removeScene("channel")
end
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	display.setDefault( "background", 1, 1, 1)
	webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
    webView:request( "https://www.youtube.com/channel/UCY_FKzvY-gmO-wOMmI9xAZg/featured?disable_polymer=1" )
	sceneGroup:insert(webView)
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	sceneGroup:insert(backImage)
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
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