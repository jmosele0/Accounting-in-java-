----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")

local json=require("json")


local function onSwitchPress( event )
    local switch = event.target
    if (switch.disabled==true and switch.isOn==false) then
	    switch:setState({isOn=true})
	    print(switch.isOn)
	end	
end


local function networkListener(event)
 if ( event.isError ) then
        print( "Network error: ", event.response )
    else
    	if (event.response=='-1') then
    		print("error inserting details")
	    else
	    	print("yes")
	        print(event.response) 	
	    end
    end
end

local function submit(event)
	local button=event.target
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local i
	local j=1
	local array={}
	for i=1, #button.dislike, 1 do
		if (button.dislike[i].isOn) then
			array[j]=button.dislike[i].id
			j=j+1
		end
	end
	i=1
	local str=button.like[1]
	if (#button.like>1) then
	    while (i<#button.like) do
		       str=str..","..button.like[i+1]
		       i=i+1
		end
	end	
	i=1
    local str2=array[1]
    if (#array>1) then
        while (i<#array) do
               str2=str2..","..array[i+1]
               i=i+1
        end
    end

	print(dislike)
	print (str2)	
	local body="doglikes="..str.."&dogdislikes="..str2.."&DogID="..button.dog
	local params = {}
    params.headers = headers
    params.body = body
	network.request( button.address.."doglike.php", "POST", networkListener, params)
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
    local OwnerID=params["OwnerID"]
    local ipAddress=params["address"]
    local DogID=params["dogID"]
    local textX={124.8, 128, 126.4, 134.4, 118.4, 124.8, 121.6, 126.4, 108.8, 84, 86.4, 88}
    local textY=64.8
    local radioX=262
    local radioY=45
    local things={"Familiar adults", "Familiar children", "Unfamiliar adults", "Unfamiliar children", "Familiar dogs", "Unfamiliar dogs",
    "Other animals", "New situations", "Swimming", "Toys", "Fetch", "Food"}

	
	display.setDefault( "background", 0.26666666666, 0.44705882352 ,0.76862745098  )
	
	--Adding Message
	local msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.1, "Forte", 30)
	sceneGroup:insert(msg)

	local txt = display.newText( "* What does your dog Dislike?", display.contentCenterX, display.contentCenterY*0.25, native.systemFont, 18 )
	sceneGroup:insert(txt)

	local radioGroup1=display.newGroup()
	local radioGroup2=display.newGroup()
	radioGroup2.alpha=0.4
	
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
			backgroundColor = {0.26666666666, 0.44705882352 ,0.76862745098 },
		}
	)


	scrollView:insert(radioGroup1)
	scrollView:insert(radioGroup2)

	local doglikes={}
	local dogthings={}
    local k=1
    local l=1

    local i
	for i=1, #things, 1 do
		local switches=widget.newSwitch(
		{
			left=radioX,
			top=radioY,
			style="checkbox",
			id=things[i],
			onPress=onSwitchPress,

		}
		)
		local text = display.newText( things[i], textX[i], textY, native.systemFont, 18 )
		if (params[things[i]]==true) then
			switches.disabled=true
			switches:setState({isOn=true})
			radioGroup2:insert(switches)
            radioGroup2:insert(text)
			doglikes[k]=things[i]
			k=k+1
		else
			radioGroup1:insert(switches)
			radioGroup1:insert(text)
			dogthings[l]=switches
			l=l+1
		end
		radioY=radioY+40
		textY=textY+38.4
	end	

	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 550,
        id = "Submit",
        label = "Submit",
		width='98',
		height='30',
        onPress = submit,
        fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.26666666666, 0.44705882352, 0.76862745098 }, over={ 2, 5, 1.5, 2.2 } },
    }
)

	Submit.like=doglikes
	Submit.dislike=dogthings
	Submit.address=ipAddress
	Submit.dog=DogID
    scrollView:insert(Submit)
    sceneGroup:insert(scrollView)
 
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


