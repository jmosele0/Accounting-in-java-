----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")

local function Next()
 composer.gotoScene("dogProfile7",{effect = "slideLeft", time = 500})
end


local function back ()	
	composer.gotoScene("dogProfile5",{effect = "slideLeft", time = 500})
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
	
	local txt = display.newText( "* Were the parents or siblings sighted?", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	sceneGroup:insert(txt)
	
	local rG = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local yes = widget.newSwitch(
		{
			left = 110,
			top = 125,
			style = "radio",
			id = "yes",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	rG:insert( yes )
	sceneGroup:insert(yes)
	
	local yn = display.newText( "Yes              No", display.contentCenterX*0.8, display.contentCenterY*0.58, native.systemFont, 18 )
	sceneGroup:insert(yn)
 
	local no = widget.newSwitch(
		{
			left = 200,
			top = 125,
			style = "radio",
			id = "no",
			onPress = onSwitchPress
			
			
		}
	)
	rG:insert( no )
	sceneGroup:insert(no)
	
	local cp = display.newText( "* If yes, did you have any concerns\n  about thier personalities?", display.contentCenterX*1.0, display.contentCenterY*0.8, native.systemFont, 18 )
	sceneGroup:insert(cp)
 
    local rp = display.newGroup()
	
	local Friendly = widget.newSwitch(
		{
			left = 262,
			top = 230,
			style = "radio",
			id = "Friendly",
			onPress = onSwitchPress,
		
		}
	)
	rp:insert( Friendly )
	sceneGroup:insert(Friendly)
	
	local VF = display.newText( "Very Friendly", display.contentCenterX*0.7, display.contentCenterY*1.03, native.systemFont, 18 )
	sceneGroup:insert(VF)
	
	local Standoffish = widget.newSwitch(
		{
			left = 262,
			top = 270,
			style = "radio",
			id = "Standoffish",
			onPress = onSwitchPress,
		
		}
	)
	rp:insert( Standoffish )
	sceneGroup:insert(Standoffish)
	
	local SO = display.newText( "Little Stand-offish", display.contentCenterX*0.8, display.contentCenterY*1.2, native.systemFont, 18 )
	sceneGroup:insert(SO)
	
	local Visitors = widget.newSwitch(
		{
			left = 262,
			top = 310,
			style = "radio",
			id = "Visitors",
			onPress = onSwitchPress,
		
		}
	)
	rp:insert( Visitors )
	sceneGroup:insert(Visitors)
	
	local VS = display.newText( "Did not like visitors", display.contentCenterX*0.84, display.contentCenterY*1.36, native.systemFont, 18 )
	sceneGroup:insert(VS)
	
	local Others = native.newTextField(130,370,140,30)
	Others.placeholder = "Other"
	sceneGroup:insert(Others)
	
	
    local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 400,
        id = "nxt",
        label = "Next",
		width='98',
		height='30',
        onEvent = userNext,
       fillColor = { default={ 255,255,255  }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(nxt)
nxt:addEventListener("tap", Next )
	

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


