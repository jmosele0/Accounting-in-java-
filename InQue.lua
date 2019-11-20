----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local json=require("json")
 

local Welcome

local widget = require ("widget")

local ipAddress

local rg

local on1
local on2
local on3
local on4
local other
local Others
local otherOn=1
local scrollView

local function skip()
	local customParams={address=ipAddress}
 composer.gotoScene("Login",{effect = "slideLeft", time = 500, params=customParams})
end


local function onSwitchPress( event )
    local switch = event.target
    if (switch.id=="yes") then
        on1=switch.id
        if (rg.disabled==true) then
        	rg.disabled=false
        	rg.alpha=1
        end
    elseif(switch.id=="no") then
    	on1=switch.id
        if (rg.disabled==false) then
            rg.disabled=true
            rg.alpha=0.4
            on2=""
        end    	

    elseif (switch.id=="dogs" or switch.id=="cats") then
        on2=switch.id

    elseif (switch.id=="basic" or switch.id=="listens" or switch.id=="jump" or switch.id=="walks" or switch.id=="submissive"
    	or switch.id=="mannered") then
    	on3=switch.id 

    elseif (switch.id=="dogout" or switch.id=="willlistens" or switch.id=="charge" or switch.id=="wmannered"
        or switch.id=="communicate" or switch.id=="other") then
        on4=switch.id	       
    end

end    

local function onSwitchPress2(event)
	local switch=event.target
	if (rg.disabled==true) then
		switch:setState({isOn=false})
	else
	    on2=switch.id	
	end
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
    local Email=params.Email
    local FirstName=params.FirstName
    local LastName=params.LastName
    local password=params.password
    local Gender=params.Gender
    local Couple=params.Couple
    local AgeRange=params.AgeRange
    local PostCode=params.PostCode
    ipAddress=params.address



    local function networkListener(event)
 if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=='-1')then
	     print ("error adding details")
	else
	     print(event.response)   
	     email=details.Email
	     customParams={OwnerID=details.OwnerID,
	                   address=ipAddress
	                  }
	     composer.gotoScene("Menu",{effect = "slideLeft", time = 500, params=customParams})
	end    
end    



local function submit()
	local headers = {}
	if (on2=="other") then
		on2=other.text
		print(on2)
	end
	if (on4=="other") then
	    on4=Others.text
	    print(on4)
	end    	
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="Email="..Email.."&FirstName="..FirstName.."&LastName="..LastName.."&password="..password.."&Gender="..Gender.."&Couple="..Couple.."&AgeRange="..AgeRange.."&PostCode="..
	PostCode.."&PrePets="..on1.."&PrePetsList="..on2.."&ObiedientDog="..on3.."&ExpectedOutcomes="..on4
	local params = {}
    params.headers = headers
    params.body = body
	network.request(ipAddress.."signup.php", "POST", networkListener, params)
end

	
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
	scrollView = widget.newScrollView(
		{
			top = 70,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 0,
			bottomPadding = 70,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			backgroundColor = {0.4117647059, 0.6823529412, 0.9294117647 },
		}
	)

	--scrollView:addEventListener("touch", myTouchListener)
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
			onPress = onSwitchPress
		
		}
	)
	on1=no.id
	radioGroup:insert( no )
	scrollView:insert(radioGroup)
	
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
	--scrollView:insert(yes)
	
	local yes = display.newText( "Yes", display.contentCenterX*1.0, display.contentCenterY*0.55, native.systemFont, 18 )
	scrollView:insert(yes)
	
	local t = display.newText( "If Yes then ?", display.contentCenterX*0.9, display.contentCenterY*0.7, native.systemFont, 18 )
	scrollView:insert(t)
	
	rg = display.newGroup()
	rg.alpha=0.4
	rg.disabled=true
 
