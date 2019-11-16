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

    
	if (on2=="Other") then
		on2=Others.text
	end	
	local customParams={dogID=DogID, ParentSiblingSighted=on, PersonalityConcerns=on2, address=ipAddress, ownerID=OwnerID}
    composer.gotoScene("dogProfile7",{effect = "slideLeft", time = 500, params=customParams})              
	
	
end


local function back ()	
	composer.gotoScene("dogProfile5",{effect = "slideRight", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
end

local function onSwitchPress2( event )
    local switch = event.target
    on2=switch.id
    
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
			backgroundColor = {0.4117647059, 0.6823529412, 0.9294117647 },
		}
	)
	sceneGroup:insert(scrollView)
	--add border
	local r = display.newRect( 160, 140, 290, 40)
	r:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	r:setStrokeColor(255,255,255 )
	r.strokeWidth = 2
	scrollView:insert(r)
	
	--add border
	local rect = display.newRect( 160, 310, 290, 165)
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	scrollView:insert(rect)
	
	local txt = display.newText( "* Were the parents or siblings sighted?", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	scrollView:insert(txt)
	
	local rG = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local yes = widget.newSwitch(
		{
			left = 110,
			top = 125,
			style = "radio",
			id = "yes",
			initialSwitchState = true,
			onPress = onSwitchPress
		
		}
	)
	on=yes.id
	rG:insert( yes )
	scrollView:insert(rG)
	
	local yn = display.newText( "Yes              No", display.contentCenterX*0.8, display.contentCenterY*0.58, native.systemFont, 18 )
	scrollView:insert(yn)
 
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
	
	local cp = display.newText( "* If yes, did you have any concerns\n  about thier personalities?", display.contentCenterX*1.0, display.contentCenterY*0.8, native.systemFont, 18 )
	scrollView:insert(cp)
 
    local rp = display.newGroup()
	
	local Friendly = widget.newSwitch(
		{
			left = 262,
			top = 230,
			style = "radio",
			id = "Friendly",
			initialSwitchState = true,
			onPress = onSwitchPress2
		
		}
	)
    on2=Friendly.id
	rp:insert( Friendly )
	scrollView:insert(rp)
	
	local VF = display.newText( "Very Friendly", display.contentCenterX*0.7, display.contentCenterY*1.03, native.systemFont, 18 )
	scrollView:insert(VF)
	
	local Standoffish = widget.newSwitch(
		{
			left = 262,
			top = 270,
			style = "radio",
			id = "Standoffish",
			onPress = onSwitchPress2
		
		}
	)
	rp:insert( Standoffish )


	local SO = display.newText( "Little Stand-offish", display.contentCenterX*0.8, display.contentCenterY*1.2, native.systemFont, 18 )
	scrollView:insert(SO)
	
	local Visitors = widget.newSwitch(
		{
			left = 262,
			top = 310,
			style = "radio",
			id = "Visitors",
			onPress = onSwitchPress2
		
		}
	)
	rp:insert( Visitors )

	
	local VS = display.newText( "Did not like visitors", display.contentCenterX*0.84, display.contentCenterY*1.36, native.systemFont, 18 )
	scrollView:insert(VS)




	
	local Others = native.newTextField(133,370,150,30)
	Others.placeholder = "Other"
	scrollView:insert(Others)
	
	local Ots = widget.newSwitch(
		{
			left = 262,
			top = 350,
			style = "radio",
			id = "Others",
			onPress = onSwitchPress2
		
		}
	)
	rp:insert( Ots )
	scrollView:insert(Ots)
	
	
    local nxt = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 454,
        id = "nxt",
        label = "Next",
		width='98',
		height='30',
        onEvent = userNext,
       fillColor = { default={  255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647}, over={ 2, 5, 1.5, 2.2 } },

    }
)
scrollView:insert(nxt)
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


