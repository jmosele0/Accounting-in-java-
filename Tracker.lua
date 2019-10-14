-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 


local widget = require ("widget")
 

 

local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end


local function home()
 composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
end

local function help()
 composer.gotoScene("category",{effect = "slideLeft", time = 500})
end 

local function previous()
 composer.gotoScene("experience_list",{effect = "slideLeft", time = 500})
end


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
	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(255,255,255)
	sceneGroup:insert(bg)
	
	
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 
 
	
	--Adding Welcome Message
	Welcome = display.newText("Experience:",display.contentCenterX*0.67,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 40)
	Welcome:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(Welcome)
	
	
	local notes = native.newTextField(160,150,280,30)
	notes.placeholder = "Experience"
	sceneGroup:insert(notes)
	
	
	
	--Adding Welcome Message
	Help = display.newText("Need help?",display.contentCenterX*1.40,display.contentCenterY*0.25, "Bahnschrift SemiCondensed", 20)
	Help:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(Help)
	Help:addEventListener("tap", help)
	
	 --menu button
    m = display.newImage("menu.png", 30, -19)
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
    --Adding Welcome Message
	ex = display.newText("View Previous Experiences",display.contentCenterX*1.30,display.contentCenterY*0.10, "Bahnschrift SemiCondensed", 20)
	ex:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(ex)
	ex:addEventListener("tap", previous)
	
	
	 
    Excellent = widget.newButton(
    {
        shape = "roundedRect",
        left = 20,
        top = 180,
        id = "review",
        label = "Happy and Relaxed",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 0.4117647059, 0.6823529412, 0.92941176471 }, over={0,0,0} },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )	
	 sceneGroup:insert(Excellent)
	
	
	good = widget.newButton(
    {
        shape = "roundedRect",
        left = 20,
        top = 240,
        id = "review",
        label = "Mildly Nervous",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={0,0,0} },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )
	 sceneGroup:insert(good)
	
	
	
	average = widget.newButton(
    {
        shape = "roundedRect",
        left = 20,
        top = 300,
        id = "review",
        label = "Moderately Nervous",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647}, over={ 0,0,0 } },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )
    sceneGroup:insert(average)

	poor = widget.newButton(
    {
        shape = "roundedRect",
        left = 20,
        top = 360,
        id = "review",
        label = "Extremely Nervous",
		value = "25",
        onEvent = myeventListener,
        fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={ 0,0,0} },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
    )
	sceneGroup:insert(poor)
	


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
