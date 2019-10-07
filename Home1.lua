-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------
--hi
local composer = require( "composer" )
local scene = composer.newScene()

local widget = require ("widget")

local function login()
 composer.gotoScene("Login",{effect = "slideLeft", time = 500})
end

 local function newscene()
 	print ("also here")
 composer.gotoScene("SignUp",{effect = "slideLeft", time = 500})
 end

local function answerq()
	print ("here")
	composer.gotoScene("InQue",{effect = "slideLeft", time = 500})
end	

local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
end

function scene:create( event )

	print(display.contentCenterX)
    
    local sceneGroup = self.view
--[[splashscreen = display.newImage( "homePage.png",display.contentHeight,display.contentWidth);
	splashscreen.x, splashscreen.y = display.contentWidth/2, display.contentHeight/2
 
local function removeSplash(event)
splashscreen:removeSelf()
splashscreen = nil
end 
timer.performWithDelay(2000,removeSplash)--]]
	
	
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
	--adding background
	
	--menu = display.newImage( "menu.png", display.contentCenterX*0.60, display.contentCenterY*1.0 )
	--sceneGroup:insert(menu)
	--menu:addEventListener("tap", menu)
	
local Login = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 280,
        id = "Login",
        label = "Login",
        --onEvent = userLogin,
        fillColor = { default={255,255,255  }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={ 0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } }
    }
)

sceneGroup:insert(Login)
Login:addEventListener("tap", login)

local SignUp = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 340,
        id = "SignUp",
        label = "SignUp",
        --onEvent = userSignIn,
        fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={  0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } }
    }
)
sceneGroup:insert(SignUp)
SignUp:addEventListener("tap", newscene)

local initQue = widget.newButton(
    {
        shape = "roundedRect",
        left = 70,
        top = 50,
        id = "Questions",
        label = "Answer questions",
        --onEvent = user,
        fillColor = { default={ 255,255,255 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={  0.26666666666, 0.44705882352, 0.76862745098}, over={ 2, 5, 1.5, 2.2 } }
    }
)

sceneGroup:insert(initQue)
initQue:addEventListener("tap", answerq)

end





function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
--test