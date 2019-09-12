-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )
 
local function menu()
 composer.gotoScene("Menu",{effect = "slideLeft", time = 500})
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
  system.openURL("https://www.youtube.com/channel/UCY_FKzvY-gmO-wOMmI9xAZg/featured?disable_polymer=1")
end
  
-- create()
function scene:create( event )
	
    local sceneGroup = self.view
	--adding background
	display.setDefault( "background", 0.26666666666, 0.44705882352, 0.76862745098 )
	
	
	--Can = display.newText("Canin Enrichment",display.contentCenterX,display.contentCenterY*0.60, "Comic Sans MS", 30)
	--sceneGroup:insert(Can)
	--Can:addEventListener("tap", Canine )
	--Writing Message "About"
	
	 m = display.newImage("menu.png", 30, -7 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )
	
	
	
	local Channel = widget.newButton(
    {
       shape = "roundedRect",
        left = 50,
        top = 50,
        id = "Youtube ",
        label = "Follow us on Youtube Channel",
		width='250',
		height='30',
        onEvent = userChannel,
       fillColor = { default={ 0, 1, 4, 0.7 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 2, 4, 1.5 }, over={ 2, 5, 1.5, 2.2 } },
    }
)
sceneGroup:insert(Channel)
Channel:addEventListener("tap", hyperLink)
	
	
	
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
