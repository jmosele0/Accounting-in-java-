----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")

local function Next()
 composer.gotoScene("dogProfile2",{effect = "slideLeft", time = 500})
end

local function menu ()	
	composer.gotoScene("Menu",{effect = "slideLeft", time = 500})
end


local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
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
	
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.26666666666, 0.44705882352, 0.76862745098)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(255,255,255)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	
	sceneGroup:insert(Welcome)
	
	 --menu button
    h = display.newImage("home.png", 300, -17 )
	sceneGroup:insert(h)
	h:addEventListener("tap", home )
	 
	
	 m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	--Writing Message "About"
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Forte", 30)
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
	
	local DOB = native.newTextField(160,420,180,30)
	DOB.placeholder = "Date of birth"
	sceneGroup:insert(DOB)
	
	local dn = native.newTextField(160,460,180,30)
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
       fillColor = { default={  0.26666666666, 0.44705882352, 0.76862745098 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 255,255,255}, over={ 2, 5, 1.5, 2.2 } },
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


