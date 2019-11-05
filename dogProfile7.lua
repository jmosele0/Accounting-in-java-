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
	local customParams={dogID=DogID, parentSiblingSighted=ParentSiblingSighted, personalityConcerns=PersonalityConcerns, firstMet=FirstMet,
	address=ipAddress, ownerID=OwnerID}
 composer.gotoScene("dogProfile8",{effect = "slideLeft", time = 500, params=customParams})
end


local function back ()	
	composer.gotoScene("dogProfile6",{effect = "slideRight", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    FirstMet=switch.id
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
    DogID=params.dogID
    ParentSiblingSighted=params.ParentSiblingSighted
    PersonalityConcerns=params.PersonalityConcerns
    ipAddress=params.address
    OwnerID=params.ownerID
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647  )
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)
	
--back button
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	
	local txt = display.newText( "* When you first met your pet:?", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	sceneGroup:insert(txt)
 
    local rGp = display.newGroup()
	
	local friendly = widget.newSwitch(
		{
			left = 262,
			top = 125,
			style = "radio",
			id = "friendly",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	FirstMet=friendly.id
	rGp:insert( friendly )
	sceneGroup:insert(friendly)
	
	local vf = display.newText( "Very Friendly", display.contentCenterX*0.7, display.contentCenterY*0.6, native.systemFont, 18 )
	sceneGroup:insert(vf)
	
	local standoffish = widget.newSwitch(
		{
			left = 262,
			top = 175,
			style = "radio",
			id = "standoffish",
			onPress = onSwitchPress,
		
		}
	)
	rGp:insert( standoffish )
	sceneGroup:insert(standoffish)
	
	local so = display.newText( "Little Stand-offish", display.contentCenterX*0.8, display.contentCenterY*0.8, native.systemFont, 18 )
	sceneGroup:insert(so)
	
	local visitors = widget.newSwitch(
		{
			left = 262,
			top = 225,
			style = "radio",
			id = "visitors",
			onPress = onSwitchPress,
		
		}
	)
	rGp:insert( visitors )
	sceneGroup:insert(visitors)
	
	local vs = display.newText( "Did not like visitors", display.contentCenterX*0.84, display.contentCenterY*1.0, native.systemFont, 18 )
	sceneGroup:insert(vs)
	
	local Others = native.newTextField(130,300,140,30)
	Others.placeholder = "Other"
	sceneGroup:insert(Others)
	
	
    local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 330,
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


