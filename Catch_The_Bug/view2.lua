-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 변수 받기
local score = composer.getVariable("score")

-- 변수 선언
local background
local resultUI = {}
local cat

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경화면
	background = display.newImageRect("img/BG_Forest.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	
	resultUI[1] = display.newImageRect("img/speechbubble.png", 500, 500)
	resultUI[1].x, resultUI[1].y = display.contentWidth/2 + 200, display.contentHeight/2 - 100
	resultUI[2] = display.newText("000점\n이다옹\n  ^-^", display.contentWidth/2 + 200, display.contentHeight/2 - 140, "굴림")
	resultUI[2].size = 80
	resultUI[2].text = string.format("%04d점\n이다옹\n  ^-^", score)

	cat = display.newImageRect("img/cat.png", 350, 350)
	cat.x, cat.y = 400, display.contentHeight/2 + 100
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
