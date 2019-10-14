local composer = require( "composer" )
 
local scene = composer.newScene()
 
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

    bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
    bg:setFillColor(255,255,255)
    sceneGroup:insert(bg)
    
    bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
    bgr:setFillColor(255,155,255)
    sceneGroup:insert(bgr)
    
    --Adding Welcome Message
    Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
    sceneGroup:insert(Welcome)

    Rating = display.newText("Rating:",display.contentCenterX,display.contentCenterY*0.4, "Bahnschrift SemiCondensed", 28)
    Rating:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
    sceneGroup:insert(Rating)
    
    tier1 = display.newCircle( 50, 250, 20)
    tier1:setFillColor(0, 0.4, 1, 1)
    sceneGroup:insert(tier1)    

    tier2 = display.newCircle( 105, 250, 20 )
    tier2:setFillColor(0, 0.4, 1, 0.8)
    sceneGroup:insert(tier2)

    tier3 = display.newCircle( 160, 250, 20 )
    tier3:setFillColor(0, 0.4, 1, 0.6)
    sceneGroup:insert(tier3)                        
    
    tier4 = display.newCircle( 215, 250, 20 )
    tier4:setFillColor(0, 0.4, 1, 0.4)
    sceneGroup:insert(tier4)

    tier5 = display.newCircle( 270, 250, 20 )
    tier5:setFillColor(0, 0.4, 1, 0.2)
    sceneGroup:insert(tier5)

    local happy = display.newText("Happy",50, 280, "Bahnschrift SemiCondensed", 14)
    happy:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
    sceneGroup:insert(happy)    

    local anxious = display.newText("Anxious",270, 280, "Bahnschrift SemiCondensed", 14)
    anxious:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
    sceneGroup:insert(anxious)  
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