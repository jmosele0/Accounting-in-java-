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


local on1
local on2
local on3
local on4

    local function networkListener(event)
    if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=="-1") then
	    print ("error inserting details")
	else    
		print(event.response)
	    local details=json.decode(event.response)
	    local email=details.Email
	    print (email)
	    local firstname=details.FirstName
	    local gender=details.Gender
	    local agerange=details.AgeRange
	    local postcode=details.PostCode
		local displaymail = display.newText('Email -',display.contentCenterX*0.38,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 30)
	    displaymail:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	    sceneGroup:insert(displaymail)
	    local displayEmail =  native.newTextField(200,100,120,30)
	    displayEmail.placeholder = email
	    sceneGroup:insert(displayEmail)
		local displayame=display.newText('Name -',display.contentCenterX*0.38,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	    displayame:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	    sceneGroup:insert(displayame)
		local displayName = native.newTextField(200,50,120,30)
		displayName.placeholder = firstname
	    sceneGroup:insert(displayName)
		local displayge=display.newText('AgeRange -',display.contentCenterX,display.contentCenterY*0.60, "Bahnschrift SemiCondensed", 30)
	    displayge:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	    sceneGroup:insert(displayge)
		local rGroup = display.newGroup()
	
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
	local on2=under18.id
	rGroup:insert( under18 )
	sceneGroup:insert(rGroup)
	
	local u18 = display.newText( " > 18", display.contentCenterX*1.0, display.contentCenterY*0.80, native.systemFont, 18 )
	u18:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(u18)
	
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
	bet18to30:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(bet18to30)
	
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
	bet30to50:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(bet30to50)
	
	
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
	over50:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(over50)
		local displayode=display.newText('Postcode -',display.contentCenterX*0.48,display.contentCenterY*1.45, "Bahnschrift SemiCondensed", 30)
	    displayode:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	    sceneGroup:insert(displayode)
		local displayCode = native.newTextField(210,350,140,30)
	    displayCode.placeholder= postcode
	    sceneGroup:insert(displayCode)
	
	local function onSwitchPress( event )
        local switch = event.target
        if(switch.id=="under 18" or switch.id=="bet18to30" or switch.id=="bet30to50" or switch.id=="over50") then
            on2=switch.id    
        end
    end

local function onSwitchPress2(event)
    local switch=event.target
	on2=switch.id
    end	




		
	 local function update ()	
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="Email="..displayEmail.text.."&FirstName="..displayName.text.."&AgeRange="..on2.."&OwnerID="..OwnerID.."&PostCode="..
	displayCode.text
	local params = {}
    params.headers = headers
    params.body = body
	network.request(ipAddress.."update.php", "POST", networkListener, params)
    	composer.gotoScene("Update",{effect = "slideLeft", time = 500, params=customParams})
    
end
	
	
	local upProfile = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 460,
        id = "update",
        label = "Update",
        onEvent = ProfileUpdate,
        fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={  0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } }
    }
)
upProfile:addEventListener("tap", update) 
sceneGroup:insert(upProfile)
		


end
end



local function loadData(Id)
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="OwnerID="..Id
	local params = {}
    params.headers = headers
    params.body = body
	network.request( ipAddress.."select_profile.php", "POST", networkListener, params)
end





    loadData(OwnerID)




    --print(name)

	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
	
	
bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(255,255,255)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(255,255,255)
	sceneGroup:insert(bgr)
	
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
