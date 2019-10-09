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
    local x=0

    display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647 )


    local function dog()
      local customParams={OwnerID=OwnerID,
                          address=ipAddress}
      composer.gotoScene("dogProfile",{effect = "slideLeft", time = 500, params=customParams})
    end



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



    local scrollView = widget.newScrollView(
    {
      top = 0,
      left = 0,
      width = display.contentWidth,
      height = display.contentHeight,
      topPadding = 70,
      bottomPadding = 0,
      horizontalScrollDisabled = true,
      verticalScrollDisabled = false,
      listener = scrollListener,
      backgroundColor = {1, 1, 1 },
    }
  )

    sceneGroup:insert(scrollView)
    x=x+1
    print("scrollView x="..x)
    print("scrollView added")



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
                  scrollView:insert(displayValue)
                  print(scrollView.numChildren)
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

    local dogP = widget.newButton(
    {
       shape = "roundedRect",
        left = 200,
        top = 50,
        id = "dogP",
        label = "add dog +",
        width='100',
        height='35',
       fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={0,0,0}, over={ 2, 5, 1.5, 2.2 } },
    }
)

    sceneGroup:insert(dogP)
    x=x+1
    print("button x="..x)
    print("button added")
    dogP:addEventListener("tap", dog)
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