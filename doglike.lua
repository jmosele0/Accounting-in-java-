----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require ("widget")




 
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
    local OwnerID=params.ownerID
    local ipAddress=params.address
    local DogID=params.dogID



	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647  )
	
	--Adding Message
	msg = display.newText("Dog Profile",display.contentCenterX,display.contentCenterY*0.20, "Forte", 30)
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
	
	--add border
	local rect = display.newRect( 162, 282, 280, 480 )
	rect:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 ) 
	rect:setStrokeColor(255,255,255 )
	rect.strokeWidth = 2
	scrollView:insert(rect)
	
	local txt = display.newText( "* What does your dog like?", display.contentCenterX*1.0, display.contentCenterY*0.1, native.systemFont, 18 )
	scrollView:insert(txt)
	
	local Gp = display.newGroup()
	
	local fadults = widget.newSwitch(
		{
			left = 262,
			top = 45,
			style = "checkbox",
			id = "fadults",
			initialSwitchState = true,
	
		
		}
	)
	local favar=fadults.id
	Gp:insert( fadults )
	scrollView:insert(Gp)
	
	local fa = display.newText( "Familiar Adults ", display.contentCenterX*0.78, display.contentCenterY*0.27, native.systemFont, 18 )
	Gp:insert(fa)
	
   local fchildren = widget.newSwitch(
		{
			left = 262,
			top = 85,
			style = "checkbox",
			id = "fchildren",

		
		}
	)
    local fcvar=fchildren.id
	Gp:insert( fchildren )
	
	local fc = display.newText( "Familiar Children", display.contentCenterX*0.8, display.contentCenterY*0.43, native.systemFont, 18 )
	Gp:insert(fc)
	
	  local uadults = widget.newSwitch(
		{
			left = 262,
			top = 125,
			style = "checkbox",
			id = "uadults",

		
		}
	)
	Gp:insert( uadults )
	
	local ua = display.newText( "Unfamiliar Adults", display.contentCenterX*0.79, display.contentCenterY*0.59, native.systemFont, 18 )
	Gp:insert(ua)
	
	local uchildren = widget.newSwitch(
		{
			left = 262,
			top = 165,
			style = "checkbox",
			id = "uchildren",
		
		}
	)
	local ucvar=uchildren.id
	Gp:insert( uchildren )

	
	local uc = display.newText( "Unfamiliar Children", display.contentCenterX*0.84, display.contentCenterY*0.75, native.systemFont, 18 )
	Gp:insert(uc)
	
		local fdog = widget.newSwitch(
		{
			left = 262,
			top = 205,
			style = "checkbox",
			id = "fdog",
		
		
		}
	)
	local fdvar=fdog.id	
	Gp:insert( fdog)
	
	
	local fd = display.newText( "Familiar Dogs", display.contentCenterX*0.74, display.contentCenterY*0.92, native.systemFont, 18 )
	Gp:insert(fd)
	
	local udog = widget.newSwitch(
		{
			left = 262,
			top = 245,
			style = "checkbox",
			id = "udog",

		
		}
	)
	local udvar=udog.id
	Gp:insert(udog)
	
	local ud = display.newText( "Unfamiliar Dogs", display.contentCenterX*0.78, display.contentCenterY*1.08, native.systemFont, 18 )
	Gp:insert(ud)
	
	local oanimals = widget.newSwitch(
		{
			left = 262,
			top = 285,
			style = "checkbox",
			id = "otheranimals",
	
		
		}
	)
	local oavar=oanimals.id
	Gp:insert( oanimals)
	
	local oa = display.newText( "Other Animals", display.contentCenterX*0.76, display.contentCenterY*1.25, native.systemFont, 18 )
	Gp:insert(oa)
	
	local news = widget.newSwitch(
		{
			left = 262,
			top = 325,
			style = "checkbox",
			id = "news",
		
		
		}
	)
	local newsvar=news.id
	Gp:insert(news)
	
	local ns = display.newText( "New Situattions", display.contentCenterX*0.79, display.contentCenterY*1.42, native.systemFont, 18 )
	Gp:insert(ns)
	
	local swimming = widget.newSwitch(
		{
			left = 262,
			top = 365,
			style = "checkbox",
			id = "swimming",
		
		
		}
	)
	local swimvar=swimming.id
	Gp:insert(swimming)
	
	local smg = display.newText( "Swimming", display.contentCenterX*0.68, display.contentCenterY*1.58, native.systemFont, 18 )
	Gp:insert(smg)
	
		local toys = widget.newSwitch(
		{
			left = 262,
			top = 405,
			style = "checkbox",
			id = "toys",
			
		
		}
	)
	local toysvar=toys.id	
	Gp:insert(toys)
	
	local ty = display.newText( "Playing with toys", display.contentCenterX*0.82, display.contentCenterY*1.75, native.systemFont, 18 )
	Gp:insert(ty)
	
	local fetch = widget.newSwitch(
		{
			left = 262,
			top = 445,
			style = "checkbox",
			id = "fetch",
		
		
		}
	)
	local fetchvar=fetch.id
	Gp:insert(fetch)
	
	local ftc = display.newText( "Fetch", display.contentCenterX*0.54, display.contentCenterY*1.93, native.systemFont, 18 )
	Gp:insert(ftc)
	
	local food = widget.newSwitch(
		{
			left = 262,
			top = 485,
			style = "checkbox",
			id = "food",
			
		
		}
	)
	local foodvar=food.id
	Gp:insert(food)
	
	local fod = display.newText( "Food", display.contentCenterX*0.55, display.contentCenterY*2.1, native.systemFont, 18 )
	Gp:insert(fod)
	
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 550,
        id = "Submit",
        label = "Submit",
		width='98',
		height='30',
        onEvent = userSubmit,
       fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.26666666666, 0.44705882352, 0.76862745098 }, over={ 2, 5, 1.5, 2.2 } },
    }
)


local function submit()

    local customParams={}
    customParams["OwnerID"]=OwnerID
    customParams["address"]=ipAddress
    customParams["dogID"]=DogID
    if (fadults.isOn) then
        customParams["Familiar adults"]=true
    end    
    if (fchildren.isOn) then
        customParams["Familiar children"]=true
    end    
    if (uadults.isOn) then
        customParams["Unfamiliar adults"]=true
    end    
    if (uchildren.isOn) then
        customParams["Unfamiliar children"]=true
    end
    if (fdog.isOn) then
        customParams["Familiar dogs"]=true
    end
    if (udog.isOn) then
        customParams["Unfamiliar dogs"]=true
    end
    if (oanimals.isOn) then
        customParams["Other animals"]=true
    end
    if (news.isOn) then
        customParams["New situations"]=true
    end
    if (swimming.isOn) then
        customParams["Swimming"]=true
    end
    if (toys.isOn) then
        customParams["Toys"]=true
    end
    if (fetch.isOn) then
        customParams["Fetch"]=true
    end
    if (food.isOn) then
        customParams["Food"]=true
    end                                    
    composer.gotoScene("dogdislike",{effect = "slideLeft", time = 500, params=customParams})
end
scrollView:insert(Submit)
Submit:addEventListener("tap", submit)
 

 
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


