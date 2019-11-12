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

local y

local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end


local function home()
 composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
end

local function help()
 composer.gotoScene("category",{effect = "slideLeft", time = 500})
end 

local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
end

local function listener1(obj)
	dogsDisplay=display.newGroup()
	local i
	local yy=85
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
	if (chev.status==0) then
		print("descend")
		transition.to(square, {time=100, y=y, height=height, onComplete=listener1})
		chev.status=1
	else
		print("ascend")
		print(chev.pos)
		transition.to(square, {time=100, y=50, height=25})
		dogsDisplay:removeSelf()
        if (chev.id) then
        	selected:removeSelf()
        	selected=display.newText(chev.label, display.contentCenterX, 50, "Bahnschrift SemiCondensed", 18)
        	selected:setFillColor(0,0,0)
        	selected.id=chev.id
        	selected.label=chev.label
        	selected:addEventListener("tap", transitions)
        	sceneGroup:insert(selected)
        	local temp=dogArray[1]
        	dogArray[1]=dogArray[chev.pos]
        	dogArray[chev.pos]=temp
        end
        chev.status=0
    end
end
--local function Onclick(avg)
      -- Print ("average")
--end

--local function poor()
      -- Print ("Poor")
--end

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    sceneGroup = self.view
    local radioGroup=display.newGroup()

<<<<<<< HEAD
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
               y=middle+37.5

          	   square=display.newRect( display.contentCenterX, 50, 150, 25 )
          	   square:setFillColor(1,1,1)
          	   local paint={0,0,0}
          	   square.strokeWidth=1
          	   square.stroke=paint
          	   sceneGroup:insert(square)
          	   print(dogs[1]["DogName"])
          	   selected=display.newText(dogs[1]["DogName"], display.contentCenterX, 50, "Bahnschrift SemiCondensed", 18)
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
               local chevron=display.newPolygon(97, 52, vertices)
               chevron:setFillColor(0,0,0)
               chevron:addEventListener("tap", transitions)
               chevron.status=0
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
	bg:setFillColor(255,255,255)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(255,155,255)
	sceneGroup:insert(bgr)
	
		
		local rect = display.newRect( 165, 300, 275, 220 )
	rect:setFillColor( 255,255,255 ) 
	rect:setStrokeColor(0.4117647059, 0.6823529412, 0.9294117647 )
	rect.strokeWidth = 2
	sceneGroup:insert(rect)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	
	 
 
	
	--Adding Welcome Message
	Welcome = display.newText("Experience:",display.contentCenterX*0.78,display.contentCenterY*0.40, "Bahnschrift SemiCondensed", 40)
	Welcome:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(Welcome)
	
	
	local exp = native.newTextField(164,150,275,30)
	exp.placeholder = "Experience"
	sceneGroup:insert(exp)
	
	
	
	--Adding Welcome Message
	Help = display.newText("Need help?",display.contentCenterX*1.60,display.contentCenterY*0.20, "Bahnschrift SemiCondensed", 20)
	Help:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(Help)
	Help:addEventListener("tap", help)
	
	 --menu button
    m = display.newImage("menu.png", 30, -19)
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )


	sceneGroup:insert(radioGroup)
	
    
	 
	
    local happy = widget.newSwitch(
		{
			left = 40,
			top = 210,
			style = "radio",
			id = "Happy",
			initialSwitchState = false,
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(happy)

	 on=happy.id

	local happyText = display.newText("Happy",120, 225, "Bahnschrift SemiCondensed", 20)
	happyText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(happyText)
	
	
	local startedNervous = widget.newSwitch(
		{
			left = 40,
			top = 250,
			style = "radio",
			id = "startedNervous",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(startedNervous)

	 local startedNervousText = display.newText("Started off nervous",172, 265, "Bahnschrift SemiCondensed", 20)
	startedNervousText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	sceneGroup:insert(startedNervousText)
	
	
	
	local mildlyNervous = widget.newSwitch(
		{
			left = 40,
			top = 290,
			style = "radio",
			id = "mildlyNervous",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(mildlyNervous)

	 local mildlyNervousText = display.newText("Mildly nervous",154.5, 305, "Bahnschrift SemiCondensed", 20)
	 mildlyNervousText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	 sceneGroup:insert(mildlyNervousText)

	local moderatelyAnxious = widget.newSwitch(
		{
			left = 40,
			top = 330,
			style = "radio",
			id = "moderatelyAnxious",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(moderatelyAnxious)

	  local moderatelyAnxiousText = display.newText("Moderately anxious",172, 345, "Bahnschrift SemiCondensed", 20)
	 moderatelyAnxiousText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	 sceneGroup:insert(moderatelyAnxiousText)

	 local extremelyAnxious = widget.newSwitch(
		{
			left = 40,
			top = 370,
			style = "radio",
			id = "extremelyAnxious",
			onPress = onSwitchPress,
		
		}
	)
	 radioGroup:insert(extremelyAnxious)

	 local extremelyAnxiousText = display.newText("Extremely anxious",172, 385, "Bahnschrift SemiCondensed", 20)
	 extremelyAnxiousText:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
	 sceneGroup:insert(extremelyAnxiousText)
     

     local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 460,
        id = "Submit",
        label = "Submit",
		width='98',
		height='30',
        onEvent = userSubmit,
       fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={255,255,255 }, over={ 2, 5, 1.5, 2.2 } },

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
