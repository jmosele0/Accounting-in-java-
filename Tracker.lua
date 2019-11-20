-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 

local json=require("json") 
local scene = composer.newScene()
 


local widget = require ("widget")

local dogs
local ownerID
local ipAddress
local selected
local square 
local sceneGroup
local dogsDisplay
local height
local dogArray={}
local transitions
local status
local expName
local exp
local on

local y

local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end


local function nextScene()
	local customParams={dogname=selected.id,
	                    address=ipAddress,
	                    ownerID=ownerID}
 composer.gotoScene("Tracker2",{effect = "slideLeft", time = 500, params=customParams})
end

local function listener1(obj)
	dogsDisplay=display.newGroup()
	local i
	local yy=186
	local length=#dogArray
	for i=2, length, 1 do
		local dog=display.newText(dogArray[i], display.contentCenterX, yy, "Bahnschrift SemiCondensed", 18)
		dog:setFillColor(0,0,0)
		dog.id=dogs[i]["DogID"]
		dog.pos=i
		dog.label=dogArray[i]
		dog:addEventListener("tap", transitions)
		dogsDisplay:insert(dog)
		yy=yy+35
	end
	sceneGroup:insert(dogsDisplay)
end		




function transitions(event)
	local chev=event.target
	print("hi")	
	if (status==0) then
		status=1
		transition.to(square, {time=100, y=y, height=height, onComplete=listener1})
		
	else
		transition.to(square, {time=100, y=151, height=25})
		dogsDisplay:removeSelf()
        if (chev.id) then
        	selected:removeSelf()
        	selected=display.newText(chev.label, display.contentCenterX, 151, "Bahnschrift SemiCondensed", 18)
        	selected:setFillColor(0,0,0)
        	selected.id=chev.id
        	selected.label=chev.label
        	sceneGroup:insert(selected)
        	local temp=dogArray[1]
        	dogArray[1]=dogArray[chev.pos]
        	dogArray[chev.pos]=temp
        end
        status=0
    end
end

local function back ()	
	composer.gotoScene("experience_list",{effect = "slideRight", time = 500})
end



-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    sceneGroup = self.view

    local params=event.params
    ownerID=params.ownerID
    ipAddress=params.address
    print(ipAddress)
    print("here 1")


    local function networkListener(event)
    	      if ( event.isError ) then
               print( "Network error: ", event.response )
          elseif (event.response==-1) then
               print ("error loading dogs")
               experiences=-1
          else
               print(event.response)
          	   dogs=json.decode(event.response)
               local dogLength=#dogs
               height=(dogLength-1)*35+45
               local middle=height/2
               y=middle+138.5

          	   square=display.newRect( display.contentCenterX, 151, 150, 25 )
          	   square:setFillColor(1,1,1)
          	   local paint={0,0,0}
          	   square.strokeWidth=1
          	   square.stroke=paint
          	   sceneGroup:insert(square)
          	   print(dogs[1]["DogName"])
          	   selected=display.newText(dogs[1]["DogName"], display.contentCenterX, 151, "Bahnschrift SemiCondensed", 18)
          	   selected:setFillColor(0,0,0)
          	   selected.id=dogs[1]["DogID"]
          	   selected.pos=1
          	   selected.label=dogs[1]["DogName"]
          	   sceneGroup:insert(selected)
               local i
               for i=1, dogLength, 1 do
               	dogArray[i]=dogs[i]["DogName"]
               end	
          	   local vertices={-5, -5, 0, 5, 5, -5}
          	   local rect=display.newRect(97, 151, 10, 25)
          	   rect:addEventListener("tap", transitions)
          	   sceneGroup:insert(rect)
               local chevron=display.newPolygon(97, 153, vertices)
               chevron:setFillColor(0,0,0)
               --chevron:addEventListener("tap", transitions)
               status=0
               sceneGroup:insert(chevron)

          	   
          end
   end       	   




    local function loadDogs()
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"    
    local body="OwnerID="..ownerID
    local params = {}
    params.headers = headers
    params.body = body
    print("here 2")
    print(ipAddress)
    network.request( ipAddress.."select_dog.php", "POST", networkListener, params)
    end

    loadDogs()

	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)
	
	--[[bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(255,155,255)
	sceneGroup:insert(bgr)--]]
	
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 
    local selectDog = display.newText("Select a dog:",display.contentCenterX,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 24)
	selectDog:setFillColor( 1,1,1 )
	sceneGroup:insert(selectDog)
	
	--Adding Welcome Message
	Welcome = display.newText("Experience tracker:",display.contentCenterX,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 32)
	Welcome:setFillColor( 1,1,1 )
	sceneGroup:insert(Welcome)

	backImage = display.newImage("back.png", 30, -7 )
	--myImage:translate(140,450)
	sceneGroup:insert(backImage)
	backImage:addEventListener("tap", back)

	
	
	--Adding Welcome Message
	
	
	 --menu button
    local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 110,
        top = 460,
        id = "Submit",
        label = "Next",
        width='98',
        height='30',
        onPress = nextScene,
       fillColor = { default={1,1,1}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={0.4117647059, 0.6823529412, 0.9294117647 }, over={ 2, 5, 1.5, 2.2 } },

    }
)
    sceneGroup:insert(Submit)


	
    
	 
	
  

--average:addEventListener("tap", Onclick)

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
