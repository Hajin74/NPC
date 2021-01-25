-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 전달한 변수 데려오기
local score = composer.getVariable("score")

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect( "img/BG_Forest.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
    background.y = display.contentHeight/2

    local resultBg = display.newRect(display.contentWidth/2 - 10, display.contentHeight/2, display.contentWidth/2 + 200, display.contentHeight/2 + 60)
    resultBg:setFillColor(1)
    resultBg.alpha = 0.5

    local person = display.newImageRect("img/player.png", 300, 600)
    person.x, person.y = 1050, display.contentHeight/2


    local endText = display.newText("당신의 점수는\n      "..score.."점", display.contentWidth/2, display.contentHeight/2, "굴림")
	if score >= 250 then
		endText.text = "당신의 점수는\n     "..string.format("%03d", score).."점\n프로게이머군요!"
	elseif score >= 200 then
		endText.text = "당신의 점수는\n     "..string.format("%03d", score).."점\nGOOD JOB"
	else
		endText.text = "당신의 점수는\n     "..string.format("%03d", score).."점\n 분발합시다."
	end
	endText.size = 100
    endText:setFillColor(0)
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
