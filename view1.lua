-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경 사진
	local background = display.newImageRect("img/BG_Forest.png", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	-- 타이머 표시
	local showTime = display.newText("남은 시간: 20", 1076, 50, "굴림")
	showTime.size = 50
	local time = 20 

	-- 시간 계산
	local function calcTime()
		time = time - 1
		showTime.text = "남은 시간: " .. string.format("%02d", time)
	end

	-- 점수 표시
	local showScore = display.newText("점수: 000", 1150, 105, "굴림")
	showScore.size = 50
	local score = 0


	-- 점수 계산 함수
	local function calcScore()
		score = score + 10
		showScore.text = "점수: " .. string.format("%03d", score)
	end

	-- 고양이 클릭 했을 시 점수 계산 함수
	local function catScore()
		score = score - 20
		showScore.text = "점수: "..string.format("%03d", score)
	end


	-- 최종 결과 화면 표시
	local function viewResult()
		composer.setVariable("score", score)
		composer.gotoScene("result")
	end


	-- 고양이 생성
	local cat = display.newImageRect("img/cat.png", 300, 200)
	cat.x, cat.y = math.random(50, 1250), math.random(50, 650)

	-- 벌레 생성
	local ladybug = display.newImageRect("img/ladybug.png", 100, 100)
	ladybug.x, ladybug.y = math.random(50, 1250), math.random(50, 650)

	local bluebug = display.newImageRect("img/bluebug.png", 100, 100)
	bluebug.x, bluebug.y = math.random(50, 1250), math.random(50, 650)

	local yellowbug = display.newImageRect("img/yellowbug.png", 100, 100)
	yellowbug.x, yellowbug.y = math.random(50, 1250), math.random(50, 650)

	local honeybee = display.newImageRect("img/honeybee.png", 100, 100)
	honeybee.x, honeybee.y = math.random(50, 1250), math.random(50, 650)

	

	-- 고양이를 이동시켜 다른 곳에서 생성
	local function moveCat()
		cat.isVisible= true
		cat.x, cat.y = math.random(30, 1280), math.random(30, 680)
	end

	-- 벌레를 이동시켜 다른 곳에서 생성
	local function moveLadybug()
		ladybug.isVisible= true
		ladybug.x, ladybug.y = math.random(30, 1280), math.random(30, 680)
	end

	local function moveBluebug()
		bluebug.isVisible= true
		bluebug.x, bluebug.y = math.random(30, 1280), math.random(30, 680)
	end

	local function moveYellowbug()
		yellowbug.isVisible= true
		yellowbug.x, yellowbug.y = math.random(30, 1280), math.random(30, 680)
	end

	local function moveHoneybee()
		honeybee.isVisible= true
		honeybee.x, honeybee.y = math.random(30, 1280), math.random(30, 680)
	end


	-- 고양이 숨기고 벌레를 이동시키는 함수 실행
	local function deleteCat()
		cat.isVisible = false
		catScore() -- 고양이는 -20점
		timer.performWithDelay(2000, moveCat, 1)
	end
	
	-- 벌레 숨기고 벌레를 이동시키는 함수 실행
	local function deleteLadybug()
		ladybug.isVisible = false
		calcScore()
		timer.performWithDelay(1000, moveLadybug, 1)
	end

	local function deleteBluebug()
		bluebug.isVisible = false
		calcScore()
		timer.performWithDelay(800, moveBluebug, 1)
	end

	local function deleteYellowbug()
		yellowbug.isVisible = false
		calcScore()
		timer.performWithDelay(1200, moveYellowbug, 1)
	end

	local function deleteHoneybee()
		honeybee.isVisible = false
		calcScore()
		timer.performWithDelay(500, moveHoneybee, 1)
	end
	
	-- 모든 생물 삭제
	local function deleteAllbug()
		ladybug.isVisible = false
		bluebug.isVisible = false
		yellowbug.isVisible = false
		honeybee.isVisible = false
		viewResult()
	end
	


	-- 벌레를 클릭하면 벌레를 삭제하고 숨기는 함수 실행
	ladybug:addEventListener('tap', deleteLadybug)
	bluebug:addEventListener('tap', deleteBluebug)
	yellowbug:addEventListener('tap', deleteYellowbug)
	honeybee:addEventListener('tap', deleteHoneybee)
	cat:addEventListener('tap', deleteCat)
	timer.performWithDelay(1000, calcTime, 20)


	-- 시간이 종료되고 모든 벌레들을 숨김 처리하는 함수 실행
	timer.performWithDelay(20000, deleteAllbug, 1)
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