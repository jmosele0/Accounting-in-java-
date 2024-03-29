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



 -- ScrollView listener
local function scrollListener( event )
 
    local phase = event.phase
    local direction = event.direction
	
	-- If the scrollview has reached it's scroll limit.
	if event.limitReached then
		if "up"== direction then
			print("Reached Top Limit")
		elseif "down" == direction then
			print("Reached Bottom Limit")
		end
	end
	
	return true
end
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local bg
-- create()
function scene:create( event )
        local sceneGroup = self.view
	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(255,255,255)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(255,155,255)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte-dv0E",22)
	sceneGroup:insert(Welcome)
	--Writing Message "About"
	

	 m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 30,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 50,
			bottomPadding = 70,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)


	
local function networkListener(event)
	if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=='-1')then
	     print ("error adding details")
	else    
	     local index
         local fields={"CanineTitle", "CanineContent"}
         local index2
         local height
         local fieldLength=#fields
         print(event.response)
         local enrichment=json.decode(event.response)
         print(enrichment)
         local length=#enrichment 
         local y=20
         for index=1, length, 1 do
         	for index2=1, fieldLength, 1 do
         		local value=enrichment[index][fields[index2]]
         		local text = display.newText(value,display.contentCenterX,y,270,0,"Arial", 15)
         		text.anchorY=0
         		text:setTextColor(0)
         		scrollView:insert(text)
         		height=text.contentHeight
         		y=y+30+height
         	end
         	y=y+40
         end
     end 
 end   
	


local function loadCanine()
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local params = {}
    params.headers = headers
	network.request(ipAddress.."canineenrichment.php", "POST", networkListener, params)
end



loadCanine()			

 
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