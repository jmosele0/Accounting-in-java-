----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 

local Welcome

local widget = require ("widget")


local function networkListener(event)
    if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=="-1") then
	    print ("error inserting details")
	else    
	    customParams={dogID=DogID,
	                  address=ipAddress,
	                  ownerID=OwnerID}
	    composer.gotoScene("doglike",{effect = "slideLeft", time = 500, params=customParams})

    end
end



local function Next()
	local adults=""
	local children=""
	local od=""
	local oa=""
	if (adultsOn==true) then
		adults=adultsText
	end
	if (childrenOn==true) then
		children=childrenText
	end
	if (odOn==true) then
		od=odText
	end
	if (oaOn==true) then
		oa=oaText
	end

	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="Adults="..adults.."&Children="..children.."&OtherDogs="..od.."&OtherAnimals="..oa.."&DogID="..DogID
	local params = {}
    params.headers = headers
    params.body = body
	network.request( ipAddress.."dogfamily.php", "POST", networkListener, params)

end


local function back ()	
	composer.gotoScene("dogProfile4",{effect = "slideRight", time = 500})
end

local function onSwitchPress( event )
    local switch = event.target
    if (switch.id=="adults") then
    	adultsOn=switch.isOn

    elseif(switch.id=="children") then
        childrenOn=switch.isOn

    elseif(switch.id=="od") then
        odOn=switch.isOn

    elseif(switch.id=="oa") then
        oaOn=switch.isOn

    end            	

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
	
	--add border
	local rect = display.newRect( 165, 220, 190, 200 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	sceneGroup:insert(rect)
	
	local txt = display.newText( "* Who else do I live with?", display.contentCenterX*1.0, display.contentCenterY*0.4, native.systemFont, 18 )
	sceneGroup:insert(txt)
	
	local radioG = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
    local adults = widget.newSwitch(
		{
			left = 200,
			top = 125,
			style = "checkbox",
			id = "adults",
			initialSwitchState=true,
			onPress = onSwitchPress
		
		}
	)
	adultsOn=true
	adultsText=adults.id
	radioG:insert( adults )
	sceneGroup:insert(adults)
	
	local adlt = display.newText( "Adults", display.contentCenterX*0.7, display.contentCenterY*0.6, native.systemFont, 18 )
	sceneGroup:insert(adlt)
 
	local children = widget.newSwitch(
		{
			left = 200,
			top = 175,
			style = "checkbox",
			id = "children",
			onPress = onSwitchPress
			
			
		}
	)
	childrenOn=false
	childrenText=children.id
	radioG:insert( children )
	sceneGroup:insert(children)
	
	local ch = display.newText( "Children", display.contentCenterX*0.75, display.contentCenterY*0.8, native.systemFont, 18 )
	sceneGroup:insert(ch)
	
	local od = widget.newSwitch(
		{
			left = 200,
			top = 225,
			style = "checkbox",
			id = "od",
			onPress = onSwitchPress
			
			
		}
	)
	odOn=false
	odText=od.id
	radioG:insert( od )
	sceneGroup:insert(od)
	
	
	local ods = display.newText( "Other Dogs", display.contentCenterX*0.83, display.contentCenterY*1.0, native.systemFont, 18 )
	sceneGroup:insert(ods)
	
		local oa = widget.newSwitch(
		{
			left = 200,
			top = 275,
			style = "checkbox",
			id = "oa",
			onPress = onSwitchPress
			
			
		}
	)
	oaOn=false
	oaText=oa.id
	radioG:insert( oa )
	sceneGroup:insert(oa)
	
	
	local oas = display.newText( "Other Animals", display.contentCenterX*0.86, display.contentCenterY*1.2, native.systemFont, 18 )
	sceneGroup:insert(oas)
	
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


