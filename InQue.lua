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
       fillColor = { default={ 0, 1, 4, 0.7 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(Skip)
Skip:addEventListener("tap", skip )

	
	--Adding Message
	msg = display.newText("Common Questions",display.contentCenterX*0.90,display.contentCenterY*0.05, "Forte", 30)
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
			onPress = onSwitchPress,
		
		}
	)
	radioGroup:insert( no )
	scrollView:insert(no)
	
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
	scrollView:insert(yes)
	
	local yes = display.newText( "Yes", display.contentCenterX*1.0, display.contentCenterY*0.55, native.systemFont, 18 )
	scrollView:insert(yes)
	
	local t = display.newText( "If Yes then ?", display.contentCenterX*0.9, display.contentCenterY*0.7, native.systemFont, 18 )
	scrollView:insert(t)
	
	local rg = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local dogs = widget.newSwitch(
		{
			left = 135,
			top = 180,
			style = "radio",
			id = "dogs",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rg:insert( dogs )
	scrollView:insert(dogs)
	
	local dogs = display.newText( "Dogs", display.contentCenterX*0.6, display.contentCenterY*0.8, native.systemFont, 18 )
	scrollView:insert(dogs)
 
	local cats = widget.newSwitch(
		{
			left = 135,
			top = 215,
			style = "radio",
			id = "cats",
			onPress = onSwitchPress
			
			
		}
	)
	rg:insert( cats )
	scrollView:insert(cats)
	
	local cats = display.newText( "Cats", display.contentCenterX*0.6, display.contentCenterY*0.95, native.systemFont, 18 )
	scrollView:insert(cats)
	
	local other = native.newTextField(160,270,180,30)
	other.placeholder = "Other"
	scrollView:insert(other)
	
	local info = display.newText( "What is an obedient dog to you ?", display.contentCenterX*1.0, display.contentCenterY*1.3, native.systemFont, 18 )
	scrollView:insert(info)
	
	local rGroup = display.newGroup()
	
	local basic = widget.newSwitch(
		{
			left = 262,
			top = 330,
			style = "radio",
			id = "basic",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( basic )
	scrollView:insert(basic)
	
	local b = display.newText( "- Knows basic commands", display.contentCenterX*0.9, display.contentCenterY*1.45, native.systemFont, 18 )
	scrollView:insert(b)
	
	local listens = widget.newSwitch(
		{
			left = 262,
			top = 370,
			style = "radio",
			id = "listens",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( listens )
	scrollView:insert(listens)
	
	local l = display.newText( "- Listens to my commands \n  and follows them ", display.contentCenterX*0.9, display.contentCenterY*1.6, native.systemFont, 18 )
	scrollView:insert(l)
	
	local jump = widget.newSwitch(
		{
			left = 262,
			top = 410,
			style = "radio",
			id = "jump",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( jump )
	scrollView:insert(jump)
	
	local j = display.newText( "- Does not jump up \n on people ", display.contentCenterX*0.75, display.contentCenterY*1.79, native.systemFont, 18 )
	scrollView:insert(j)
	
	local submissive = widget.newSwitch(
		{
			left = 262,
			top = 450,
			style = "radio",
			id = "submissive",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( submissive )
	scrollView:insert(submissive)
	
	local s = display.newText( "- Submissive", display.contentCenterX*0.55, display.contentCenterY*1.95, native.systemFont, 18 )
	scrollView:insert(s)
	
	
    local imp = display.newText( "Important outcomes of dog training ?", display.contentCenterX*1.0, display.contentCenterY*2.1, native.systemFont, 18 )
	scrollView:insert(imp)
	
	local rGroup = display.newGroup()
	
	local basic = widget.newSwitch(
		{
			left = 262,
			top = 330,
			style = "radio",
			id = "basic",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( basic )
	scrollView:insert(basic)
	
	local b = display.newText( "- Knows basic commands", display.contentCenterX*0.9, display.contentCenterY*1.45, native.systemFont, 18 )
	scrollView:insert(b)
	
	local listens = widget.newSwitch(
		{
			left = 262,
			top = 370,
			style = "radio",
			id = "listens",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( listens )
	scrollView:insert(listens)
	
	local l = display.newText( "- Listens to my commands \n  and follows them ", display.contentCenterX*0.9, display.contentCenterY*1.6, native.systemFont, 18 )
	scrollView:insert(l)
	
	local jump = widget.newSwitch(
		{
			left = 262,
			top = 410,
			style = "radio",
			id = "jump",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( jump )
	scrollView:insert(jump)
	
	local j = display.newText( "- Does not jump up \n on people ", display.contentCenterX*0.75, display.contentCenterY*1.79, native.systemFont, 18 )
	scrollView:insert(j)
	
	local submissive = widget.newSwitch(
		{
			left = 262,
			top = 450,
			style = "radio",
			id = "submissive",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( submissive )
	scrollView:insert(submissive)
	
	local s = display.newText( "- Submissive", display.contentCenterX*0.55, display.contentCenterY*1.95, native.systemFont, 18 )
	scrollView:insert(s)

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


