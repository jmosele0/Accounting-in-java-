----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")




local function menu ()	
	composer.gotoScene("dogList",{effect = "slideRight", time = 500})
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
 
--adding border 

    print("create")
    local sceneGroup = self.view
    params=event.params
    OwnerID=params.OwnerID
	ipAddress=params.address
	
	

	bgr=display.newRect(display.contentCenterX,display.contentCenterY*1.0,display.contentWidth,display.contentHeight*1.0)
	bgr:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte-dv0E",22)
	
	sceneGroup:insert(Welcome)

	
	 m = display.newImage("back.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 50,
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
	
	local rect = display.newRect( 165, 320, 210, 150 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	scrollView:insert(rect)

	--Writing Message "About"
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	sceneGroup:insert(msg)

	name = native.newTextField(160,100,180,30)
	name.placeholder = "Name"
	scrollView:insert(name)
	
	age = native.newTextField(160,140,180,30)
	age.placeholder = "Age"
	scrollView:insert(age)
	
	breed = native.newTextField(160,180,180,30)
	breed.placeholder = "Breed"
	scrollView:insert(breed)
	
	sex = native.newTextField(160,220,180,30)
	sex.placeholder = "Sex"
	scrollView:insert(sex)
	
	local Text = display.newText( "* Desexed?", display.contentCenterX*0.7, display.contentCenterY*1.09, native.systemFont, 18 )
	scrollView:insert(Text)
	
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
	scrollView:insert(radioGroup)
	
	local y = display.newText( "Yes", display.contentCenterX*0.55, display.contentCenterY*1.25, native.systemFont, 18 )
	scrollView:insert(y)
 
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
	scrollView:insert(n)
	
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
	scrollView:insert(p)
	
	DOB = native.newTextField(160,420,180,30)
	DOB.placeholder = "yyyy/mm/dd"
	scrollView:insert(DOB)
	
	dn = native.newTextField(160,460,180,30)
	dn.placeholder = "How long have you had"
	scrollView:insert(dn)
	
	
    local function valid ()	
    	print(name.text)
		if name.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif age.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif breed.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif sex.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif DOB.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	elseif dn.text == "" then
    native.showAlert( "Corona", "one of the field is empty", { "OK" } )
    print("Textbox is empty")
	else 
	local customParams={DogName=name.text,
	    Age=age.text,
	    Breed=breed.text,
	    Sex=sex.text,
	    Desexed=on,
	    DOB=DOB.text,
	    HowLongOwned=dn.text,
	    ownerID=OwnerID,
	    address=ipAddress
	    }
	    composer.gotoScene("dogProfile2",{effect = "slideLeft", time = 500, params=customParams})
 
end
	
end	
	
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
scrollView:insert(nxt)
nxt:addEventListener("tap", valid )

end
 
 
-- show()
function scene:show( event )
	print("show")
 
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


