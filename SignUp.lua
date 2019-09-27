----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")

local function onSwitchPress1( event )
    local switch = event.target
    on1=switch.id
end

local function onSwitchPress2(event)
    local switch=event.target
	on2=switch.id
end	
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local function home ()	
	composer.gotoScene("home",{effect = "slideLeft", time = 500})
end


local function networkListener(event)
 if ( event.isError ) then
        print( "Network error: ", event.response )
 else
    if (event.response=='-1') then
    		print ('email has already been taken')
    else
    	print(event.response)
    	local customParams={OwnerID=event.response}
    	composer.gotoScene("InQue",{effect = "slideLeft", time = 500, params=customParams})
    end
end
end


local function ques ()	
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="Email="..email.text.."&FirstName="..username.text.."&password="..pw.text.."&Gender="..on1.."&AgeRange="..on2.."&PostCode="..postcode.text
	local params = {}
    params.headers = headers
    params.body = body
	network.request( "http://192.168.123.109:2431/pup/insert.php", "POST", networkListener, params)
	
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
	
	--Adding Welcome Message
	Welcome = display.newText("Welcome",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(Welcome)
	
	username = native.newTextField(160,100,180,30)
	username.placeholder = "Username"
	sceneGroup:insert(username)
	
	pw = native.newTextField(160,140,180,30)
	pw.placeholder = "password"
	sceneGroup:insert(pw)
	
	--local gender = native.newTextField(160,180,180,30)
	--gender.placeholder = "gender"
	--sceneGroup:insert(gender)
	
	local gender = display.newText("gender:", display.contentCenterX*0.6, display.contentCenterY*0.72, "Bahnschrift SemiCondensed", 20)
	gender.placeholder = "gender"
	sceneGroup:insert(gender)
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    female = widget.newSwitch(
		{
			left = 150,
			top = 190,
			style = "radio",
			id = "female",
			initialSwitchState = true,
			onPress = onSwitchPress1,
		
		}	
	)
	on1=female.id
	radioGroup:insert( female )
	sceneGroup:insert(radioGroup)
	
	
	local Text = display.newText( "Female             Male", display.contentCenterX*1.0, display.contentCenterY*0.85, native.systemFont, 18 )
	sceneGroup:insert(Text)
 
 
	male = widget.newSwitch(
		{
			left = 250,
			top = 190,
			style = "radio",
			id = "male",
			onPress = onSwitchPress1,
			
			
		}
	)
	--sceneGroup:insert(male)
	radioGroup:insert( male )
	
	
	local age = display.newText("age:", display.contentCenterX*0.53, display.contentCenterY*1.0, "Bahnschrift SemiCondensed", 20)
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
			onPress = onSwitchPress2,
		
		}
	)
	on2=under18.id
	rGroup:insert( under18 )
	sceneGroup:insert(rGroup)
	
	local u18 = display.newText( " > 18", display.contentCenterX*1.0, display.contentCenterY*1.007, native.systemFont, 18 )
	sceneGroup:insert(u18)
	
	local bet18to30 = widget.newSwitch(
		{
			left = 205,
			top = 260,
			style = "radio",
			id = "bet18to30",
			onPress = onSwitchPress2,
		
		}
	)
	rGroup:insert( bet18to30 )
	
	
	local bet18to30 = display.newText( " 18-30 ", display.contentCenterX*1.0, display.contentCenterY*1.15, native.systemFont, 18 )
	sceneGroup:insert(bet18to30)
	
	local bet30to50 = widget.newSwitch(
		{
			left = 205,
			top = 295,
			style = "radio",
			id = "bet30to50",
			onPress = onSwitchPress2,
		
		}
	)
	rGroup:insert( bet30to50 )
	
	
	local bet30to50 = display.newText( " 30-50 ", display.contentCenterX*1.0, display.contentCenterY*1.293, native.systemFont, 18 )
	sceneGroup:insert(bet30to50)
	
	
	local over50 = widget.newSwitch(
		{
			left = 205,
			top = 330,
			style = "radio",
			id = "over50",
			onPress = onSwitchPress2,
		
		}
	)
	rGroup:insert( over50 )
	
	
	local over50 = display.newText( " 50 + ", display.contentCenterX*1.0, display.contentCenterY*1.436, native.systemFont, 18 )
	sceneGroup:insert(over50)
	
    email = native.newTextField(160,390,180,30)
	email.placeholder = "email"
	sceneGroup:insert(email)
	
	
	postcode = native.newTextField(160,430,180,30)
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
SignUp:addEventListener("tap", ques) 
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


