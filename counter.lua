-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local backarrow = composer.getVariable("backarrow")

function scene:create( event )
    local sceneGroup = self.view
    
    local background = display.newImageRect("img/truck.png", display.contentWidth, display.contentHeight)
    background.x, background.y = display.contentWidth/2, display.contentHeight/2

    local school = display.newImageRect("img/elementaryschool.png", display.contentWidth, display.contentHeight)
    school.x, school.y = display.contentWidth/2, display.contentHeight/2
    school.alpha = 0.7

    local arrow = display.newImageRect("img/arrow.png", 70, 70)
    arrow.x, arrow.y = display.contentWidth - 190, 50
    
    local function moveCook()
        composer.gotoScene("cook")
    end

    arrow:addEventListener("tap", moveCook)

    sceneGroup:insert(school)
    sceneGroup:insert(background)
    sceneGroup:insert(arrow)
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
