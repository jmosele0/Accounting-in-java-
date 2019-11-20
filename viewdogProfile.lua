-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )


local scene = composer.newScene()


local widget = require( "widget" )
local on1
local on2	
local DogID
local ipAddress
local OwnerID
 
local function menu()
 composer.removeScene("viewdogProfile")
 composer.gotoScene("dogList",{effect = "slideRight", time = 500})
end


local function onSwitchPress(event)
	local switch=event.target
	on1=switch.id
end

local function onSwitchPress2(event)
	local switch=event.target
	on2=switch.id
end	

local function networkListener(event)
 if ( event.isError ) then
        print( "Network error: ", event.response )
    else
    	if (event.response=='-1') then
    		print("error inserting details")
	    else
	        print(event.response) 	
	        customParams={
	                      address=ipAddress,
	                      ownerID=OwnerID
	                     }
	        composer.removeScene("dogList")             
	        composer.removeScene("viewdogProfile")             
	        composer.gotoScene("dogList",{effect = "slideRight", time = 500, params=customParams})
	    end
    end
end

local function editDetails()
	local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    headers["Accept-Language"] = "en-US"
    print(on1)
    print(on2)
    print(DogID)	
	local body="Desexed="..on1.."&VacinationStatus="..on2.."&DogID="..DogID
	local params = {}
    params.headers = headers
    params.body = body
	network.request( ipAddress.."update_dog.php", "POST", networkListener, params)

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
	--adding background
	display.setDefault( "background", 0.4117647059, 0.6823529412, 0.9294117647)
	
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight)
	bg:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bg)
	
	bgr=display.newRect(display.contentCenterX,display.contentCenterY*3.0,display.contentWidth,display.contentHeight)
	bgr:setFillColor(0.4117647059, 0.6823529412, 0.9294117647)
	sceneGroup:insert(bgr)
	
	--Adding Welcome Message
	Welcome = display.newText("Pawsitive Behaviour",170,-17, "Forte",22)
	sceneGroup:insert(Welcome)
	
	
    local edit=widget.newButton(
    {
       shape = "roundedRect",
        left = 220,
        top = 50,
        id = "dogP",
        label = "update",
        width='100',
        height='35',
        onPress=editDetails,
        fillColor = { default={ 0.4117647059, 0.6823529412, 0.9294117647 }, over={ 1, 0.5, 0.8, 4 } },
        labelColor = { default={1,1,1}, over={ 2, 5, 1.5, 2.2 } },
    }
)
    sceneGroup:insert(edit)
	
	m = display.newImage("back.png", 30, -17 )
	sceneGroup:insert(m)
	m:addEventListener("tap", menu )

	local params=event.params
	local name=params.DogName
	DogID=params.DogID
	ipAddress=params.address
	OwnerID=params.OwnerID
	print(name)
	print(params.Age)
	local dogName=display.newText(name, 160, 100, "Bahnschrift SemiCondensed", 21)
	sceneGroup:insert(dogName)
	local Age=display.newText("Age: "..params.Age, 160, 130, "Bahnschrift SemiCondensed", 21)
	sceneGroup:insert(Age)
	local Breed=display.newText("Breed: "..params.Breed, 160, 160, "Bahnschrift SemiCondensed", 21)
	sceneGroup:insert(Breed)
	local Sex=display.newText("Sex: "..params.Sex, 160, 190, "Bahnschrift SemiCondensed", 21)
	sceneGroup:insert(Sex)
	local DOB=display.newText("DOB: "..params.DOB, 160, 250, "Bahnschrift SemiCondensed", 21)
	sceneGroup:insert(DOB)
	local HowLongOwned=display.newText("Owned for: "..params.HowLongOwned, 160, 280, "Bahnschrift SemiCondensed", 21)
	sceneGroup:insert(HowLongOwned)
	local Desexed=display.newText("Desexed:  yes:          no:", 60, 325, "Bahnschrift SemiCondensed", 21)
	Desexed.anchorX=0
	sceneGroup:insert(Desexed)
	local radioGroup=display.newGroup()
	sceneGroup:insert(radioGroup)
	local yes=widget.newSwitch(
		{
			left = 180,
			top = 310,
			style = "radio",
			id = "yes",
			initialSwitchState=false,
			onPress=onSwitchPress
		}
	)
	radioGroup:insert(yes)

	local no=widget.newSwitch(
		{
			left = 255,
			top = 310,
			style = "radio",
			id = "no",
			initialSwitchState=false,
			onPress=onSwitchPress
		}
	)


	radioGroup:insert(no)
	if (params.Desexed=="no" or params.Desexed=="plan") then
		no:setState({isOn=true})
		on1=no.id
	else
	    yes:setState({isOn=true})
	    on1=no.id
	end    	

    local rGroup=display.newGroup()
    sceneGroup:insert(rGroup)
   
    local vaccinationStatus=display.newText("Vaccination status: ", 60, 380, "Bahnschrift SemiCondensed", 21)
    vaccinationStatus.anchorX=0
    sceneGroup:insert(vaccinationStatus)
    local Unvaccinated=widget.newSwitch(
		{
			left = 260,
			top = 400,
			style = "radio",
			id = "Unvaccinated",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
	)
    local unVactext=display.newText("Unvaccinated: ", 240, 415, "Bahnschrift SemiCondensed", 21)
    unVactext.anchorX=1
    sceneGroup:insert(unVactext)

	if (params.VacinationStatus=="Unvaccinated") then
		Unvaccinated:setState({isOn=true})
		on2=Unvaccinated.id
	end	
    rGroup:insert(Unvaccinated)
    
    local overdue=widget.newSwitch(
		{
			left = 260,
			top = 430,
			style = "radio",
			id = "over",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
	)

	local overdueText=display.newText("Overdue: ", 240, 445, "Bahnschrift SemiCondensed", 21)
    overdueText.anchorX=1
    sceneGroup:insert(overdueText)
	if (params.VacinationStatus=="over") then
	overdue:setState({isOn=true})
	on2=overdue.id
    end

	rGroup:insert(overdue)

	if (params.VacinationStatus=="unsure") then

		local unsure=widget.newSwitch(
		{
			left = 260,
			top = 460,
			style = "radio",
			id = "unsure",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
	)
		local unsureText=display.newText("Unsure of history: ", 240, 475, "Bahnschrift SemiCondensed", 21)
        unsureText.anchorX=1
        sceneGroup:insert(unsureText)

		if (params.VacinationStatus=="unsure") then
	    unsure:setState({isOn=true})
	    on2=unsure.id
        end
		rGroup:insert(unsure)

		local going=widget.newSwitch(
		{
			left = 260,
			top = 490,
			style = "radio",
			id = "going",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
	)

		local goingText=display.newText("Going through vaccinations: ", 240, 505, "Bahnschrift SemiCondensed", 21)
        goingText.anchorX=1
        sceneGroup:insert(goingText)

		if (params.VacinationStatus=="going") then
	    going:setState({isOn=true})
	    on2=going.id
        end
		rGroup:insert(going)

		local upto=widget.newSwitch(
		{
			left = 260,
			top = 520,
			style = "radio",
			id = "upto",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
	)
		local uptoText=display.newText("Up to date: ", 240, 535, "Bahnschrift SemiCondensed", 21)
        uptoText.anchorX=1
        sceneGroup:insert(uptoText)

		if (params.VacinationStatus=="upto") then
	    upto:setState({isOn=true})
	    on2=upto.id
        end
		rGroup:insert(upto)

	else
	    local going=widget.newSwitch(
		{
			left = 260,
			top = 460,
			style = "radio",
			id = "going",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
		
	)
	    local goingText=display.newText("Going through vaccinations: ", 240, 475, "Bahnschrift SemiCondensed", 21)
        goingText.anchorX=1
        sceneGroup:insert(goingText)

	    if (params.VacinationStatus=="going") then
	    going:setState({isOn=true})
	    on2=going.id
        end
	    rGroup:insert(going)

		local upto=widget.newSwitch(
		{
			left = 260,
			top = 490,
			style = "radio",
			id = "upto",
			initialSwitchState=false,
			onPress=onSwitchPress2
		}
	)
		local uptoText=display.newText("Up to date: ", 240, 505, "Bahnschrift SemiCondensed", 21)
        uptoText.anchorX=1
        sceneGroup:insert(uptoText)

		if (params.VacinationStatus=="upto") then
	    upto:setState({isOn=true})
	    on2=upto.id
        end
		rGroup:insert(upto)
	end	






	

	
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


