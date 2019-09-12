----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")

local function back ()	
	composer.gotoScene("Profile",{effect = "slideLeft", time = 500})
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
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Forte", 30)
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
			backgroundColor = {0.26666666666, 0.44705882352 ,0.76862745098 },
		}
	)
	
	local name = native.newTextField(160,100,180,30)
	name.placeholder = "Name"
	scrollView:insert(name)
	
	local age = native.newTextField(160,140,180,30)
	age.placeholder = "Age"
	scrollView:insert(age)
	
	local breed = native.newTextField(160,180,180,30)
	breed.placeholder = "Breed"
	scrollView:insert(breed)
	
	local sex = native.newTextField(160,220,180,30)
	sex.placeholder = "Sex"
	scrollView:insert(sex)
	
	local Text = display.newText( "Desexed?", display.contentCenterX*0.7, display.contentCenterY*1.09, native.systemFont, 18 )
	scrollView:insert(Text)
	
	local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local yes = widget.newSwitch(
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
	scrollView:insert(yes)
	
	local y = display.newText( "Yes", display.contentCenterX*0.55, display.contentCenterY*1.25, native.systemFont, 18 )
	scrollView:insert(y)
 
	local no = widget.newSwitch(
		{
			left = 230,
			top = 320,
			style = "radio",
			id = "no",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( no )
	scrollView:insert(no)
	
	local n = display.newText( "No", display.contentCenterX*0.55, display.contentCenterY*1.38, native.systemFont, 18 )
	scrollView:insert(n)
	
	local plan = widget.newSwitch(
		{
			left = 230,
			top = 360,
			style = "radio",
			id = "plan",
			onPress = onSwitchPress
			
			
		}
	)
	radioGroup:insert( plan )
	scrollView:insert(plan)
	
	
	local p = display.newText( "Planning to when \n old enough", display.contentCenterX*0.92, display.contentCenterY*1.55, native.systemFont, 18 )
	scrollView:insert(p)
	
	local DOB = native.newTextField(160,420,180,30)
	DOB.placeholder = "Date of birth"
	scrollView:insert(DOB)
	
	local dn = native.newTextField(160,460,180,30)
	dn.placeholder = "How long have you had"
	scrollView:insert(dn)
	
	local rGroup = display.newGroup()
	
	local vc = display.newText( "  Vaccination Status ", display.contentCenterX*0.9, display.contentCenterY*2.1, native.systemFont, 18 )
	scrollView:insert(vc)
	
	local Unvaccinated = widget.newSwitch(
		{
			left = 262,
			top = 520,
			style = "radio",
			id = "basic",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( Unvaccinated )
	scrollView:insert(Unvaccinated)
	
	local Ua = display.newText( "Unvaccinated", display.contentCenterX*0.7, display.contentCenterY*2.25, native.systemFont, 18 )
	scrollView:insert(Ua)
	
	local over = widget.newSwitch(
		{
			left = 262,
			top = 560,
			style = "radio",
			id = "over",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( over )
	scrollView:insert(over)
	
	local ov = display.newText( "Overdue for vaccination", display.contentCenterX*0.95, display.contentCenterY*2.4, native.systemFont, 18 )
	scrollView:insert(ov)
	
	local unsure = widget.newSwitch(
		{
			left = 262,
			top = 600,
			style = "radio",
			id = "unsure",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( unsure )
	scrollView:insert(unsure)
	
	local uh = display.newText( "Unsure of history", display.contentCenterX*0.8, display.contentCenterY*2.55, native.systemFont, 18 )
	scrollView:insert(uh)
	
	local going = widget.newSwitch(
		{
			left = 262,
			top = 645,
			style = "radio",
			id = "going",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( going)
	scrollView:insert(going)
	
	local gp = display.newText( "Going through puppy\n vaccinations", display.contentCenterX*0.9, display.contentCenterY*2.75, native.systemFont, 18 )
	scrollView:insert(gp)
	
	local upto = widget.newSwitch(
		{
			left = 262,
			top = 690,
			style = "radio",
			id = "upto",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( upto )
	scrollView:insert(upto)
	
	local uv = display.newText( "Up to date with\n vaccinations", display.contentCenterX*0.75, display.contentCenterY*3.0, native.systemFont, 18 )
	scrollView:insert(uv)
	
	local rg = display.newGroup()
	
	local  cf = display.newText( "  Where did I come from? ", display.contentCenterX*0.9, display.contentCenterY*3.2, native.systemFont, 18 )
	scrollView:insert(cf)
	
	local rb = display.newText( "Registered breeder", display.contentCenterX*0.8, display.contentCenterY*3.35, native.systemFont, 18 )
	scrollView:insert(rb)
	
	local pd = display.newText( "Pound", display.contentCenterX*0.49, display.contentCenterY*3.5, native.systemFont, 18 )
	scrollView:insert(pd)
	
	local bl = display.newText( "Backyard litter", display.contentCenterX*0.69, display.contentCenterY*3.65, native.systemFont, 18 )
	scrollView:insert(bl)
	
	local frd = display.newText( "Friend ", display.contentCenterX*0.5, display.contentCenterY*3.8, native.systemFont, 18 )
	scrollView:insert(frd)
	
	local fm = display.newText( "Family matter", display.contentCenterX*0.68, display.contentCenterY*3.95, native.systemFont, 18 )
	scrollView:insert(fm)
	
	local ra = display.newText( "Rescue association", display.contentCenterX*0.82, display.contentCenterY*4.1, native.systemFont, 18 )
	scrollView:insert(ra)
	
	local fd = display.newText( "Found dog", display.contentCenterX*0.62, display.contentCenterY*4.25, native.systemFont, 18 )
	scrollView:insert(fd)
	
	local ff = display.newText( "Foster fail", display.contentCenterX*0.61, display.contentCenterY*4.4, native.systemFont, 18 )
	scrollView:insert(ff)

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
	        composer.removeScene("dogProfile")
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


