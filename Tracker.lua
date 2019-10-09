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

local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
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
    local radioGroup=display.newGroup()
	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(255,255,255)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(255,155,255)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 
 
	
	--Adding Welcome Message
	Welcome = display.newText("Experience:",display.contentCenterX*0.58,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 40)
	Welcome:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(Welcome)
	
	
	local notes = native.newTextField(160,150,280,30)
	notes.placeholder = "Experience"
	sceneGroup:insert(notes)
	
	
	
	--Adding Welcome Message
	Help = display.newText("Need help?",display.contentCenterX*1.60,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 20)
	Help:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(Help)
	Help:addEventListener("tap", help)
	
	 --menu button
    m = display.newImage("menu.png", 30, -19)
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )


	sceneGroup:insert(radioGroup)
	
    
	 
	
    local happy = widget.newSwitch(
		{
			left = 40,
			top = 210,
			style = "radio",
			id = "Happy",
			initialSwitchState = false,
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(happy)

	 on=happy.id

	local happyText = display.newText("Happy",120, 225, "Bahnschrift SemiCondensed", 20)
	happyText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(happyText)
	
	
	local startedNervous = widget.newSwitch(
		{
			left = 40,
			top = 250,
			style = "radio",
			id = "startedNervous",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(startedNervous)

	 local startedNervousText = display.newText("Started off nervous",172, 265, "Bahnschrift SemiCondensed", 20)
	startedNervousText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(startedNervousText)
	
	
	
	local mildlyNervous = widget.newSwitch(
		{
			left = 40,
			top = 290,
			style = "radio",
			id = "mildlyNervous",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(mildlyNervous)

	 local mildlyNervousText = display.newText("Mildly nervous",154.5, 305, "Bahnschrift SemiCondensed", 20)
	 mildlyNervousText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	 sceneGroup:insert(mildlyNervousText)

	local moderatelyAnxious = widget.newSwitch(
		{
			left = 40,
			top = 330,
			style = "radio",
			id = "moderatelyAnxious",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(moderatelyAnxious)

	 local extremelyAnxious = widget.newSwitch(
		{
			left = 40,
			top = 370,
			style = "radio",
			id = "extremelyAnxious",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(extremelyAnxious)

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
