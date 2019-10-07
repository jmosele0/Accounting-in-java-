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
	    print ("error inserting dog details")
 else
 	    print(event.response)
	    customParams={ownerID=event.response}
	    composer.gotoScene("dogProfile2",{effect = "slideLeft", time = 500, params=customParams})
 end
end


local function Next()
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="DogName="..name.text.."&Age="..age.text.."&Breed="..breed.text.."&Sex="..sex.text.."&Desexed="..on.."&DOB="..DOB.text
	.."&HowLongOwned="..dn.text.."&OwnerID="..OwnerID
	local params = {}
    params.headers = headers
    params.body = body
	network.request( "http://192.168.123.109:2431/pup/dog_insert.php", "POST", networkListener, params)
 
end

local function menu ()	
	composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end


local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
end

 local function home ()	
	composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
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
    OwnerID=params.ownerID
	
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)

	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)

	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	
	sceneGroup:insert(Welcome)

	
	 m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )

	--Writing Message "About"
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)

	name = native.newTextField(160,100,180,30)
	name.placeholder = "Name"
	sceneGroup:insert(name)
	
	age = native.newTextField(160,140,180,30)
	age.placeholder = "Age"
	sceneGroup:insert(age)
	
	breed = native.newTextField(160,180,180,30)
	breed.placeholder = "Breed"
	sceneGroup:insert(breed)
	
	sex = native.newTextField(160,220,180,30)
	sex.placeholder = "Sex"
	sceneGroup:insert(sex)
	
	local Text = display.newText( "* Desexed?", display.contentCenterX*0.7, display.contentCenterY*1.09, native.systemFont, 18 )
	sceneGroup:insert(Text)
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    yes = widget.newSwitch(
		{
			left = 230,
			top = 280,
			style = "radio",
			id = "yes",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	radioGroup:insert( yes )
	on=yes.id
	sceneGroup:insert(radioGroup)
	
	local y = display.newText( "Yes", display.contentCenterX*0.55, display.contentCenterY*1.25, native.systemFont, 18 )
	sceneGroup:insert(y)
 
	no = widget.newSwitch(
		{
			left = 230,
			top = 320,
			style = "radio",
			id = "no",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( no )
	
	local n = display.newText( "No", display.contentCenterX*0.55, display.contentCenterY*1.38, native.systemFont, 18 )
	sceneGroup:insert(n)
	
	plan = widget.newSwitch(
		{
			left = 230,
			top = 360,
			style = "radio",
			id = "plan",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( plan )
	
	
	
	local p = display.newText( "Planning to when \n old enough", display.contentCenterX*0.92, display.contentCenterY*1.55, native.systemFont, 18 )
	sceneGroup:insert(p)
	
	DOB = native.newTextField(160,420,180,30)
	DOB.placeholder = "Date of birth"
	sceneGroup:insert(DOB)
	
	dn = native.newTextField(160,460,180,30)
	dn.placeholder = "How long have you had"
	sceneGroup:insert(dn)
	
	
	 local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 485,
        id = "nxt",
        label = "Next",
		width='98',
		height='30',
        onEvent = userNext,
       fillColor = { default={  255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647}, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(nxt)
nxt:addEventListener("tap", Next )

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
	local scrollView = self.view
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
	local scrollView = self.view
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
	local scrollView = self.view
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


