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
	    local displayEmail = display.newText(email,display.contentCenterX,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 24)
	    displayEmail:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	    sceneGroup:insert(displayEmail)
	    local displayName=display.newText(firstname,display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 30)
	    displayName:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	    sceneGroup:insert(displayName)




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
