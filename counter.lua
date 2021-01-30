-----------------------------------------------------------------------------------------
--
-- counter.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 라이브러리
local widget = require("widget")
local physics = require("physics")

-- 변수
local money = 0

-- GUI
local background = {} -- 1:초등학교, 2:트럭
local leftUI = {} -- 1:체력, 2:얼굴, 3:금액표시창, 4:금액표시
local rightUI = {} -- 1:환경설정, 2:레시피토글, 3:화면전환
local gameUI = {} -- 1:저금통, 2:저금통금액표시, 3:탁상달력
local person = {} -- 
local kimbap = {}

function scene:create( event )
	local sceneGroup = self.view

	background[1] = display.newImageRect("img/elementaryschool.png", 1250, 460)
	background[1].x, background[1].y = display.contentWidth/2, 290
	background[2] = display.newImageRect("img/truck.png", display.contentWidth, display.contentHeight)
	background[2].x, background[2].y = display.contentWidth/2, display.contentHeight/2

	leftUI[1] = display.newImageRect("img/hp.png", 300, 30)
	leftUI[1].x, leftUI[1].y = 220, 40
	leftUI[2] = display.newImageRect("img/mara.png", 60, 60)
	leftUI[2].x, leftUI[2].y = 50, 40
	leftUI[3] = display.newImageRect("img/money.png", 350, 60)
	leftUI[3].x, leftUI[3].y = 200, 100
	leftUI[4] = display.newText("0원", 180, 107, "굴림")
	leftUI[4].text = string.format("%d원", money)
	leftUI[4].size = 30
	leftUI[4]:setFillColor(0)

	rightUI[1] = display.newImageRect("img/setting.png", 70, 70)
	rightUI[1].x, rightUI[1].y = display.contentWidth - 50, 50
	rightUI[2] = display.newImageRect("img/recipe.png", 70, 70)
	rightUI[2].x, rightUI[2].y = display.contentWidth - 120, 50
	rightUI[3] = display.newImageRect("img/arrow.png", 70, 70)
	rightUI[3].x, rightUI[3].y = display.contentWidth - 190, 50

	gameUI[1] = display.newImageRect("img/bank.png", 160, 120)
	gameUI[1].x, gameUI[1].y = display.contentWidth - 130, display.contentHeight - 100
	gameUI[2] = display.newText("+1000원", display.contentWidth - 130, display.contentHeight - 165, "굴림")
	gameUI[2].size = 30
	gameUI[2]:setFillColor(0)
	gameUI[2].alpha = 0
	gameUI[3] = display.newImageRect("img/calendar.png", 130, 130)
	gameUI[3].x, gameUI[3].y = 130, display.contentHeight - 100

	person[1] = display.newImageRect("img/person1.png", 175, 205)
	person[1].x, person[1].y = 500, 418


	kimbap[1] = display.newImageRect("img/kimbap1.png", 300, 100)
	kimbap[2] = display.newImageRect("img/kimbap2.png", 300, 100)
	for i = 1, 2, 1 do
		kimbap[i].x, kimbap[i].y = display.contentWidth/2, display.contentHeight - 100
		kimbap[i].alpha = 0
	end


	-- 함수
	-- 조리화면으로 이동
	local function toCook()
		composer.setVariable("money", money)
		composer.setVariable("putKimbap", putKimbap)
		composer.gotoScene("cook")
	end

	function putKimbap(event)
		print("됐다!")
		kimbap[event.target.name].alpha = 1
	end



	-- 이벤트 등록
	rightUI[3]:addEventListener("tap", toCook)



	-- 장면 삽입
	for i = 1, 2, 1 do sceneGroup:insert(background[i]) end
	for i = 1, 3, 1 do sceneGroup:insert(gameUI[i]) end
	sceneGroup:insert(rightUI[3])
	sceneGroup:insert(person[1])
	sceneGroup:insert(leftUI[3])
	sceneGroup:insert(leftUI[4])
	for i = 1, 2, 1 do sceneGroup:insert(kimbap[i]) end
end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
	elseif phase == "did" then
		-- e.g. start timers, begin animation, play audio, etc.
	end   
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then

	elseif phase == "did" then
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene