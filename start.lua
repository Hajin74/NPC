-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")


-- 소리
opening= audio.loadStream("music/opening.mp3")
openingChannel = audio.play( opening, { channel=1, loops=0, fadein=2000 } )

function scene:create( event )
	local sceneGroup = self.view
	
	function startGame(evnet)
		composer.gotoScene("opening")
		print("오프닝으로")
	end

	local background = display.newImageRect( "image/Opening.jpg", display.contentWidth, display.contentHeight )
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    local startButton = display.newImageRect("image/button.png", 230, 100)
    startButton.x, startButton.y = display.contentWidth/2, display.contentHeight/2-50
    startButton:addEventListener("tap", startGame)

    sceneGroup:insert(background)
    sceneGroup:insert(startButton)
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
		composer.removeScene("opening")
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