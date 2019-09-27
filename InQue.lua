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

local function networkListener(event)
 if ( event.isError ) then
        print( "Network error: ", event.response )
    else
    	if (event.response=='-1')then
	        print ("error adding details")
	    else    
	        customParams={OwnerID=event.response}
	        composer.gotoScene("Menu",{effect = "slideLeft", time = 500, params=customParams})
	    end    
 end
end


local function submit()
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="PrePets="..on1.."&PrePetsList="..on2.."&ObedientDog="..on3.."&ExpectedOutcomes="..on4.."&OwnerID="..OwnerID
	local params = {}
    params.headers = headers
    params.body = body
	network.request( "http://192.168.123.109:2431/pup/add.php", "POST", networkListener, params)
end


local function onSwitchPress( event )
    local switch = event.target
    on1=switch.id
end

local function onSwitchPress2( event )
    local switch = event.target
    on2=switch.id
end

local function onSwitchPress3( event )
    local switch = event.target
    on3=switch.id
end

local function onSwitchPress4( event )
    local switch = event.target
    on4=switch.id
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
    params=event.params
    OwnerID=params.OwnerID
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647  )
	
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
	msg = display.newText("Common Questions",display.contentCenterX*0.90,display.contentCenterY*0.05, "Bahnschrift SemiCondensed", 30)
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
			backgroundColor = {0.4117647059, 0.6823529412, 0.9294117647 },
		}
	)
	sceneGroup:insert(scrollView)
	
	local Text = display.newText( "Have you had pets before?", display.contentCenterX*0.9, display.contentCenterY*0.4, native.systemFont, 18 )
	scrollView:insert(Text)
 
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    no = widget.newSwitch(
		{
			left = 90,
			top = 115,
			style = "radio",
			id = "no",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	on1=no.id
	radioGroup:insert( no )
	scrollView:insert(radioGroup)
	
	local no = display.newText( "No", display.contentCenterX*0.4, display.contentCenterY*0.55, native.systemFont, 18 )
	scrollView:insert(no)
 
	yes = widget.newSwitch(
		{
			left = 190,
			top = 115,
			style = "radio",
			id = "yes",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( yes )
	--scrollView:insert(yes)
	
	local yes = display.newText( "Yes", display.contentCenterX*1.0, display.contentCenterY*0.55, native.systemFont, 18 )
	scrollView:insert(yes)
	
	local t = display.newText( "If Yes then ?", display.contentCenterX*0.9, display.contentCenterY*0.7, native.systemFont, 18 )
	scrollView:insert(t)
	
	local rg = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    dogs = widget.newSwitch(
		{
			left = 135,
			top = 180,
			style = "radio",
			id = "dogs",
			initialSwitchState = true,
			onPress = onSwitchPress2
		
		}
	)
	on2=dogs.id
	rg:insert( dogs )
	scrollView:insert(rg)
	
	local dogs = display.newText( "Dogs", display.contentCenterX*0.6, display.contentCenterY*0.8, native.systemFont, 18 )
	scrollView:insert(dogs)
 
	cats = widget.newSwitch(
		{
			left = 135,
			top = 215,
			style = "radio",
			id = "cats",
			onPress = onSwitchPress2
			
			
		}
	)
	rg:insert( cats )
	
	
	local cats = display.newText( "Cats", display.contentCenterX*0.6, display.contentCenterY*0.95, native.systemFont, 18 )
	scrollView:insert(cats)
	
	other = native.newTextField(160,270,180,30)
	other.placeholder = "Other"
	scrollView:insert(other)
	
	local info = display.newText( "What is an obedient dog to you ?", display.contentCenterX*1.0, display.contentCenterY*1.3, native.systemFont, 18 )
	scrollView:insert(info)
	
	local rGroup = display.newGroup()
	
	basic = widget.newSwitch(
		{
			left = 262,
			top = 330,
			style = "radio",
			id = "basic",
			initialSwitchState = true,
			onPress = onSwitchPress3,
		
		}
	)
	on3=basic.id
	rGroup:insert( basic )
	scrollView:insert(rGroup)
	
	local b = display.newText( "- Knows basic commands", display.contentCenterX*0.9, display.contentCenterY*1.45, native.systemFont, 18 )
	scrollView:insert(b)
	
	listens = widget.newSwitch(
		{
			left = 262,
			top = 380,
			style = "radio",
			id = "listens",
			onPress = onSwitchPress3,
		
		}
	)
	rGroup:insert( listens )
	
	local l = display.newText( "- Listens to my commands \n  and follows them ", display.contentCenterX*0.9, display.contentCenterY*1.65, native.systemFont, 18 )
	scrollView:insert(l)
	
	jump = widget.newSwitch(
		{
			left = 262,
			top = 430,
			style = "radio",
			id = "jump",
			onPress = onSwitchPress3,
		
		}
	)
	rGroup:insert( jump )
	
	local j = display.newText( "- Does not jump up \n on people ", display.contentCenterX*0.75, display.contentCenterY*1.88, native.systemFont, 18 )
	scrollView:insert(j)
	
	walks = widget.newSwitch(
		{
			left = 262,
			top = 480,
			style = "radio",
			id = "walks",
			onPress = onSwitchPress3,
		
		}
	)
	rGroup:insert( walks )
	
	local w = display.newText( "- Walks on the lead well", display.contentCenterX*0.85, display.contentCenterY*2.08, native.systemFont, 18 )
	scrollView:insert(w)
	
	submissive = widget.newSwitch(
		{
			left = 262,
			top = 525,
			style = "radio",
			id = "submissive",
			onPress = onSwitchPress3,
		
		}
	)
	rGroup:insert( submissive )
	
	local s = display.newText( "- Submissive", display.contentCenterX*0.55, display.contentCenterY*2.25, native.systemFont, 18 )
	scrollView:insert(s)
	
	mannered = widget.newSwitch(
		{
			left = 262,
			top = 570,
			style = "radio",
			id = "mannered",
			onPress = onSwitchPress3,
		
		}
	)
	rGroup:insert( mannered )
	
	local m = display.newText( "- Is well mannered in lots\n  of situations", display.contentCenterX*0.85, display.contentCenterY*2.45, native.systemFont, 18 )
	scrollView:insert(m)
	
	local imp = display.newText( "Important outcomes of dog training ?", display.contentCenterX*1.0, display.contentCenterY*2.70, native.systemFont, 18 )
	scrollView:insert(imp)
	
	local rgrp = display.newGroup()
	
	dogout = widget.newSwitch(
		{
			left = 262,
			top = 670,
			style = "radio",
			id = "dogout",
			initialSwitchState = true,
			onPress = onSwitchPress4,
		
		}
	)
	on4=dogout.id
	rgrp:insert( dogout )
	scrollView:insert(rgrp)
	
	local dg = display.newText( "- So I can take my dog out \n  and about with me", display.contentCenterX*0.8, display.contentCenterY*2.90, native.systemFont, 18 )
	scrollView:insert(dg)
	
	willlistens = widget.newSwitch(
		{
			left = 262,
			top = 725,
			style = "radio",
			id = "willlistens",
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( willlistens )
	
	local wl = display.newText( "- So they will listens to me", display.contentCenterX*0.8, display.contentCenterY*3.10, native.systemFont, 18 )
	scrollView:insert(wl)
	
	charge = widget.newSwitch(
		{
			left = 262,
			top = 775,
			style = "radio",
			id = "charge",
			onPress = onSwitchPress4,
		
		}
	)
	rgrp:insert( charge )
	
	local c = display.newText( "- So I can be in charge \n  of my dog ", display.contentCenterX*0.72, display.contentCenterY*3.30, native.systemFont, 18 )
	scrollView:insert(c)
	
	wmannered = widget.newSwitch(
		{
			left = 262,
			top = 830,
			style = "radio",
			id = "wmannered",
			onPress = onSwitchPress4,
		
		}
	)
	rgrp:insert( wmannered )
	
	local wm = display.newText( "- So they will be well mann-\n  ered in different situations", display.contentCenterX*0.8, display.contentCenterY*3.55, native.systemFont, 18 )
	scrollView:insert(wm)
	
	communicate = widget.newSwitch(
		{
			left = 262,
			top = 885,
			style = "radio",
			id = "communicate",
			onPress = onSwitchPress4,
		
		}
	)
	rgrp:insert( communicate )
	
	local cm = display.newText( "- To allow me to communicate\n  well with my dog", display.contentCenterX*0.84, display.contentCenterY*3.80, native.systemFont, 18 )
	scrollView:insert(cm)
	
	Other = native.newTextField(120,970,150,30)
	Other.placeholder = "Other"
	scrollView:insert(Other)
	
	Submit = widget.newButton(
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


