----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")



local function networkListener(event)
    if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=="-1") then
	    print ("error inserting details")
	else    
		 local customParams={OwnerID=OwnerID,
		                     address=ipAddress}
	     composer.gotoScene("Menu",{effect = "slideLeft", time = 500})
    end
end



local function submit()

	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="ParentSiblingSighted="..ParentSiblingSighted.."&PersonalityConcerns="..PersonalityConcerns
	.."&FirstMet="..FirstMet.."&WhyThatName="..WhyThatName.."&DogID="..DogID
	local params = {}
    params.headers = headers
    params.body = body
	network.request( ipAddress.."generalinfo2.php", "POST", networkListener, params)

end


local function back ()	
	composer.gotoScene("dogProfile7",{effect = "slideRight", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    WhyThatName=switch.id
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
    local params=event.params
    DogID=params.dogID
    ParentSiblingSighted=params.parentSiblingSighted
    PersonalityConcerns=params.personalityConcerns
    FirstMet=params.firstMet
    ipAddress=params.address
    OwnerID=params.ownerID
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647  )
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)
	
	--back button
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	
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
	
	local txt = display.newText( "* Why did you pick this pet?", display.contentCenterX*1.0, display.contentCenterY*0.1, native.systemFont, 18 )
	scrollView:insert(txt)
	
	local rG = display.newGroup()
	
	local came = widget.newSwitch(
		{
			left = 262,
			top = 45,
			style = "radio",
			id = "came",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	WhyThatName=came.id
	rG:insert( came )
	scrollView:insert(came)
	
	local cu = display.newText( "Came up to me", display.contentCenterX*0.48, display.contentCenterY*0.27, native.systemFont, 18 )
	scrollView:insert(cu)
	
   local first = widget.newSwitch(
		{
			left = 262,
			top = 85,
			style = "radio",
			id = "first",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( first )
	scrollView:insert(first)
	
	local vff = display.newText( "Very Friendly when first meet", display.contentCenterX*0.8, display.contentCenterY*0.43, native.systemFont, 18 )
	scrollView:insert(vff)
	
	  local looked = widget.newSwitch(
		{
			left = 262,
			top = 125,
			style = "radio",
			id = "looked",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( looked )
	scrollView:insert(looked)
	
	local ll = display.newText( "I like how they looked", display.contentCenterX*0.65, display.contentCenterY*0.59, native.systemFont, 18 )
	scrollView:insert(ll)
	
	local mf = widget.newSwitch(
		{
			left = 262,
			top = 165,
			style = "radio",
			id = "mf",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( mf )
	scrollView:insert(mf)
	
	local omf = display.newText( "Only male/female in the litter", display.contentCenterX*0.77, display.contentCenterY*0.75, native.systemFont, 18 )
	scrollView:insert(omf)
	
		local wasleft = widget.newSwitch(
		{
			left = 262,
			top = 205,
			style = "radio",
			id = "wasleft",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( wasleft)
	scrollView:insert(wasleft)
	
	local wl = display.newText( "Only one that left in the litter", display.contentCenterX*0.77, display.contentCenterY*0.92, native.systemFont, 18 )
	scrollView:insert(wl)
	
	local onlyone = widget.newSwitch(
		{
			left = 262,
			top = 245,
			style = "radio",
			id = "onlyone",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( onlyone)
	scrollView:insert(onlyone)
	
	local oo = display.newText( "Only one in the litter", display.contentCenterX*0.58, display.contentCenterY*1.08, native.systemFont, 18 )
	scrollView:insert(oo)
	
	local outgoing = widget.newSwitch(
		{
			left = 262,
			top = 285,
			style = "radio",
			id = "outgoing",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( outgoing)
	scrollView:insert(outgoing)
	
	local op = display.newText( "Most Outgoing Puppy", display.contentCenterX*0.59, display.contentCenterY*1.25, native.systemFont, 18 )
	scrollView:insert(op)
	
	local quiestest = widget.newSwitch(
		{
			left = 262,
			top = 325,
			style = "radio",
			id = "quiestest",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(quiestest)
	scrollView:insert(quiestest)
	
	local q = display.newText( "Quietest Puppy", display.contentCenterX*0.47, display.contentCenterY*1.42, native.systemFont, 18 )
	scrollView:insert(q)
	
	local sorry = widget.newSwitch(
		{
			left = 262,
			top = 365,
			style = "radio",
			id = "sorry",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(sorry)
	scrollView:insert(sorry)
	
	local sry = display.newText( "Felt sorry for them", display.contentCenterX*0.55, display.contentCenterY*1.58, native.systemFont, 18 )
	scrollView:insert(sry)
	
		local size = widget.newSwitch(
		{
			left = 262,
			top = 405,
			style = "radio",
			id = "size",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(size)
	scrollView:insert(size)
	
	local sz = display.newText( "Size of dog suited my lifestyle", display.contentCenterX*0.8, display.contentCenterY*1.77, native.systemFont, 18 )
	scrollView:insert(sz)
	
	local activity = widget.newSwitch(
		{
			left = 262,
			top = 445,
			style = "radio",
			id = "activity",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(activity)
	scrollView:insert(activity)
	
	local act = display.newText( "Activity level suited my lifestyle", display.contentCenterX*0.8, display.contentCenterY*1.93, native.systemFont, 18 )
	scrollView:insert(act)
	
	local age = widget.newSwitch(
		{
			left = 262,
			top = 485,
			style = "radio",
			id = "age",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(age)
	scrollView:insert(age)
	
	local ag = display.newText( "Age of dog suited my lifestyle", display.contentCenterX*0.8, display.contentCenterY*2.1, native.systemFont, 18 )
	scrollView:insert(ag)
	
	local sbreed = widget.newSwitch(
		{
			left = 262,
			top = 525,
			style = "radio",
			id = "sbreed",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(sbreed)
	scrollView:insert(sbreed)
	
	local sb = display.newText( "Had a similar breed in past", display.contentCenterX*0.75, display.contentCenterY*2.25, native.systemFont, 18 )
	scrollView:insert(sb)
	
	local abreed = widget.newSwitch(
		{
			left = 262,
			top = 565,
			style = "radio",
			id = "abreed",
			onPress = onSwitchPress,
		
		}
	)
	rG:insert(abreed)
	scrollView:insert(abreed)
	
	local ab = display.newText( "Always had that breed", display.contentCenterX*0.65, display.contentCenterY*2.42, native.systemFont, 18 )
	scrollView:insert(ab)
	
	local Ots = native.newTextField(110,630,150,30)
	Ots.placeholder = "Other"
	scrollView:insert(Ots)
	
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 660,
        id = "Submit",
        label = "Submit",
		width='98',
		height='30',
        onEvent = userSubmit,
       fillColor = { default={  255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647}, over={ 2, 5, 1.5, 2.2 } },

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