-- Create two associated radio buttons (inserted into the same display group)
    local dogs = widget.newSwitch(
		{
			left = 190,
			top = 180,
			style = "radio",
			id = "dogs",
			onPress = onSwitchPress2
		
		}
	)
	rg:insert( dogs )
	scrollView:insert(rg)
	
	local dogs = display.newText( "Dogs", 151, display.contentCenterY*0.8, native.systemFont, 18 )
	scrollView:insert(dogs)
 
	local cats = widget.newSwitch(
		{
			left = 190,
			top = 215,
			style = "radio",
			id = "cats",
			onPress = onSwitchPress2
			
			
		}
	)

	rg:insert(cats)

	local otherSelect = widget.newSwitch(
		{
			left = 190,
			top = 250,
			style = "radio",
			id = "other",
			onPress = onSwitchPress2
			
			
		}
	)
	rg:insert( otherSelect )
	
	
	local cats = display.newText( "Cats", 151, display.contentCenterY*0.95, native.systemFont, 18 )
	scrollView:insert(cats)
	
	other = native.newTextField(160,300,90,30)
	other.placeholder = "Other"
	scrollView:insert(other)

	local otherText = display.newText( "Other", 151, 264, native.systemFont, 18 )
	scrollView:insert(otherText)
	
	local info = display.newText( "What is an obedient dog to you ?", display.contentCenterX*1.0, 342, native.systemFont, 18 )
	scrollView:insert(info)
	
	local rGroup = display.newGroup()
	
	local basic = widget.newSwitch(
		{
			left = 262,
			top = 360,
			style = "radio",
			id = "basic",
			initialSwitchState = true,
			onPress = onSwitchPress
		
		}
	)
	on3=basic.id
	rGroup:insert( basic )
	scrollView:insert(rGroup)
	
	local b = display.newText( "- Knows basic commands", display.contentCenterX*0.9, 378, native.systemFont, 18 )
	scrollView:insert(b)
	
	local listens = widget.newSwitch(
		{
			left = 262,
			top = 410,
			style = "radio",
			id = "listens",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( listens )
	
	local l = display.newText( "- Listens to my commands \n  and follows them ", display.contentCenterX*0.9, 426, native.systemFont, 18 )
	scrollView:insert(l)
	
	local jump = widget.newSwitch(
		{
			left = 262,
			top = 460,
			style = "radio",
			id = "jump",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( jump )
	
	local j = display.newText( "- Does not jump up \n on people ", display.contentCenterX*0.75, 481.2, native.systemFont, 18 )
	scrollView:insert(j)
	
	local walks = widget.newSwitch(
		{
			left = 262,
			top = 510,
			style = "radio",
			id = "walks",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( walks )
	
	local w = display.newText( "- Walks on the lead well", display.contentCenterX*0.85, 529.2, native.systemFont, 18 )
	scrollView:insert(w)
	
	local submissive = widget.newSwitch(
		{
			left = 262,
			top = 555,
			style = "radio",
			id = "submissive",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( submissive )
	
	local s = display.newText( "- Submissive", display.contentCenterX*0.55, 570, native.systemFont, 18 )
	scrollView:insert(s)
	
	local mannered = widget.newSwitch(
		{
			left = 262,
			top = 600,
			style = "radio",
			id = "mannered",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( mannered )
	
	local m = display.newText( "- Is well mannered in lots\n  of situations", display.contentCenterX*0.85, 618, native.systemFont, 18 )
	scrollView:insert(m)
	
	local imp = display.newText( "Important outcomes of dog training ?", display.contentCenterX*1.0, 678, native.systemFont, 18 )
	scrollView:insert(imp)
	
	local rgrp = display.newGroup()
	
	local dogout = widget.newSwitch(
		{
			left = 262,
			top = 700,
			style = "radio",
			id = "dogout",
			initialSwitchState = true,
			onPress = onSwitchPress
		
		}
	)
	on4=dogout.id
	rgrp:insert( dogout )
	scrollView:insert(rgrp)
	
	local dg = display.newText( "- So I can take my dog out \n  and about with me", display.contentCenterX*0.8, 726, native.systemFont, 18 )
	scrollView:insert(dg)
	
	local willlistens = widget.newSwitch(
		{
			left = 262,
			top = 755,
			style = "radio",
			id = "willlistens",
			onPress = onSwitchPress,
		
		}
	)
	rgrp:insert( willlistens )
	
	local wl = display.newText( "- So they will listens to me", display.contentCenterX*0.8, 774, native.systemFont, 18 )
	scrollView:insert(wl)
	
	local charge = widget.newSwitch(
		{
			left = 262,
			top = 805,
			style = "radio",
			id = "charge",
			onPress = onSwitchPress
		
		}
	)
	rgrp:insert( charge )
	
	local c = display.newText( "- So I can be in charge \n  of my dog ", display.contentCenterX*0.72, 822, native.systemFont, 18 )
	scrollView:insert(c)
	
	local wmannered = widget.newSwitch(
		{
			left = 262,
			top = 860,
			style = "radio",
			id = "wmannered",
			onPress = onSwitchPress
		
		}
	)
	rgrp:insert( wmannered )
	
	local wm = display.newText( "- So they will be well mann-\n  ered in different situations", display.contentCenterX*0.8, 882, native.systemFont, 18 )
	scrollView:insert(wm)
	
	communicate = widget.newSwitch(
		{
			left = 262,
			top = 915,
			style = "radio",
			id = "communicate",
			onPress = onSwitchPress
		
		}
	)
	rgrp:insert( communicate )
	
	local cm = display.newText( "- To allow me to communicate\n  well with my dog", display.contentCenterX*0.84, 942, native.systemFont, 18 )
	scrollView:insert(cm)

	local other2 = widget.newSwitch(
		{
			left = 262,
			top = 970,
			style = "radio",
			id = "other",
			onPress = onSwitchPress
		
		}
	)

	local other2Text = display.newText( "- Other", 40, 997, native.systemFont, 18 )
	scrollView:insert(other2Text)

	rgrp:insert(other2)
	
	Others = native.newTextField(120,1030,150,30)
	Others.placeholder = "Other"
	scrollView:insert(Others)
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 100,
        top = 1060,
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


