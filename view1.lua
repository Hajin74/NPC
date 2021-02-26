-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local physics = require( "physics" )
physics.start()
local scene = composer.newScene()

-- 랜덤함수 초기화
math.randomseed(os.time())

--GUI 요소
local background
local score = {}
local gbird
local bomb
local gameUI = {} -- 어두운 화면, 텍스트, 오케이버튼

-- 소리
audio.pause( openingChannel )
audio.stop( mapChannel )
bug= audio.loadStream("music/bug.mp3")
bugChannel = audio.play( bug, { channel=4, loops=0, fadein=2000 } )

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경화면
	background = display.newImageRect("bug_img/bg.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	-- 점수
	score[1] = display.newText("0", display.contentWidth/2, 90, "굴림")
	score[1].size = 50
	score[2] = 0

	gameUI[1] = display.newRect(display.contentWidth/2, display.contentHeight/2 + 75, display.contentWidth, display.contentHeight - 150)
	gameUI[1].alpha = 0.6
	gameUI[1]:setFillColor(0)
	gameUI[2] = display.newText("사냥하면 양갱!\n양갱이가 나설 차례다!\n\n멋진 모습을 보여주어\n고양이에게 호감을 사자.\n\n날아다니는 벌레를 클릭하면\n벌레를 잡을 수 있다.", display.contentWidth/2, display.contentHeight/2, "바탕")
	gameUI[2].size = 50
	gameUI[3] = display.newImageRect("bug_img/okbtn.png", 150, 150)
	gameUI[3].x, gameUI[3].y = display.contentWidth/2, display.contentHeight/2 + 350

	-- 함수
	local function gotoMap()
		composer.gotoScene("map")
	end

	local function endGame()
		audio.pause( bugChannel )
		gameUI[1].alpha = 0.6
		gameUI[2].text = string.format("게임 종료\n   %d점", score[2])
		gameUI[2].alpha = 1
		gameUI[3].alpha = 1
		gameUI[3]:addEventListener("tap", gotoMap)
		mapChannel = audio.play( map, { channel=2, loops=0, fadein=2000 } )
	end

	local function calcBird()
		score[2] = score[2] + 10
		score[1].text = score[2]
	end

	local function calcBomb()
		score[2] = score[2] - 30
		score[1].text = score[2]
	end

	local function touchBird(event)
		event.target.alpha = 0
		
		calcBird()
	end

	local function touchBomb(event)
		event.target.alpha = 0

		calcBomb()
	end

	local function makeBird()
		gbird = display.newImageRect("bug_img/greenbird.png", 100, 100)
		gbird.x, gbird.y = math.random(10, 710), 150
		physics.addBody(gbird, "dynamic")
		gbird:setLinearVelocity( 0, 800 )
		gbird:addEventListener("touch", touchBird)
	end

	local function makeBomb()
		bomb = display.newImageRect("bug_img/bomb.png", 100, 100)
		bomb.x, bomb.y = math.random(10, 710), 150
		physics.addBody(bomb, "dynamic")
		bomb:setLinearVelocity( 0, 600 )
		bomb:addEventListener("touch", touchBomb)
	end

	local function startGame()
		for i = 1, 3, 1 do
			gameUI[i].alpha = 0
		end
		timer.performWithDelay(300, makeBird, 100)
		timer.performWithDelay(1000, makeBomb, 5)
		timer.performWithDelay(32000, endGame, 1)
		gameUI[3]:removeEventListener("touch", startGame)
	end

	-- 이벤트 등록
	gameUI[3]:addEventListener("touch", startGame) -- ok버튼을 누르면 게임시작!

	-- 장면 삽입
	sceneGroup:insert(background)
	sceneGroup:insert(score[1])
	for i = 1, 3, 1 do sceneGroup:insert(gameUI[i]) end
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
		composer.removeScene("view1")
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