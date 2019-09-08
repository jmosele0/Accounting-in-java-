-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
local widget = require( "widget" )
 

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
	local sceneGroup = self.view
	bg=display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight*1.20)
	bg:setFillColor( 0.26666666666, 0.44705882352, 0.76862745098 )
	sceneGroup:insert(bg)
	
	--title of the scene
	head = display.newText("Canine Enrichment", display.contentCenterX*0.90,display.contentCenterY*0.05,"Comic Sans MS",20)
	--head:setFillColor(1,0,0)
	sceneGroup:insert(head)
	
	
	-- Create the widget for scroll view
	local scrollView = widget.newScrollView(
		{
			top = 30,
			left = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			topPadding = 500,
			bottomPadding = 70,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
	)
	sceneGroup:insert(scrollView)
	
	local text = [[
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	CANINE ENRICHMENT:
	We all know we need to walk, run or play with our dogs, to help keep them physically fit and active. 
    But what about their brains? 
    Like us, dogs like to use their brains on a daily basis, usually to find food or toys! Enriching your dog’s environment may also stop them from performing unwanted, destructive behaviours. 
    Use the following tips and tricks to keep your dog’s brain active and focused. 


	GET RID OF FOOD BOWL!:
		■ Dogs are scavengers by nature, therefore they are built to work for their food
        ■ Using a food bowl does not enrich your dog. It does not have to think about how to get the food
		■ There are very simple ways of providing mental stimulation to your dog during meal times
		■ The action of licking and chewing are also  a calming behaviour
		■ Kong products are amazing commercial products to feed your dog from
		■ If your dog is new to working for their food, start simple, as you do not want them to get frustrated
		■ Beginners
			■ Smear some peanut butter or cream cheese inside your dog’s Kong
		■ Intermediates
            ■ Fill your dog’s Kong with biscuits and pack the end with wet food
        ■ Advanced
		    ■ Fill the whole toy with wet food
			■ Tightly pack a combination of wet and dry food
			■ Freeze your packed Kong
			
	MAKE YOUR DOG'S DINNER INTERESTING! 
        ■ Give them new foods to try in their Kong, like peanut butter, cream cheese, different types of meats, berries or different vegetables
	DRY FOOD TUMBLERS
        ■ Tumblers are a great way to give your dog their biscuits
        ■ Kong and Rogz have variations of tumblers
	DIY OPTIONS
		■ Place your dog’s food in a size appropriate cardboard box that they can shred up to get their food
        ■ You can also smear peanut butter or cream cheese inside the box to keep them interested
        ■ Place biscuits in muffin tins
        ■ Smear peanut butter, cream cheese or Kong filler onto their plastic toys

	USE THAT NOSE! 
        ■ Sniffing burns more calories than walking for dogs
        ■ It also provides excellent mental stimulation
        ■ For dogs that love to follow a scent, make a scent trail for then in the backyard
        ■ Use juice from a tuna, salmon or wet food can
        ■ Keep your dog inside, trace a scent trail around the yard 
        ■ Place small pieces of food along the trail to keep your dog invested
        ■ Let your dog outside and watch them work! 




---------------------------End-------------------------]]
local text = display.newText(text,0,10,270,0,"Helvetica", 14)
text:setTextColor(0)
text.x = display.contentCenterX
scrollView:insert(text)
 
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