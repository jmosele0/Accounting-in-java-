-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )

local json=require("json")

--local myGroup=display.newGroup()
--myGroup.x=0
--myGroup.y=0
 
local function menu()
	composer.removeScene("Message")
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end

local message
local ipAddress
local scrollView
local y=20
local function networkListener(event)
	if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif (event.response=='-1')then
	     print ("error sending message")
	else   
	     print(event.response) 
	     customParams={message=message.text}
	     composer.gotoScene("Message",{params=customParams})
	end    
end   

local function send()

	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="sender="..email.."&message="..message.text
	local params = {}
    params.headers = headers
    params.body = body
	network.request(ipAddress.."send_message.php", "POST", networkListener, params)
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
    display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight+20)
	bgr:setFillColor(1,1,1)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte-dv0E",22)
	sceneGroup:insert(Welcome)
	
	

	
	m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	
	message = native.newTextField(110,490,200,30)
	message.placeholder = "Send Message"
	sceneGroup:insert(message)
	
	
	
	local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 220,
        top = 476,
        id = "Send",
        label = "Send",
		width='90',
		height='27',
        onPress = send,
       fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={1,1,1}, over={ 2, 5, 1.5, 2.2 } },

    }
)

     sceneGroup:insert(Submit)
    print(display.contentWidth)

    local params=event.params
    ipAddress=params.address
    scrollView=widget.newScrollView(
		{
			x = 0,
			y = 20,
			width = display.contentWidth,
			height = 450,
			topPadding = 100,
			bottomPadding = 100,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
			backgroundColor = {1,1,1 }
		}
	)
	scrollView.anchorX=0
	scrollView.anchorY=0
	--scrollView:insert(myGroup)
	sceneGroup:insert(scrollView)


    local function networkListener2(event)
    		if ( event.isError ) then
                 print( "Network error: ", event.response )
            elseif (event.response=='-1')then
	             print ("error sending message")
	        else 
	             print(event.response)  
	             local messages=json.decode(event.response)
	             local length=#messages
	             local x
	             local i
	             local height
	             local options = {
                       text = message,
                       x = 40,
                       y = y,
                       width = 200,
                       --height = 200,
                       fontSize = 18,
                       align="left"
                       }
	             for i=1, #messages, 1 do
	             	local message=messages[i]["message"]
	             	options.text=message
	             	if (messages[i]["sender"]=="admin") then
	             		print("admin")
	             	options.x=40	
	             	options.align="left"	
                    local text=display.newText(options)
                    text:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
                    text.anchorX=0
                    text.anchorY=0
                    height=text.contentHeight
                    local width=text.contentWidth
                    print(height)
                    print(width)
                    scrollView:insert(text)
                    else
                    	print("user")
                    options.x=200
                    if (#message<26) then
                    	options.align="right"
                    else	
                        options.align="left"
                    end
                    local text=display.newText(options)
                    text:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
                    text.anchorX=0.5
                    text.anchorY=0
                    scrollView:insert(text)
                    height=text.contentHeight	
                    end
                 y=y+30+height
                 print(y)
                 options.y=options.y+30+height
                 end
            scrollView:scrollTo("bottom", {time=1}) 
            print(y)    
            end
    end                  

                 

    local function loadMessages()

	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"	
	local body="sender="..email
	local params = {}
    params.headers = headers
    params.body = body
	network.request(ipAddress.."select_messages.php", "POST", networkListener2, params)
end


    loadMessages()
	--adding background
	

	
end


 
-- show()
function scene:show( event )
	print("show")
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
    	local params=event.params
    	if (params.message) then
    		local message=params.message
    		print(y)
    		local options = {
               text = message,
               x = 180,
               y = y,
               width = 200,
               height = 300,
               fontSize = 18,
               align = "left"
            }

            if (#message<26) then
                options.align="right"
            else	
                options.align="left"
            end

            local textBox=display.newText( options )
            textBox.anchorX=0.5
            textBox.anchorY=0
            textBox:setFillColor(1,1,1)
            scrollView:insert(textBox)
            y=y+30
        end    

        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
	local scrollView = self.view
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
	local scrollView = self.view
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


