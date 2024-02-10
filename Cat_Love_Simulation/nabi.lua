-----------------------------------------------------------------------------------------
--
-- nabi.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--GUI 요소
local background = {} -- 배경, 말풍선
local arrow = {} -- next, previous
local building = {}
local char = {} -- (character) 나비, 양갱, 학생 

local textBox
local nameBox
local name = {}
local intro = {} -- 소개 스크립트
local index = 1

function scene:create( event )
	local sceneGroup = self.view
	
    background[1] = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
    background[1].x, background[1].y = display.contentWidth/2, display.contentHeight/2
    background[2] = display.newImageRect("img/bubble.png", display.contentWidth, 430)
    background[2].x, background[2].y = display.contentWidth/2, display.contentHeight - 215


	arrow[1] = display.newImageRect("img/arrow.png", 50, 50)
    arrow[1].x, arrow[1].y = display.contentWidth/2 + 300, display.contentHeight - 50

	building[1] = display.newImageRect("img/building1.png", 500, 500)
    building[1].x, building[1].y = display.contentWidth - 250 , 350

    char[1] = display.newImageRect("img/nabi.png", 200, 300)
    char[1].x, char[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	char[2] = display.newImageRect("img/yang.png", 200, 300)
    char[2].x, char[2].y = display.contentWidth/2, display.contentHeight/2 + 80
	char[3] = display.newImageRect("img/somsom.png", 200, 300)
    char[3].x, char[3].y = 250, 300
	for i = 1, 3, 1 do char[i].alpha = 0 end

	name = {"양갱", "나비", "학생"}

	--------------------------------------

	intro = { 	-- 나비 소개(인트로)
		-- 1 ~ 10
		"항상 생각하는 거지만 나도 참 우물 안 개구리였네. 이런 곳을 아직도 모르고 있었다니.",
		"투덜대며 건물을 둘러보던 중, 갑자기 뒤에서 중저음의 목소리가 들렸다.",
		"야.",
		"나?",
		"당연히 너지. 거기 너 말고 다른 고양이가 어디 있어?",
		"뒤를 돌아보니, 고독한 분위기의 고양이 한 마리가 나를 한심하게 내려다보고 있었다.",
		"눈에 있는 흉터를 보니 싸움이 붙는다면 쉽게 넘어가지는 못할 것 같다.",
		"남의 영역에는 왜 들어온거지?",
		"음...반려를 찾으러?",
		"반려?",
		-- 11 ~ 20
		"뚱한 얼굴을 보아하니 심기가 매우 불편해 보이는데. 이대로 가다간 싸움이 나겠다.",
		"말을 돌려서 이 삐죽빼죽한 분위기를 바꿔놓아야 할 것 같다.",
		"그나저나 너 이름이 뭐야? 생긴 것만 보면 되게 멋진 이름일 것 같은데.",
		"나? 흠흠. 잘 기억해둬. 내 이름은 ‘미치광이의 심판자 카를로스 3세’...",
		"나비야~",
		"나비?\n방금 저 인간이 널 ‘나비’라고 불렀는데?",
		"자칭 ‘미치광이의 심판자 카를로스 3세’의 얼굴이 붉어지기 시작했다.",
		"아...아니. 그럴 리가.",
		"내가 그런 촌스러운 이름을 쓸 리가 없잖아.",
		"저 인간이 착각한 거겠지.\n인간은 원래 멍청하잖아.",
		-- 21 ~ 30
		"검정털에 호박눈에 눈 옆에 흉터도 있는 나비야~!",
		".....완전 넌데?",
		"검은색 고양이가 한둘이야?\n도대체 날 어떤 촌스러운 고양이랑 착각하는건지 원...",
		"우리 학교에 한 마리밖에 없는 사바나 고양이 나비야!!!!",
		"그렇다는데?",
		"으....저 인간 내 말을 알아듣는 게 틀림없어!",
		"울상을 짓던 나비는 얼굴이 빨개진 채로 달려나가 버렸다.",
		"몸의 감각을 집중해봐도 기척조차 느껴지지 않는 것을 보니 아주 꽁꽁 숨어 버린 거 같다.",
		"이상한 놈이네.",
		"나비는 이곳에 사는 듯하니 앞으로 여기 오면 볼 수 있을 것 같다."
	}

	--------------------------------------


	--------------------------------------

	local function showName()
		print("인덱스 "..index)

		nameBox = display.newText("", 100, 900, "Font/Maplestory Light.ttf")
		nameBox.size = 40
		nameBox:setFillColor(0)

		-- 양갱 대사
		if (index == 1 or index == 2 or index == 4 or index == 6 or index == 7 or
			index == 9 or index == 11 or index == 12 or index == 13 or index == 16 or
			index == 22 or index == 25 or index == 27 or index == 28 or index == 29 or index == 30) then
			nameBox.text = name[1]
		-- 나비 대사
		elseif (index == 3 or index == 5 or index == 8 or index == 10 or index == 14 or index == 17 or
				index == 18 or index == 19 or index == 20 or index == 23 or index == 26) then
			nameBox.text = name[2]
			char[1].alpha = 1
		-- 학생 대사
		elseif (index == 15 or index == 21 or index == 24) then
			nameBox.text = name[3]
			char[3].alpha = 1
		end
	end

	local function closeName()
		nameBox.alpha = 0
	end

	--------------------------------------

	local function showIntro()
		print(index.."번째 intro 대사")

		textBox = display.newText("", display.contentWidth/2, 1060, 600, 150, "Font/Maplestory Light.ttf")
		textBox.text = intro[index]
		textBox.size = 40
		textBox:setFillColor(0)

	end

	local function closeIntro()
		textBox.alpha = 0
	end

	--------------------------------------

	local function showChar()
		if (index == 1 or index == 2 or index == 4 or index == 6 or index == 7 or
			index == 9 or index == 11 or index == 12 or index == 13 or index == 16 or
			index == 22 or index == 25 or index == 27 or index == 28 or index == 29 or index == 30) then
			char[2].alpha = 1 

		-- 나비 
		elseif (index == 3 or index == 5 or index == 8 or index == 10 or index == 14 or index == 17 or
				index == 18 or index == 19 or index == 20 or index == 23 or index == 26) then
				char[1].alpha = 1
		
		-- 학생 
		elseif (index == 15 or index == 21 or index == 24) then
				char[3].alpha = 1
		end
	end

	local function closeChar()
		if index == 26 then
			transition.to(char[1], {time = 1000, alpha = 0})
			transition.to(char[1], {time = 1000, x = 50, y = 50})
		end
	end

	--------------------------------------

	local function nextEvent()
		closeIntro()
		closeName()
		closeChar()

		if index == 30 then
			calcNabiCount()
			composer.gotoScene("map")
		end

		index = index + 1

		showIntro()
		showName()
		showChar()
	end

	-------------------------------------- 초기화

	showIntro()
	showName()
	showChar()


	--------------------------------------
	
	--이벤트 등록
	arrow[1]:addEventListener("tap", nextEvent)

	-- 씬 삽입
	for i = 1, 2, 1 do sceneGroup:insert(background[i]) end
	sceneGroup:insert(building[1]) 
	sceneGroup:insert(arrow[1])
	for i = 1, 3, 1 do sceneGroup:insert(char[i]) end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nameBox)

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
		composer.removeScene("nabi")
		
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