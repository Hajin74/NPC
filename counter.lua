-----------------------------------------------------------------------------------------
--
-- counter.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--랜덤함수
math.randomseed(os.time())
-- 라이브러리 추가
local widget = require("widget")
local physics = require("physics")

-- GUI 요소들 선언 
local background = {} -- 초등학교배경, 카운터배경
local gameUI = {} -- 환경설정, 레시피 아이콘, 화면전환, 저금통, 저금통금액
-------------------------------
local customer = {}--손님 이미지
local menu = {}--메뉴 이미지
local customer_order--손님 랜덤 지정
local customer_num--주문 메뉴 랜덤 지정

local bubble = {}--말풍선
---------------------------
local hpDownNum = 10--길이에 맞춰 조절해야함
local hpXDownNum = 5
local mentalityDownNum = 10
local mentalitXyDownNum = 5

function scene:create( event )
	local sceneGroup = self.view

	background[1] = display.newImageRect("img/elementaryschool.png",  1280, 460)
	background[1].x, background[1].y = display.contentWidth/2, display.contentHeight/2 - 70
	background[2] = display.newImageRect("img/truck.png", display.contentWidth, display.contentHeight)
	background[2].x, background[2].y = display.contentWidth/2, display.contentHeight/2
	
	gameUI[1] = display.newImageRect("img/setting.png", 70, 70)
    gameUI[1].x, gameUI[1].y = display.contentWidth - 50, 50
    gameUI[2] = display.newImageRect("img/recipe.png", 70, 70)
    gameUI[2].x, gameUI[2].y = display.contentWidth - 120, 50
    gameUI[3] = display.newImageRect("img/arrow.png", 70, 70)
    gameUI[3].x, gameUI[3].y = display.contentWidth - 200, 50
	gameUI[4] = display.newImageRect("img/bank.png", 120, 100)
	gameUI[4].x, gameUI[4].y = display.contentWidth - 80, display.contentHeight - 200
	gameUI[5] = display.newText("", display.contentWidth - 80, display.contentHeight - 200, "굴림")
	gameUI[5].size = 40
	gameUI[5]:setFillColor(0)

	



	-- [[ 함수들 ]]
	-- 주방으로 이동
	local function toCook()
		composer.gotoScene("cook")
	end

	-- 이벤트 등록
	gameUI[3]:addEventListener("tap", toCook)

	-- scene 삽입
	for i = 1, 2, 1 do sceneGroup:insert(background[i]) end
	for i = 1, 5, 1 do sceneGroup:insert(gameUI[i]) end
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