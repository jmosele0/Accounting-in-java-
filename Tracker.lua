-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 


local widget = require ("widget")
 

 


 

--local function Onclick(avg)
      -- Print ("average")
--end

--local function poor()
      -- Print ("Poor")
--end

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	local sceneGroup = self.view
--adding background
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight*1.20)
	bg:setFillColor( 255,255,255)
	sceneGroup:insert(bg)
	
	--Adding Welcome Message
	Welcome = display.newText("Experience:",display.contentCenterX*0.80,display.contentCenterY*0.40, "Comic Sans MS", 40)
	Welcome:setFillColor( 0, 0, 1 )
	sceneGroup:insert(Welcome)
	

	
    Excellent = widget.newButton(
    {
        shape = "roundedRect",
        left = 13,
        top = 180,
        id = "review",
        label = "Excellent",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 0, 0, 1, 1 }, over={0,0,0} },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )	
	 sceneGroup:insert(Excellent)
	
	
	good = widget.newButton(
    {
        shape = "roundedRect",
        left = 13,
        top = 240,
        id = "review",
        label = "Good",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 0, 100, 0 }, over={0,0,0} },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )
	 sceneGroup:insert(good)
	
	
	
	average = widget.newButton(
    {
        shape = "roundedRect",
        left = 13,
        top = 300,
        id = "review",
        label = "Average",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 204, 204, 0}, over={ 0,0,0 } },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )
    sceneGroup:insert(average)

	poor = widget.newButton(
    {
        shape = "roundedRect",
        left = 13,
        top = 360,
        id = "review",
        label = "Poor",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 255, 0, 0 }, over={ 0,0,0} },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )
	sceneGroup:insert(poor)
	
	

function Excellent:touch( event )
  	if event.phase == "began" then
	ex = display.newText("Happy dog!",display.contentCenterX*1.60,display.contentCenterY*0.90, "Comic Sans MS", 20)
	ex:setFillColor( 0, 0, 1 )
	sceneGroup:insert(ex)
	return true
    end
end
 
Excellent:addEventListener( "touch", Excellent )

function good: touch( event )
  	if event.phase == "began" then
	go = display.newText("Good dog!",display.contentCenterX*1.60,display.contentCenterY*1.1, "Comic Sans MS", 20)
	go:setFillColor( 0, 0, 1 )
	sceneGroup:insert(go)
	return true
    end
end
 
good:addEventListener( "touch", good)


function average: touch( event )
  	if event.phase == "began" then
	avg = display.newText("Average!",display.contentCenterX*1.60,display.contentCenterY*1.3, "Comic Sans MS", 20)
	avg:setFillColor( 0, 0, 1 )
	sceneGroup:insert(avg)
	return true
    end
end
 
average:addEventListener( "touch", average)


function poor: touch( event )
  	if event.phase == "began" then
	poor = display.newText("Sad dog!",display.contentCenterX*1.60,display.contentCenterY*1.5, "Comic Sans MS", 20)
	poor:setFillColor( 0, 0, 1 )
	sceneGroup:insert(poor)
	return true
    end
end
 
poor:addEventListener( "touch", poor)

--average:addEventListener("tap", Onclick)

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
