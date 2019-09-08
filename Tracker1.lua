local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local widget = require ("widget")


function scene:create( event )
 
    local sceneGroup = self.view
	
	display.setDefault( "background", 255,255,255 )
	
	
	
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
	head = display.newText("Experience:", display.contentCenterX*0.80,display.contentCenterY*0.40,"Arial",26)
	head:setFillColor(0,0,1)
	sceneGroup:insert(head)
	
	
	

	excellent = widget.newButton(
	{
		id = "review",
		label = "",
		onEvent = myeventListener,
		fontSize = 24,
		emboss = false,
		left = 13,
		top = 180,
		shape = "roundedRect",
		width = 200,
		height = 50,
		fillColor = { default = {0,0,1}, over = { 1, 0.7, 0.5} }		
	}
	)
	sceneGroup:insert(excellent)
	excellent:addEventListener ("touch", excellent)
	
	--creating button for unknown breaches
	UnknownBreaches = widget.newButton(
	{
		id = "unknownBreaches",
		label = "Breaches from unknown \n              sources",
		onEvent = myeventListener,
		fontSize = 24,
		emboss = false,
		left = 10,
		top = 280,
		shape = "roundedRect",
		width = 300,
		height = 60,
		fillColor = { default = { 1, 0.7, 0.5}, over = { 1, 0.7, 0.5} }
	}
	)
	sceneGroup:insert(UnknownBreaches)
	UnknownBreaches:addEventListener ("touch", complaint_unknown)	
	
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

