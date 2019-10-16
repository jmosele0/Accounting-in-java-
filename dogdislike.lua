----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")

local function submit()
 composer.gotoScene("",{effect = "slideLeft", time = 500})
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
	
	local txt = display.newText( "* What do your dog Dislike?", display.contentCenterX*1.0, display.contentCenterY*0.1, native.systemFont, 18 )
	scrollView:insert(txt)
	
	local Gp = display.newGroup()
	
	local fadults = widget.newSwitch(
		{
			left = 262,
			top = 45,
			style = "checkbox",
			id = "fadults",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert( fadults )
	scrollView:insert(fadults)
	
	local fa = display.newText( "Familiar Adults ", display.contentCenterX*0.78, display.contentCenterY*0.27, native.systemFont, 18 )
	scrollView:insert(fa)
	
   local fchildren = widget.newSwitch(
		{
			left = 262,
			top = 85,
			style = "checkbox",
			id = "fchildren",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert( fchildren )
	scrollView:insert(fchildren)
	
	local fc = display.newText( "Familiar Children", display.contentCenterX*0.8, display.contentCenterY*0.43, native.systemFont, 18 )
	scrollView:insert(fc)
	
	  local uadults = widget.newSwitch(
		{
			left = 262,
			top = 125,
			style = "checkbox",
			id = "uadults",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert( uadults )
	scrollView:insert(uadults)
	
	local ua = display.newText( "Unfamiliar Adults", display.contentCenterX*0.79, display.contentCenterY*0.59, native.systemFont, 18 )
	scrollView:insert(ua)
	
	local uchildren = widget.newSwitch(
		{
			left = 262,
			top = 165,
			style = "checkbox",
			id = "uchildren",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert( uchildren )
	scrollView:insert(uchildren)
	
	local uc = display.newText( "Unfamiliar Children", display.contentCenterX*0.84, display.contentCenterY*0.75, native.systemFont, 18 )
	scrollView:insert(uc)
	
		local fdog = widget.newSwitch(
		{
			left = 262,
			top = 205,
			style = "checkbox",
			id = "fdog",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert( fdog)
	scrollView:insert(fdog)
	
	local fd = display.newText( "Familiar Dogs", display.contentCenterX*0.74, display.contentCenterY*0.92, native.systemFont, 18 )
	scrollView:insert(fd)
	
	local udog = widget.newSwitch(
		{
			left = 262,
			top = 245,
			style = "checkbox",
			id = "udog",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert(udog)
	scrollView:insert(udog)
	
	local ud = display.newText( "Unfamiliar Dogs", display.contentCenterX*0.78, display.contentCenterY*1.08, native.systemFont, 18 )
	scrollView:insert(ud)
	
	local oanimals = widget.newSwitch(
		{
			left = 262,
			top = 285,
			style = "checkbox",
			id = "otheranimals",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert( oanimals)
	scrollView:insert(oanimals)
	
	local oa = display.newText( "Other Animals", display.contentCenterX*0.76, display.contentCenterY*1.25, native.systemFont, 18 )
	scrollView:insert(oa)
	
	local news = widget.newSwitch(
		{
			left = 262,
			top = 325,
			style = "checkbox",
			id = "news",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert(news)
	scrollView:insert(news)
	
	local ns = display.newText( "New Situattions", display.contentCenterX*0.79, display.contentCenterY*1.42, native.systemFont, 18 )
	scrollView:insert(ns)
	
	local swimming = widget.newSwitch(
		{
			left = 262,
			top = 365,
			style = "checkbox",
			id = "swimming",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert(swimming)
	scrollView:insert(swimming)
	
	local smg = display.newText( "Swimming", display.contentCenterX*0.68, display.contentCenterY*1.58, native.systemFont, 18 )
	scrollView:insert(smg)
	
		local toys = widget.newSwitch(
		{
			left = 262,
			top = 405,
			style = "checkbox",
			id = "toys",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert(toys)
	scrollView:insert(toys)
	
	local ty = display.newText( "Playing with toys", display.contentCenterX*0.82, display.contentCenterY*1.75, native.systemFont, 18 )
	scrollView:insert(ty)
	
	local fetch = widget.newSwitch(
		{
			left = 262,
			top = 445,
			style = "checkbox",
			id = "fetch",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert(fetch)
	scrollView:insert(fetch)
	
	local ftc = display.newText( "Fetch", display.contentCenterX*0.54, display.contentCenterY*1.93, native.systemFont, 18 )
	scrollView:insert(ftc)
	
	local food = widget.newSwitch(
		{
			left = 262,
			top = 485,
			style = "checkbox",
			id = "food",
			onPress = onSwitchPress,
		
		}
	)
	Gp:insert(food)
	scrollView:insert(food)
	
	local fod = display.newText( "Food", display.contentCenterX*0.55, display.contentCenterY*2.1, native.systemFont, 18 )
	scrollView:insert(fod)
	
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 550,
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


