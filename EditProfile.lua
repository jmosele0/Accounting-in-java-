-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )
local json=require("json")
 
local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end


local function home ()	
	composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
end 




-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- local function Canine ()	
--	composer.gotoScene("Canine",{effect = "slideLeft", time = 500})
--end
 
-- create()
function scene:create( event )
	
    local sceneGroup = self.view
    local params=event.params
    local OwnerID=params.ownerID
    local ipAddress=params.address
    local email=params.email
    local firstname=params.firstname
    local gender=params.gender
    local agerange=params.agerange
    local postcode=params.postcode

local on1

local function onSwitchPress(event)
    local switch=event.target
	on1=switch.id
    end	



 display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
	
	

	
	--Adding Message
	msg = display.newText("Edit Profile",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	msg:setFillColor(255,255,255)
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
			backgroundColor = {0.4117647059, 0.6823529412, 0.9294117647 },
		}
	)
	sceneGroup:insert(scrollView)
	
  
		local displaymail = display.newText('Email -',display.contentCenterX*0.38,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 30)
	    displaymail:setFillColor( 255,255,255 )
	    scrollView:insert(displaymail)
	    local displayEmail =  native.newTextField(200,100,120,30)
	    displayEmail.text = email
	    scrollView:insert(displayEmail)
		local displayame=display.newText('Name -',display.contentCenterX*0.38,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	    displayame:setFillColor(255,255,255)
	    scrollView:insert(displayame)
		local displayName = native.newTextField(200,50,120,30)
		displayName.text = firstname
	    scrollView:insert(displayName)
		local displayge=display.newText('AgeRange -',display.contentCenterX,display.contentCenterY*0.60, "Bahnschrift SemiCondensed", 30)
	    displayge:setFillColor( 255,255,255)
	    scrollView:insert(displayge)
		local rGroup = display.newGroup()
		
		
	local rect = display.newRect( 165, 250, 220, 155 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	scrollView:insert(rect)
	
	local under18 = widget.newSwitch(
		{
			left = 205,
			top = 175,
			style = "radio",
			id = agerange,
			initialSwitchState = true,
			onPress = onSwitchPress
		
		}
	)
	on1=under18.id
	rGroup:insert( under18 )
	scrollView:insert(rGroup)
	
	local u18 = display.newText( " > 18", display.contentCenterX*1.0, display.contentCenterY*0.80, native.systemFont, 18 )
	u18:setFillColor( 255,255,255 )
	scrollView:insert(u18)
	
	local bet18to30 = widget.newSwitch(
		{
			left = 205,
			top = 210,
			style = "radio",
			id = "bet18to30",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( bet18to30 )
	
	
	local bet18to30 = display.newText( " 18-30 ", display.contentCenterX*1.0, display.contentCenterY*0.95, native.systemFont, 18 )
	bet18to30:setFillColor( 255,255,255)
	scrollView:insert(bet18to30)
	
	local bet30to50 = widget.newSwitch(
		{
			left = 205,
			top = 245,
			style = "radio",
			id = "bet30to50",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( bet30to50 )
	
	
	local bet30to50 = display.newText( " 30-50 ", display.contentCenterX*1.0, display.contentCenterY*1.10, native.systemFont, 18 )
	bet30to50:setFillColor(255,255,255 )
	scrollView:insert(bet30to50)
	
	
	local over50 = widget.newSwitch(
		{
			left = 205,
			top = 280,
			style = "radio",
			id = "over50",
			onPress = onSwitchPress
		
		}
	)
	rGroup:insert( over50 )
	
	
	local over50 = display.newText( " 50 + ", display.contentCenterX*1.0, display.contentCenterY*1.25, native.systemFont, 18 )
	over50:setFillColor( 255,255,255 )
	scrollView:insert(over50)
		local displayode=display.newText('Postcode -',display.contentCenterX*0.48,display.contentCenterY*1.45, "Bahnschrift SemiCondensed", 30)
	    displayode:setFillColor(255,255,255 )
	    scrollView:insert(displayode)
		local displayCode = native.newTextField(210,350,140,30)
	    displayCode.text= postcode
	    scrollView:insert(displayCode)
	

   

    local function networkListener(event)
    	 if ( event.isError ) then
              print( "Network error: ", event.response )
         elseif (event.response=="-1") then
	          print ("error inserting details")
	     else 
	     	  displayEmail:removeSelf()
	     	  displayEmail=nil
	     	  displayName:removeSelf()
	     	  displayName=nil
	     	  displayCode:removeSelf()
	     	  displayCode=nil
	     	  composer.removeScene("Profile")
	     	  local customParams={ownerID=OwnerID,
	     	                      address=ipAddress}
	          composer.gotoScene("Profile", {params=customParams}) 
	          composer.removeScene("EditProfile")  
	     end
	end          



		
	local function update ()	
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="Email="..displayEmail.text.."&FirstName="..displayName.text.."&AgeRange="..on1.."&OwnerID="..OwnerID.."&PostCode="..
	displayCode.text
	local params = {}
    params.headers = headers
    params.body = body
	network.request(ipAddress.."update.php", "POST", networkListener, params)
    	
    
end
	
	
	local upProfile = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 460,
        id = "update",
        label = "Update",
        onEvent = ProfileUpdate,
        fillColor = { default={255,255,255}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={0.4117647059, 0.6823529412, 0.9294117647 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
upProfile:addEventListener("tap", update) 
scrollView:insert(upProfile)
		




    --print(name)

	--adding background
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )



	
	
	
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
