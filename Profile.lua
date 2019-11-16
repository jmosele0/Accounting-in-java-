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

    local email
    local firstname
    local gender
    local agerange
    local postcode


    local function networkListener(event)
    if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=="-1") then
	    print ("error inserting details")
	else    
		print(event.response)
	    details=json.decode(event.response)
	    email=details.Email
	    print (email)
	    firstname=details.FirstName
	    lastname=details.LastName
	    gender=details.Gender
	    agerange=details.AgeRange
	    postcode=details.PostCode
		local displaymail = display.newText('Email ',display.contentCenterX*0.45,display.contentCenterY*0.50, "Bahnschrift SemiCondensed", 17)
	    displaymail:setFillColor(255,255,255 )
	    sceneGroup:insert(displaymail)
	    local displayEmail = display.newText(email,display.contentCenterX*0.56,display.contentCenterY*0.65, "Bahnschrift SemiCondensed", 24)
	    displayEmail:setFillColor(255,255,255 )
		displayEmail.anchorX = 0.2
	    sceneGroup:insert(displayEmail)
		local displayame=display.newText('Full name ',display.contentCenterX*0.45,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 17)
	    displayame:setFillColor( 255,255,255 )
	    sceneGroup:insert(displayame)
		 local displayName=display.newText(firstname.." "..lastname,display.contentCenterX*0.55,display.contentCenterY*0.35, "Bahnschrift SemiCondensed", 24)
	    displayName:setFillColor( 255,255,255 )
		displayName.anchorX = 0.2
	    sceneGroup:insert(displayName)
		local displayender=display.newText('Gender ',display.contentCenterX*0.48,display.contentCenterY*0.80, "Bahnschrift SemiCondensed", 17)
	    displayender:setFillColor( 255,255,255 )
	    sceneGroup:insert(displayender)
	    local displayGender=display.newText(gender,display.contentCenterX*0.52,display.contentCenterY*0.95, "Bahnschrift SemiCondensed", 24)
	    displayGender:setFillColor(255,255,255 )
		displayGender.anchorX = 0.2
	    sceneGroup:insert(displayGender)
		local displayge=display.newText('AgeRange',display.contentCenterX*0.52,display.contentCenterY*1.10, "Bahnschrift SemiCondensed", 17)
	    displayge:setFillColor(255,255,255 )
	    sceneGroup:insert(displayge)
		local displayAge=display.newText(agerange,display.contentCenterX*0.47,display.contentCenterY*1.25, "Bahnschrift SemiCondensed", 24)
	    displayAge:setFillColor( 255,255,255)
		displayAge.anchorX = 0.1
	    sceneGroup:insert(displayAge)
		local displayode=display.newText('Postcode',display.contentCenterX*0.50,display.contentCenterY*1.40, "Bahnschrift SemiCondensed", 17)
	    displayode:setFillColor( 255,255,255 )
	    sceneGroup:insert(displayode)
		local displayCode=display.newText(postcode,display.contentCenterX*0.45,display.contentCenterY*1.55, "Bahnschrift SemiCondensed", 24)
	    displayCode:setFillColor( 255,255,255)
		displayCode.anchorX = 0.1
	    sceneGroup:insert(displayCode)

	


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

	
	
bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bgr)

	display.setDefault( "background",0.4117647059, 0.6823529412, 0.9294117647)
	
	
	local rect = display.newRect( 162, 210, 300, 390 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	sceneGroup:insert(rect)
	

	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )


 local function edit ()	
    	 local customParams={ownerID=OwnerID,
                        address=ipAddress,
                        email=email,
                        firstname=firstname,
                        lastname=lastname,
                        gender=gender,
                        agerange=agerange,
                        postcode=postcode}
    	composer.gotoScene("EditProfile",{effect = "slideLeft", time = 500, params=customParams})
    
end
	local EDITP = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 420,
        id = "edit",
        label = "Edit details",
        onEvent = userSignUp,
        fillColor = { default={255,255,255}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={0.4117647059, 0.6823529412, 0.9294117647 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
EDITP:addEventListener("tap", edit) 
sceneGroup:insert(EDITP)
	
	
	
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
