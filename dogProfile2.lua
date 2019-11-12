----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local widget = require ("widget")


local function Next()
	customParams={dogName=DogName,
	 age=Age,
	 breed=Breed,
	 sex=Sex,
	 desexed=Desexed,
	 dob=DOB,
	 howlongowned=HowLongOwned,
	 VaccinationStatus=on,
	 ownerID=OwnerID,
	 address=ipAddress
	}
	composer.gotoScene("dogProfile3",{effect = "slideLeft", time = 500, params=customParams})

end


local function back ()	
	composer.gotoScene("dogProfile",{effect = "slideRight", time = 500})
end
 

local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
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
	DogName=params.DogName
	Age=params.Age
	Breed=params.Breed
	Sex=params.Sex
	Desexed=params.Desexed
	DOB=params.DOB
	HowLongOwned=params.HowLongOwned
	OwnerID=params.ownerID
	ipAddress=params.address



	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647  )
	
	--add border
	local rect = display.newRect( 162, 255, 275, 280 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	sceneGroup:insert(rect)
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)
	
	--back button
	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)
	

	
	local txt = display.newText( "* Vaccination Status ", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	sceneGroup:insert(txt)
	
	local rGroup = display.newGroup()
	
	local Unvaccinated = widget.newSwitch(
		{
			left = 262,
			top = 125,
			style = "radio",
			id = "Unvaccinated",
			initialSwitchState = true,
			onPress = onSwitchPress,
		
		}
	)
	on=Unvaccinated.id
	rGroup:insert( Unvaccinated )
	sceneGroup:insert(rGroup)
	
	local Ua = display.newText( "Unvaccinated", display.contentCenterX*0.7, display.contentCenterY*0.6, native.systemFont, 18 )
	sceneGroup:insert(Ua)
	
	local over = widget.newSwitch(
		{
			left = 262,
			top = 175,
			style = "radio",
			id = "over",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( over )
	
	
	local ov = display.newText( "Overdue for vaccination", display.contentCenterX*0.95, display.contentCenterY*0.8, native.systemFont, 18 )
	sceneGroup:insert(ov)
	
	
	local unsure = widget.newSwitch(
		{
			left = 262,
			top = 225,
			style = "radio",
			id = "unsure",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( unsure )
	
	
	local uh = display.newText( "Unsure of history", display.contentCenterX*0.8, display.contentCenterY*1.0, native.systemFont, 18 )
	sceneGroup:insert(uh)
	
	local going = widget.newSwitch(
		{
			left = 262,
			top = 275,
			style = "radio",
			id = "going",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( going)
	
	local gp = display.newText( "Going through puppy\n vaccinations", display.contentCenterX*0.9, display.contentCenterY*1.25, native.systemFont, 18 )
	sceneGroup:insert(gp)
	
	local upto = widget.newSwitch(
		{
			left = 262,
			top = 325,
			style = "radio",
			id = "upto",
			onPress = onSwitchPress,
		
		}
	)
	rGroup:insert( upto )
	
	local uv = display.newText( "Up to date with\n vaccinations", display.contentCenterX*0.75, display.contentCenterY*1.48, native.systemFont, 18 )
	sceneGroup:insert(uv)
	
	
    local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 420,
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


