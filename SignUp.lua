----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")

local on1
local on2
local on3

local function onSwitchPress( event )
        local switch = event.target
        if (switch.id=="male" or switch.id=="female") then
            on1=switch.id
        elseif(switch.id=="yes" or switch.id=="no") then
            on2=switch.id      
        elseif(switch.id=="under 18" or switch.id=="18-30" or switch.id=="30-50" or switch.id=="over 50") then
            on3=switch.id    
          
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
    local ipAddress=params.address
    
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )

	local scrollView = widget.newScrollView(
		{
			top = 0,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 0,
			bottomPadding = 0,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
			backgroundColor = {0.4117647059, 0.6823529412, 0.9294117647 },
		}
	)
	sceneGroup:insert(scrollView)
	
	local rect = display.newRect( 160, 338.6, 250, 272.2 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	scrollView:insert(rect)
	
	--Adding Welcome Message
	local Welcome = display.newText("Welcome",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	scrollView:insert(Welcome)
	
	local username = native.newTextField(160,100,180,30)
	username.placeholder = "First name"
	scrollView:insert(username)



	local LastName = native.newTextField(160,140,180,30)
	LastName.placeholder = "last name"
	scrollView:insert(LastName)


	
	local pw = native.newTextField(160,180,180,30)
	pw.placeholder = "password"
	pw.isSecure=true
	scrollView:insert(pw)
	
	--local gender = native.newTextField(160,180,180,30)
	--gender.placeholder = "gender"
	--sceneGroup:insert(gender)
	
	local gender = display.newText("gender:", display.contentCenterX*0.6, 212.8, "Bahnschrift SemiCondensed", 20)
	scrollView:insert(gender)
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local female = widget.newSwitch(
		{
			left = 150,
			top = 230,
			style = "radio",
			id = "female",
			initialSwitchState = true,
			onPress = onSwitchPress
		
		}	
	)
	on1=female.id
	radioGroup:insert( female )
	scrollView:insert(radioGroup)
	
	
	local Text = display.newText( "Female             Male", display.contentCenterX*1.0, 244, native.systemFont, 18 )
	scrollView:insert(Text)
 
 
	local male = widget.newSwitch(
		{
			left = 250,
			top = 230,
			style = "radio",
			id = "male",
			onPress = onSwitchPress
			
			
		}
	)
	--sceneGroup:insert(male)
	radioGroup:insert( male )



    local rGroup2=display.newGroup()
    scrollView:insert(rGroup2)

	local couple = display.newText("couple?", display.contentCenterX*0.6, 275.2, "Bahnschrift SemiCondensed", 20)
	scrollView:insert(couple)

	local Text = display.newText( "Yes             No", display.contentCenterX*1.0, 306.4, native.systemFont, 18 )
	scrollView:insert(Text)

	local yes = widget.newSwitch(
		{
			left = 150,
			top = 292.4,
			style = "radio",
			id = "yes",
			onPress = onSwitchPress
			
			
		}
	)
	on2=yes.id
	rGroup2:insert(yes)

	local no = widget.newSwitch(
		{
			left = 250,
			top = 292.4,
			style = "radio",
			id = "no",
			onPress = onSwitchPress
			
			
		}
	)

	rGroup2:insert(no)

	local age = display.newText("age:", display.contentCenterX*0.53, 347.2, "Bahnschrift SemiCondensed", 20)
	age.placeholder = "age"
	scrollView:insert(age)
	
	local rGroup = display.newGroup()
	
	local under18 = widget.newSwitch(
		{
			left = 205,
			top = 332.2,
			style = "radio",
			id = "under 18",
			initialSwitchState = true,
			onPress = onSwitchPress
		
		}
	)
	on3=under18.id
	rGroup:insert( under18 )
	scrollView:insert(rGroup)
	
	local u18 = display.newText( " < 18", display.contentCenterX*1.0, 348.88, native.systemFont, 18 )
	scrollView:insert(u18)
	
	local bet18to30 = widget.newSwitch(
		{
			left = 205,
			top = 367.2,
			style = "radio",
			id = "18-30",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( bet18to30 )
	
	
	local bet18to30 = display.newText( " 18-30 ", display.contentCenterX*1.0, 383.2, native.systemFont, 18 )
	scrollView:insert(bet18to30)
	
	local bet30to50 = widget.newSwitch(
		{
			left = 205,
			top = 402.2,
			style = "radio",
			id = "30-50",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( bet30to50 )
	
	
	local bet30to50 = display.newText( " 30-50 ", display.contentCenterX*1.0, 417.52, native.systemFont, 18 )
	scrollView:insert(bet30to50)
	
	
	local over50 = widget.newSwitch(
		{
			left = 205,
			top = 437.2,
			style = "radio",
			id = "over 50",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( over50 )
	
	
	local over50 = display.newText( " 50 + ", display.contentCenterX*1.0, 451.84, native.systemFont, 18 )
	scrollView:insert(over50)
	
    local email = native.newTextField(160,497.2,180,30)
	email.placeholder = "email"
	scrollView:insert(email)
	
	
	local postcode = native.newTextField(160,537.2,180,30)
	postcode.placeholder = "postcode"
	scrollView:insert(postcode)



local function onSwitchPress2(event)
    local switch=event.target
	on2=switch.id
    end	

local function home ()	
	composer.gotoScene("home",{effect = "slideLeft", time = 500})
end


    local function ques ()	
    	print(email.text)
		if username.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif pw.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif email.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif postcode.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	else
		print(on1)
		print(on2)
		print(on3)
	local customParams={Email=email.text,
    	                    FirstName=username.text,
    	                    LastName=LastName.text,
    	                    password=pw.text,
    	                    Gender=on1,
    	                    Couple=on2,
    	                    AgeRange=on3,
    	                    PostCode=postcode.text,
    	                    address=ipAddress}
    	composer.gotoScene("InQue",{effect = "slideLeft", time = 500, params=customParams})
    end
end
	
	
	local SignUp = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 567.2,
        id = "SignUp",
        label = "SignUp",
        onEvent = userSignUp,
        fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={  0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } }
    }
)
SignUp:addEventListener("tap", ques) 
scrollView:insert(SignUp)



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
