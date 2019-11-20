local composer = require( "composer" )
 
local scene = composer.newScene()

local widget=require("widget")

local selected

local ipAddress

local ownerID
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local on

 local function networkListener2(event)
             print("response"..event.response)
             if ( event.isError ) then
               print( "Network error: ", event.response )
          elseif (event.response=='-1') then
               print ("error inserting experience")
          elseif (event.response=='1') then
               print("you made it")
               composer.removeScene("experience_list")
               composer.removeScene("Tracker2")
               exp:removeSelf()
               expName:removeSelf()
               local customParams={address=ipAddress,
                                   ownerID=ownerID}
               composer.gotoScene("experience_list", {effect = "slideLeft", time = 500, params=customParams})                    
          end
   end   

local function insertExperience()
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"    
    local body="ExperienceName="..expName.text.."&ExperienceNotes="..exp.text.."&DogID="..selected.."&CatDesc="..on
    local params = {}
    params.headers = headers
    params.body = body
    print("here 2")
    print(ipAddress)
    network.request( ipAddress.."experience_insert.php", "POST", networkListener2, params)
    end

 local function onSwitchPress( event )
    local switch = event.target
    on=switch.id
    end

local function help()
 composer.gotoScene("category",{effect = "slideLeft", time = 500})
end 

local function back ()  
    composer.gotoScene("Tracker",{effect = "slideRight", time = 500})
end

 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    local radioGroup=display.newGroup()
    local params=event.params
    selected=params.dogname
    ipAddress=params.address
    ownerID=params.ownerID
    display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
    
    bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
    bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
    sceneGroup:insert(bg)
    
    Help = display.newText("Need help?",display.contentCenterX*1.60,46, "Bahnschrift SemiCondensed", 20)
    Help:setFillColor( 1,1,1 )
    sceneGroup:insert(Help)
    Help:addEventListener("tap", help)
        
        local rect = display.newRect( 165, 351, 275, 220 )
    rect:setFillColor(0.4117647059, 0.6823529412, 0.9294117647 ) 
    rect:setStrokeColor(1,1,1 )
    rect.strokeWidth = 2
    sceneGroup:insert(rect)
    
    --Adding Welcome Message
    Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
    sceneGroup:insert(Welcome)
    --Writing Message "About"
    
     
 
    
    --Adding Welcome Message

    local expNameText = display.newText("Experience name",110, 91, "Bahnschrift SemiCondensed", 20)
    expNameText:setFillColor( 1,1,1 )
    sceneGroup:insert(expNameText)

    expName = native.newTextField(164,121,275,30)
    expName.placeholder = "Experience name"
    sceneGroup:insert(expName)
    
    

    local expNotes = display.newText("Experience description",110, 156, "Bahnschrift SemiCondensed", 20)
    expNotes:setFillColor( 1,1,1 )
    sceneGroup:insert(expNotes)

    exp = native.newTextField(164,186,275,30)
    exp.placeholder = "Experience"
    sceneGroup:insert(exp)

      local happy = widget.newSwitch(
        {
            left = 40,
            top = 246,
            style = "radio",
            id = "Happy and relaxed",
            initialSwitchState = false,
            onPress = onSwitchPress,
        
        }
    )
     radioGroup:insert(happy)

     on=happy.id

    local happyText = display.newText("Happy",120, 261, "Bahnschrift SemiCondensed", 20)
    happyText:setFillColor( 1,1,1 )
    sceneGroup:insert(happyText)
    
    
    local startedNervous = widget.newSwitch(
        {
            left = 40,
            top = 286,
            style = "radio",
            id = "Started off nervous, but became more comfortable",
            onPress = onSwitchPress,
        
        }
    )
     radioGroup:insert(startedNervous)

     local startedNervousText = display.newText("Started off nervous",172, 301, "Bahnschrift SemiCondensed", 20)
    startedNervousText:setFillColor( 1,1,1)
    sceneGroup:insert(startedNervousText)
    
    
    
    local mildlyNervous = widget.newSwitch(
        {
            left = 40,
            top = 326,
            style = "radio",
            id = "Mildly nervous",
            onPress = onSwitchPress,
        
        }
    )
     radioGroup:insert(mildlyNervous)

     local mildlyNervousText = display.newText("Mildly nervous",154.5, 351, "Bahnschrift SemiCondensed", 20)
     mildlyNervousText:setFillColor( 1,1,1 )
     sceneGroup:insert(mildlyNervousText)

    local moderatelyAnxious = widget.newSwitch(
        {
            left = 40,
            top = 366,
            style = "radio",
            id = "Moderatelt nervous",
            onPress = onSwitchPress,
        
        }
    )
     radioGroup:insert(moderatelyAnxious)

      local moderatelyAnxiousText = display.newText("Moderately anxious",172, 381, "Bahnschrift SemiCondensed", 20)
     moderatelyAnxiousText:setFillColor( 1,1,1 )
     sceneGroup:insert(moderatelyAnxiousText)

     local extremelyAnxious = widget.newSwitch(
        {
            left = 40,
            top = 406,
            style = "radio",
            id = "Extremely nervous",
            onPress = onSwitchPress,
        
        }
    )
     radioGroup:insert(extremelyAnxious)

     local extremelyAnxiousText = display.newText("Extremely anxious",172, 421, "Bahnschrift SemiCondensed", 20)
     extremelyAnxiousText:setFillColor( 1,1,1 )
     sceneGroup:insert(extremelyAnxiousText)

     backImage = display.newImage("back.png", 30, -7 )
    --myImage:translate(140,450)
    sceneGroup:insert(backImage)
    backImage:addEventListener("tap", back)
     

     local Submit = widget.newButton(
    {
       shape = "roundedRect",
        left = 120,
        top = 470,
        id = "Submit",
        label = "Submit",
        width='98',
        height='30',
        onPress = insertExperience,
       fillColor = { default={1,1,1}, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={0.4117647059, 0.6823529412, 0.9294117647 }, over={ 2, 5, 1.5, 2.2 } },

    }
)

     sceneGroup:insert(Submit)
     sceneGroup:insert(radioGroup)
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