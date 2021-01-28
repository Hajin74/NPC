-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 랜덤함수 초기화
math.randomseed(os.time())

-- 버튼 라이브러리
local widget = require("widget")

-- 변수 선언
local background
local ms = 1000 -- 벌레 생성 시간
local score = 000
local time = 30
local bluebugUI = {}
local ladybugUI = {}
local yellowbugUI = {}
local honeybeeUI = {}
local catUI = {}
local gameUI = {} -- 1: 점수표시, 2: 시간표시, 3: 캣 클릭시 실패표시

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경화면
	background = display.newImageRect("img/BG_Forest.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(background)
	-- 점수
	gameUI[1] = display.newText({
		text = "0000점", x = 1180, y = 50, width = 200,
		font = "굴림", fontSize = 50
	})
	
	-- 시간 표시
	gameUI[2] = display.newText({
		text = "30초", x = 120, y = 50, width = 150,
		font = "굴림", fontSize = 50
	})
	-- 시간 흐름
	local function timeEvent()
		time = time - 1
		gameUI[2].text = string.format("%02d초", time)
	end

	-- 게임 종료 함수
	local function resultEvent()
		composer.setVariable("score", score)
		composer.gotoScene("result")
	end

	-- 벌레 삭제 함수
	local function clickEvent(event)
		transition.to(event.target, {time = 200, alpha = 0}) -- 클릭하면 벌레가 별로 바뀜
		score = score + 10 -- 점수가 올라감
		if score == 1430 then
			resultEvent()
		end
		gameUI[1].text = string.format("%04d점", score) -- 올라간 점수 표시
	end

	-- 고양이 삭제 함수
	local function clickCatEvent(event)
		transition.to(event.target, {time = 200, alpha = 0})
		gameUI[3] = display.newText("나를 때리면\n어떡하냐옹!!!", event.target.x, event.target.y, "굴림")
		gameUI[3].size = 30
		transition.to(gameUI[3], {time = 1000, alpha = 0})
		score = score - 20 -- 점수가 올라감
		if score == 1430 then
			resultEvent()
		end
		gameUI[1].text = string.format("%04d점", score)
	end

	-- 벌레 생성 함수
	local function makeEvent()
		-- bluebugUI
		for i = 1, 2, 1 do
			bluebugUI[i] = widget.newButton({
				defaultFile = "img/bluebug.png", overFile = "img/paw.png",
				width = 100, height = 100, onPress = clickEvent
			})
			bluebugUI[i].x, bluebugUI[i].y = math.random(50, 1230), math.random(50, 670)
			sceneGroup:insert(bluebugUI[i])
		end
		-- yellowbugUI
		for i = 1, 3, 1 do
			yellowbugUI[i] = widget.newButton({
				defaultFile = "img/yellowbug.png", overFile = "img/paw.png",
				width = 100, height = 100, onPress = clickEvent
			})
			yellowbugUI[i].x, yellowbugUI[i].y = math.random(50, 1230), math.random(50, 670)
			sceneGroup:insert(yellowbugUI[i])
		end
		-- ladybugUI
		for i = 1, 4, 1 do
			ladybugUI[i] = widget.newButton({
				defaultFile = "img/ladybug.png", overFile = "img/paw.png",
				width = 100, height = 100, onPress = clickEvent
			})
			ladybugUI[i].x, ladybugUI[i].y = math.random(50, 1230), math.random(50, 670)
			sceneGroup:insert(ladybugUI[i])
		end
		-- honeybeeUI
		for i = 1, 2, 1 do
			honeybeeUI[i] = widget.newButton({
				defaultFile = "img/honeybee.png", overFile = "img/paw.png",
				width = 100, height = 100, onPress = clickEvent
			})
			honeybeeUI[i].x, honeybeeUI[i].y = math.random(50, 1230), math.random(50, 670)
			sceneGroup:insert(honeybeeUI[i])
		end
		ms = ms + 2500 -- 벌레 생성 함수를 실행시키는 시간을 점차 늦춤
	end

	-- 삭제 함수
	local function deleteEvent()
		catUI[1].alpha = 0
	end

	-- 고양이 생성 함수
	local function makeCatEvent()
		catUI[1] = widget.newButton({
			defaultFile = "img/cat.png", overFile = "img/cat.png",
			width = 100, height = 100, onPress = clickCatEvent
		})
		catUI[1].x, catUI[1].y = math.random(50, 1230), math.random(50, 670)
		timer.performWithDelay(3000, deleteEvent, 1)
		sceneGroup:insert(catUI[1])
		

	end
	
	-- 시간이 지나면 새로운 벌레가 계속 생김, 타이머
	makeEvent()
	timer.performWithDelay(ms, makeEvent, 10)
	timer.performWithDelay(5000, makeCatEvent, 6)
	timer.performWithDelay(1000, timeEvent, 30)
	timer.performWithDelay(3000, resultEvent, 1)
	
	--1430점 되거나 30초 끝나면 종료 후, 게임 종료 화면으로 이동
	






	-- 삽입
	for i = 1, 2, 1 do
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