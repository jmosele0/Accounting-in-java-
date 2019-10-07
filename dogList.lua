local composer = require( "composer" )

local widget=require("widget")

local json=require("json")
 
local scene = composer.newScene()


 local function menu()
 composer.gotoScene("Menu",{effect = "slideRight", time = 500})
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
    local OwnerID=params.ownerID
    local ipAddress=params.address



    local function networkListener(event)
          if ( event.isError ) then
               print( "Network error: ", event.response )
          elseif (event.response=="-1") then
               print ("error loading dogs")
          else
               local index
               local fields={"DogName", "Age", "Breed", "Sex", "Desexed", "DOB", "HowLongOwned", "VaccinationStatus", "DogOrigin"}
               local index2
               local fieldLength=#fields
               local y=0.2
               print(event.response)
               local dogs=json.decode(event.response)
               print(dogs)
               local length=#dogs 
               print(length)
               for index=1, length, 1 do
                for index2=1, fieldLength, 1 do
                local value=dogs[index][fields[index2]]
                  local displayValue = display.newText(value,display.contentCenterX,display.contentCenterY*y, "Bahnschrift SemiCondensed", 24)
                  displayValue:setFillColor( 0.4117647059, 0.6823529412, 0.9294117647 )
                  sceneGroup:insert(displayValue)
                  y=y+0.2
                end             
               end
          end
    end


    local function loadData(Id, address)
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"    
    local body="OwnerID="..Id
    local params = {}
    params.headers = headers
    params.body = body
    network.request( address.."select_dog.php", "POST", networkListener, params)
    end


    loadData(OwnerID, ipAddress)



    display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )
    
    
    bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
    bg:setFillColor(255,255,255)
    sceneGroup:insert(bg)
    
    bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
    bgr:setFillColor(255,255,255)
    sceneGroup:insert(bgr)
    
    --Adding Welcome Message
    Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
    sceneGroup:insert(Welcome)
    --Writing Message "About"
    
     m = display.newImage("menu.png", 30, -17 )
    sceneGroup:insert(m)
    m:addEventListener("tap", menu )
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
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