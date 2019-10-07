-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )
 


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local function Canine ()	
	composer.gotoScene("Canine",{effect = "slideLeft", time = 500})
end

 local function dog ()
    local customParams={ownerID=OwnerID}	
	composer.gotoScene("Profile",{effect = "slideLeft", time = 500, params=customParams})
end

 local function Tracr ()	
	composer.gotoScene("Tracker",{effect = "slideLeft", time = 500})
end
 

 local function logout ()	
	composer.gotoScene("Login",{effect = "slideLeft", time = 500})
end


 local function Training ()	
	composer.gotoScene("Training",{effect = "slideLeft", time = 500})
end
 
 local function home ()	
	composer.gotoScene("Slider",{effect = "slideLeft", time = 500})
end 

 local function hyperLink()
  system.openURL("https://www.youtube.com/channel/UCY_FKzvY-gmO-wOMmI9xAZg/featured?disable_polymer=1")
end
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    params=event.params
    OwnerID=params.OwnerID
    
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
	--Writing Message "About"

	 
	local Tracker = widget.newButton(
    {
       shape = "roundedRect",
        left = 60,
        top = 100,
        id = "Tracker",
        label = "Experience Tracker",
		width='200',
		height='35',
       fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={255,255,255 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
	sceneGroup:insert(Tracker)
	Tracker:addEventListener("tap", Tracr)
	
	local Can = widget.newButton(
    {
       shape = "roundedRect",
        left = 60,
        top = 150,
        id = "Can",
        label = "Canine Enrichment",
		width='200',
		height='35',
       fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 255,255,255 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
	sceneGroup:insert(Can)
	Can:addEventListener("tap", Canine )
	
		local dogP = widget.newButton(
    {
       shape = "roundedRect",
        left = 60,
        top = 200,
        id = "dogP",
        label = "Dogs",
		width='200',
		height='35',
       fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={255,255,255}, over={ 2, 5, 1.5, 2.2 } },
    }
)
	
	sceneGroup:insert(dogP)
	dogP:addEventListener("tap", dog)
	
		local logT = widget.newButton(
    {
       shape = "roundedRect",
        left = 60,
        top = 300,
        id = "logT",
        label = "Logout",
		width='200',
		height='35',
       fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647  }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 255,255,255 }, over={ 2, 5, 1.5, 2.2 } },
    }
)

	sceneGroup:insert(logT)
	logT:addEventListener("tap", logout)
	
		local T = widget.newButton(
    {
       shape = "roundedRect",
        left = 60,
        top = 250,
        id = "T",
        label = "YouTube Channel",
		width='200',
		height='35',
	    onEvent = userChannel,
        fillColor = { default={0.4117647059, 0.6823529412, 0.9294117647}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={255,255,255 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
	
	sceneGroup:insert(T)
	T:addEventListener("tap", hyperLink)
	
	
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
