----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")

local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local function home ()	
	composer.gotoScene("home",{effect = "slideLeft", time = 500})
end




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
	display.setDefault( "background", 0.26666666666, 0.44705882352, 0.76862745098 )
	
	--Adding Welcome Message
	Welcome = display.newText("Welcome",display.contentCenterX,display.contentCenterY*0.20, "Comic Sans MS", 30)
	sceneGroup:insert(Welcome)
	
	local username = native.newTextField(160,100,180,30)
	username.placeholder = "Username"
	sceneGroup:insert(username)
	
	local pw = native.newTextField(160,140,180,30)
	pw.placeholder = "password"
	sceneGroup:insert(pw)
	
	--local gender = native.newTextField(160,180,180,30)
	--gender.placeholder = "gender"
	--sceneGroup:insert(gender)
	
	local gender = display.newText("gender:", display.contentCenterX*0.7, display.contentCenterY*0.72, "Comic Sans MS", 20)
	gender.placeholder = "gender"
	sceneGroup:insert(gender)
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local female = widget.newSwitch(
		{
			left = 150,
			top = 190,
			style = "radio",
			id = "female",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	radioGroup:insert( female )
	sceneGroup:insert(female)
	
	local Text = display.newText( "Female             Male", display.contentCenterX*1.0, display.contentCenterY*0.85, native.systemFont, 18 )
	sceneGroup:insert(Text)
 
 
	local male = widget.newSwitch(
		{
			left = 250,
			top = 190,
			style = "radio",
			id = "male",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( male )
	sceneGroup:insert(male)
	
	local age = display.newText("age:", display.contentCenterX*0.6, display.contentCenterY*1.0, "Comic Sans MS", 20)
	age.placeholder = "age"
	sceneGroup:insert(age)
	
	local rGroup = display.newGroup()
	
	local under18 = widget.newSwitch(
		{
			left = 205,
			top = 225,
			style = "radio",
			id = "under 18",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( under18 )
	sceneGroup:insert(under18)
	
	local u18 = display.newText( " > 18", display.contentCenterX*1.0, display.contentCenterY*1.007, native.systemFont, 18 )
	sceneGroup:insert(u18)
	
	local bet18to30 = widget.newSwitch(
		{
			left = 205,
			top = 260,
			style = "radio",
			id = "bet18to30",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( bet18to30 )
	sceneGroup:insert(bet18to30)
	
	local bet18to30 = display.newText( " 18-30 ", display.contentCenterX*1.0, display.contentCenterY*1.15, native.systemFont, 18 )
	sceneGroup:insert(bet18to30)
	
	local bet30to50 = widget.newSwitch(
		{
			left = 205,
			top = 295,
			style = "radio",
			id = "bet30to50",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( bet30to50 )
	sceneGroup:insert(bet30to50)
	
	local bet30to50 = display.newText( " 30-50 ", display.contentCenterX*1.0, display.contentCenterY*1.293, native.systemFont, 18 )
	sceneGroup:insert(bet30to50)
	
	local over50 = widget.newSwitch(
		{
			left = 205,
			top = 330,
			style = "radio",
			id = "over50",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( over50 )
	sceneGroup:insert(over50)
	
	local over50 = display.newText( " 50 + ", display.contentCenterX*1.0, display.contentCenterY*1.436, native.systemFont, 18 )
	sceneGroup:insert(over50)
	
    local email = native.newTextField(160,390,180,30)
	email.placeholder = "email"
	sceneGroup:insert(email)
	
	
	local postcode = native.newTextField(160,430,180,30)
	postcode.placeholder = "postcode"
	sceneGroup:insert(postcode)
	
	
	local SignUp = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 460,
        id = "SignUp",
        label = "SignUp",
        onEvent = userSignUp,
        fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={  0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } }
    }
)
sceneGroup:insert(SignUp)

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


