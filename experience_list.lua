----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")

local ipAddress

local ownerID

local json=require("json")

local function submit()
 composer.gotoScene("",{effect = "slideLeft", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

local function back ()	
	composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end 

local function addExperience()
	local customParams={ownerID=ownerID,
	                    address=ipAddress}
	composer.gotoScene("Tracker", {effect = "slideLeft", time = 500, params=customParams})
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
    ipAddress=params.address
    ownerID=params.ownerID

	display.setDefault( "background",0.4117647059, 0.6823529412, 0.9294117647 )

	bgr=display.newRect(display.contentCenterX,-0,display.contentWidth,80)
    bgr:setFillColor(255,255,255)
    bgr.anchorY=0
    
	
	--Adding Message
	msg = display.newText("Pawsitive behaviour:",display.contentCenterX,-20, "Forte-dv0E", 22)
	msg:setFillColor(1,1,1)
	sceneGroup:insert(msg)
	
	--back button
	backImage = display.newImage("menu.png", 30, -14 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)

	    local experience = widget.newButton(
    {
       shape = "roundedRect",
        left = 170,
        top = 30,
        id = "dogP",
        label = "add experience +",
        onPress=addExperience,
        width='135',
        height='35',
       fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={1,1,1}, over={ 2, 5, 1.5, 2.2 } },
    }
)
	   
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 0,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight+120,
			topPadding = 0,
			bottomPadding = 0,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
			backgroundColor = {1,1,1},
		}
	)
	sceneGroup:insert(scrollView)
    sceneGroup:insert(bgr)
    sceneGroup:insert(experience)

	local function addText(experiences)

	if (experiences==-1) then
		local text=display.newText("No experiences to show",display.contentCenterX,display.contentCenterY, "Bahnschrift SemiCondensed", 24)	
		scrollView:insert(text)

	else 
	    local i
	    local j
	    local k
	    local columns={"DogName", "ExperienceName", "ExperienceNotes", "CatDesc"}
	    local y=192
	    local exp=#experiences
	    for i=1, exp, 1 do
	    	local exp2=#experiences[i]
	    	for j=1, exp2, 1 do
	    		for k=1, #columns, 1 do
	    			local options = {
                       text = experiences[i][j][columns[k]],
                       x = 160,
                       y = y,
                       width = 200,
                       --height = 200,
                       fontSize = 18,
                       align="center"
                       }
	    		    local text=display.newText(options)
	    		    text.anchorX=0.5
	    		    text.anchorY=0  
	    		    text:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	    		    scrollView:insert(text)
	    		    y=y+text.contentHeight+24
	    		end
	    		y=y+48
	    	end	    
	    end
	end
end


    local function networkListener(event)
          if ( event.isError ) then
               print( "Network error: ", event.response )
          elseif (event.response==-1) then
               print ("error loading dogs")
               experiences=-1
          else
               print(event.response)
          	   local experiences=json.decode(event.response)
          	   addText(experiences)
          end
   end       	   


local function loadExperiences(Id, address)
	 local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"    
    local body="OwnerID="..Id
    local params = {}
    params.headers = headers
    params.body = body
    network.request( address.."load_experiences.php", "POST", networkListener, params)
end

loadExperiences(ownerID, ipAddress)




 
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


