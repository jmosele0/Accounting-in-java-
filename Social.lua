-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )
 
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

 local function dog ()	
	composer.gotoScene("dogProfile",{effect = "slideLeft", time = 500})
end
 

 local function hyperLink()
  system.openURL("https://www.facebook.com/devinelife.petservices/?modal=admin_todo_tour")
end

 local function hyperL()
  system.openURL("https://www.instagram.com/pawsitivebehaviour.app/")
end
  
  
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
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	
	y = display.newText("Follow us on Facebook ",170,80, "Forte",20)
	y:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(y)
	
	i = display.newText("Upload Your Dog Photos with\n #pawsitivebehavior in caption\n          on Instagram",170,280, "Forte",20)
	i:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(i)
	

	
	m = display.newImage("menu.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	
	
	local Channel = widget.newButton(
    {
       shape = "roundedRect",
        left = 25,
        top = 120,
        id = "Facebook ",
        label = "Facebook",
		width='270',
		height='30',
        onEvent = userChannel,
       fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={255,255,255 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(Channel)
Channel:addEventListener("tap", hyperLink)
	
		local insta = widget.newButton(
		{
		   shape = "roundedRect",
			left = 25,
			top = 330,
			id = "Instagram ",
			label = "Instagram",
			width='270',
			height='30',
			onEvent = userinsta,
		   fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647}, over={ 1, 0.5, 0.8, 4 } },
			labelColor = { default={255,255,255 }, over={ 2, 5, 1.5, 2.2 } },
		}
     )
sceneGroup:insert(insta)
insta:addEventListener("tap", hyperL)
	
end


 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
	local scrollView = self.view
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


