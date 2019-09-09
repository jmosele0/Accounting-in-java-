----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local widget = require ("widget")


 -- ScrollView listener
local function scrollListener( event )
 
    local phase = event.phase
    local direction = event.direction
	
	-- If the scrollview has reached it's scroll limit.
	if event.limitReached then
		if "up"== direction then
			print("Reached Top Limit")
		elseif "down" == direction then
			print("Reached Bottom Limit")
		end
	end
	
	return true
end
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local bg
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	local sceneGroup = self.view
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight*1.20)
	bg:setFillColor( 0.26666666666, 0.44705882352 ,0.76862745098)
	sceneGroup:insert(bg)
	
	--title of the scene
	head = display.newText("Category Information", display.contentCenterX*1.0,display.contentCenterY*0.01,"Forte",30)
	sceneGroup:insert(head)
	
		-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 30,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 500,
			bottomPadding = 70,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
                HAPPY AND RELAXED
		
			•	 Relaxed face and body
			
			•	 Helicopter tail or relaxed low tail wag
			
			•	 Wanting to interact with surroundings
			
			•	 Happy to take treats from owner or strangers
		
		
		
		START OFF NERVOUS, BUT BECAME MORE COMFORTABLE
				
			•	 Started displaying nervous body signals,   but the started displaying the happy and   relaxed body signals



		        MILDLY NERVOUS
					   
			•	 Lip licking
			
			•	 Yawning when not tired
			
			•	 Check in (Looking at you to check that everything is ok)
			
			•	 Tail between legs
			
			•	 Looking around at surrounding
			
			•	 Could still be taking treats and interacting with surroundings



                MODERATELY NERVOUS 
					
			•	 Any mildly nervous signs
			
			•	 Lifting lip
			
			•	 Growling 
			
			•	 Avoiding touch of strangers
			
			•	 Will not take treats 
			
			•	 Pacing 


		
		        EXTREMLEY NERVOUS
					 
			•	 Any moderately nervous signs
		
      		•	 Biting or snapping at people

	]]
local text = display.newText(text,0,10,270,0,"Helvetica", 14)
text:setTextColor(0)
text.x = display.contentCenterX
scrollView:insert(text)
 
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


