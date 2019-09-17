----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")

local function skip()
 composer.gotoScene("Login",{effect = "slideLeft", time = 500})
end

local function submit()
 composer.gotoScene("Login",{effect = "slideLeft", time = 500})
end


local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

 
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
	
	display.setDefault( "background", 0.26666666666, 0.44705882352 ,0.76862745098  )
	
		local Skip = widget.newButton(
    {
       shape = "roundedRect",
        left = 170,
        top = 35,
        id = "Skip",
        label = "Skip",
		width='98',
		height='30',
        onEvent = userSkip,
       fillColor = { default={ 255,255,255  }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(Skip)
Skip:addEventListener("tap", skip )

	
	--Adding Message
	msg = display.newText("Common Questions",display.contentCenterX*0.90,display.contentCenterY*0.05, "Forte", 30)
	sceneGroup:insert(msg)


	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 70,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 0,
			bottomPadding = 70,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
			backgroundColor = {0.26666666666, 0.44705882352 ,0.76862745098 },
		}
	)
	sceneGroup:insert(scrollView)
	
	local Text = display.newText( "Have you had pets before?", display.contentCenterX*0.9, display.contentCenterY*0.4, native.systemFont, 18 )
	scrollView:insert(Text)
 
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local no = widget.newSwitch(
		{
			left = 90,
			top = 115,
			style = "radio",
			id = "no",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	radioGroup:insert( no )
	scrollView:insert(no)
	
	local no = display.newText( "No", display.contentCenterX*0.4, display.contentCenterY*0.55, native.systemFont, 18 )
	scrollView:insert(no)
 
	local yes = widget.newSwitch(
		{
			left = 190,
			top = 115,
			style = "radio",
			id = "yes",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( yes )
	scrollView:insert(yes)
	
	local yes = display.newText( "Yes", display.contentCenterX*1.0, display.contentCenterY*0.55, native.systemFont, 18 )
	scrollView:insert(yes)
	
	local t = display.newText( "If Yes then ?", display.contentCenterX*0.9, display.contentCenterY*0.7, native.systemFont, 18 )
	scrollView:insert(t)
	
	local rg = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local dogs = widget.newSwitch(
		{
			left = 135,
			top = 180,
			style = "radio",
			id = "dogs",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( dogs )
	scrollView:insert(dogs)
	
	local dogs = display.newText( "Dogs", display.contentCenterX*0.6, display.contentCenterY*0.8, native.systemFont, 18 )
	scrollView:insert(dogs)
 
	local cats = widget.newSwitch(
		{
			left = 135,
			top = 215,
			style = "radio",
			id = "cats",
			onPress = onSwitchPress
			
			
		}
	)
	rg:insert( cats )
	scrollView:insert(cats)
	
	local cats = display.newText( "Cats", display.contentCenterX*0.6, display.contentCenterY*0.95, native.systemFont, 18 )
	scrollView:insert(cats)
	
	local other = native.newTextField(160,270,180,30)
	other.placeholder = "Other"
	scrollView:insert(other)
	
	local info = display.newText( "What is an obedient dog to you ?", display.contentCenterX*1.0, display.contentCenterY*1.3, native.systemFont, 18 )
	scrollView:insert(info)
	
	local rGroup = display.newGroup()
	
	local basic = widget.newSwitch(
		{
			left = 262,
			top = 330,
			style = "radio",
			id = "basic",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( basic )
	scrollView:insert(basic)
	
	local b = display.newText( "- Knows basic commands", display.contentCenterX*0.9, display.contentCenterY*1.45, native.systemFont, 18 )
	scrollView:insert(b)
	
	local listens = widget.newSwitch(
		{
			left = 262,
			top = 380,
			style = "radio",
			id = "listens",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( listens )
	scrollView:insert(listens)
	
	local l = display.newText( "- Listens to my commands \n  and follows them ", display.contentCenterX*0.9, display.contentCenterY*1.65, native.systemFont, 18 )
	scrollView:insert(l)
	
	local jump = widget.newSwitch(
		{
			left = 262,
			top = 430,
			style = "radio",
			id = "jump",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( jump )
	scrollView:insert(jump)
	
	local j = display.newText( "- Does not jump up \n on people ", display.contentCenterX*0.75, display.contentCenterY*1.88, native.systemFont, 18 )
	scrollView:insert(j)
	
	local walks = widget.newSwitch(
		{
			left = 262,
			top = 480,
			style = "radio",
			id = "walks",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( walks )
	scrollView:insert(walks)
	
	local w = display.newText( "- Walks on the lead well", display.contentCenterX*0.85, display.contentCenterY*2.08, native.systemFont, 18 )
	scrollView:insert(w)
	
	local submissive = widget.newSwitch(
		{
			left = 262,
			top = 525,
			style = "radio",
			id = "submissive",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( submissive )
	scrollView:insert(submissive)
	
	local s = display.newText( "- Submissive", display.contentCenterX*0.55, display.contentCenterY*2.25, native.systemFont, 18 )
	scrollView:insert(s)
	
	local mannered = widget.newSwitch(
		{
			left = 262,
			top = 570,
			style = "radio",
			id = "mannered",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( mannered )
	scrollView:insert(mannered)
	
	local m = display.newText( "- Is well mannered in lots\n  of situations", display.contentCenterX*0.85, display.contentCenterY*2.45, native.systemFont, 18 )
	scrollView:insert(m)
	
	local imp = display.newText( "Important outcomes of dog training ?", display.contentCenterX*1.0, display.contentCenterY*2.70, native.systemFont, 18 )
	scrollView:insert(imp)
	
	local rgrp = display.newGroup()
	
	local dogout = widget.newSwitch(
		{
			left = 262,
			top = 670,
			style = "radio",
			id = "dogout",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( dogout )
	scrollView:insert(dogout)
	
	local dg = display.newText( "- So I can take my dog out \n  and about with me", display.contentCenterX*0.8, display.contentCenterY*2.90, native.systemFont, 18 )
	scrollView:insert(dg)
	
	local willlistens = widget.newSwitch(
		{
			left = 262,
			top = 725,
			style = "radio",
			id = "willlistens",
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( willlistens )
	scrollView:insert(willlistens)
	
	local wl = display.newText( "- So they will listens to me", display.contentCenterX*0.8, display.contentCenterY*3.10, native.systemFont, 18 )
	scrollView:insert(wl)
	
	local charge = widget.newSwitch(
		{
			left = 262,
			top = 775,
			style = "radio",
			id = "charge",
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( charge )
	scrollView:insert(charge)
	
	local c = display.newText( "- So I can be in charge \n  of my dog ", display.contentCenterX*0.72, display.contentCenterY*3.30, native.systemFont, 18 )
	scrollView:insert(c)
	
	local wmannered = widget.newSwitch(
		{
			left = 262,
			top = 830,
			style = "radio",
			id = "wmannered",
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( wmannered )
	scrollView:insert(wmannered)
	
	local wm = display.newText( "- So they will be well mann-\n  ered in different situations", display.contentCenterX*0.8, display.contentCenterY*3.55, native.systemFont, 18 )
	scrollView:insert(wm)
	
	local communicate = widget.newSwitch(
		{
			left = 262,
			top = 885,
			style = "radio",
			id = "communicate",
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( communicate )
	scrollView:insert(communicate)
	
	local cm = display.newText( "- To allow me to communicate\n  well with my dog", display.contentCenterX*0.84, display.contentCenterY*3.80, native.systemFont, 18 )
	scrollView:insert(cm)
	
	local Other = native.newTextField(120,970,150,30)
	Other.placeholder = "Other"
	scrollView:insert(Other)
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 100,
        top = 1000,
        id = "Submit",
        label = "Submit",
		width='98',
		height='30',
        onEvent = userSubmit,
       fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.26666666666, 0.44705882352, 0.76862745098 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
scrollView:insert(Submit)
Submit:addEventListener("tap", submit)
 
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


