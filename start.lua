-----------------------------------------------------------------------------------------
--
-- start.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 변수 선언
local background = {}
local gameUI = {} -- 게임방법, 게임시작

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경화면
	background[1] = display.newImageRect("img/BG_Forest.png", display.contentWidth, display.contentHeight)
    background[1].x, background[1].y = display.contentWidth/2, display.contentHeight/2
    
    background[2] = display.newRect(1070, 500, 300, 100)
    background[2]:setFillColor(1)
    background[2].alpha = 0.5

    background[3] = display.newRect(1070, 620, 300, 100)
    background[3]:setFillColor(1)
    background[3].alpha = 0.5

    background[4] = display.newImageRect("img/cat.png", 350, 350)
    background[4].x, background[4].y = 300, display.contentHeight/2 + 100
    
    background[5] = display.newImageRect("img/speechbubble.png", 400, 400)
	background[5].x, background[5].y = display.contentWidth/2 + 90, display.contentHeight/2 - 100


    gameUI[1] = display.newText("게임 방법", 1070, 500, "굴림")
    gameUI[2] = display.newText("게임 시작", 1070, 620, "굴림")
    for i = 1, 2, 1 do
        gameUI[i].size = 60
        gameUI[i]:setFillColor(0)
    end
    gameUI[3] = display.newText("CATCH\n THE\n BUG", display.contentWidth/2 + 90 , display.contentHeight/2 - 140, "궁서체")
    gameUI[3].size = 60
    
    local function solEvent()
        gameUI[3].alpha = 0
        gameUI[4] = display.newText("벌레들이\n득실거린다옹\n나를 도와서\n잡아달라옹", display.contentWidth/2 + 90 , display.contentHeight/2 - 140, "궁서체")
        gameUI[4].size = 50
        sceneGroup:insert(gameUI[4])
    end

    local function startEvent()
        composer.gotoScene("view1")
    end

    background[3]:addEventListener("tap", startEvent)
    background[2]:addEventListener("tap", solEvent)
    

    --scene 삽입
    for i = 1, 5, 1 do
        sceneGroup:insert(background[i])
    end
    for i = 1, 3, 1 do
        sceneGroup:insert(gameUI[i])
    end
    
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
