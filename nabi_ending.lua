-----------------------------------------------------------------------------------------
--
-- nabi_ending.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--GUI 요소
local background = {} -- 배경, 말풍선
local arrow = {} -- next, previous
local building = {}
local char = {} -- (character) 나비, 양갱

local textBox
local nameBox
local name = {}
local ending = {} -- 소개 스크립트
local index = 1

-- 소리
audio.pause( openingChannel )
audio.stop( mapChannel )
ending= audio.loadStream("music/ending.mp3")
endingChannel = audio.play( ending, { channel=12, loops=0, fadein=2000 } )

function scene:create( event )
	local sceneGroup = self.view
	
    background[1] = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
    background[1].x, background[1].y = display.contentWidth/2, display.contentHeight/2
    background[2] = display.newImageRect("img/bubble.png", display.contentWidth, 430)
    background[2].x, background[2].y = display.contentWidth/2, display.contentHeight - 215


	arrow[1] = display.newImageRect("img/arrow.png", 50, 50)
    arrow[1].x, arrow[1].y = display.contentWidth/2 + 300, display.contentHeight - 50

	building[1] = display.newImageRect("img/school.png", 350, 250)
    building[1].x, building[1].y = display.contentWidth - 200 , 200

    char[1] = display.newImageRect("img/nabi.png", 200, 300)
    char[1].x, char[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	char[2] = display.newImageRect("img/yang.png", 200, 300)
    char[2].x, char[2].y = display.contentWidth/2, display.contentHeight/2 + 80
	for i = 1, 2, 1 do char[i].alpha = 0 end

	name = {"양갱", "나비"}

	--------------------------------------

    ending = { 	-- 나비 엔딩
        --1 ~ 5
		"몸 곳곳에 그어져 있는 멋진 갈색 줄",
        "무심한듯한 표정",
        "그러나 예리하게 반짝이는 두 눈",
        "가끔 붉어지는 얼굴",
        "그리고 그때마다 슬쩍 올라가곤 하는 입꼬리",
        --6 ~ 10
        "이젠 어떤 걸 봐도 나비만 생각나.",
        "나비와 함께라면, 바깥세상을 여행하는 것도 훨씬 더 행복할거야.",
        "나비에게 이런 내 마음을 전하고 싶어.",
        "하지만, 나비도 같은 마음일까?",
        "그동안 내가 같이 가자 말해도 매번 시큰둥해 보이던데...",
        --11 ~ 15
        "양갱이는 길게 심호흡을 했다.",
        "나비야.",
        "나비가 조용히 고개를 들어 나를 보았다.",
        "나 이제 여기 떠나",
        ".....",
        --16 ~ 20
        "난 이 학교에서 몇 년간 살았으니, 다른 인간들처럼 졸업이라는 걸 할 거야.",
        "떠나면 다시 돌아오기 힘들 거 같아.",
        "그래서 말인데...",
        "나랑 같이 갈래?",
        ".....",
        --21 ~ 25
        "나비는 나보다는 내 뒤의 무언가를 보고 있는 거 같았다.",
        "이정도로 관심없어 보이니, 역시 졸업은 나 혼자 해야 하나.",
        "곤란하게 해서 미안해. 나는 그냥...",
        "지도.",
        "응?",
        --26 ~ 30
        "지도는 챙겼어?",
        "가장 중요한 건데, 가방에 없는 거 같아서. 그리고 가방은 좀 닫고 다녀.",
        "아 맞다! 보금자리에 두고 왔다. 다시 가야겠네.",
        "잠깐만, 그보다 그거 동의의 뜻으로 받아들여도 돼? 나랑 같이 가는거지?",
        "그래.",
        --31 ~ 35
        "잠깐만, 그럼 나 빨리 다녀올게! 너 그 사이에 무르기 없기다!",
        "걱정 마. 지도 가지고 올 동안 기다릴게.",
        "......",
        "언제나 그랬듯이.",
        "응!",
        --36 ~ 38
        "그러나 양갱이와 나비는 그 뒤로도 몇 번이나 물건을 빼먹는 양갱이 때문에 다음날에 출발해야 했다.",
        "일정이 하루 늦춰졌지만, 출발하는 두 고양이는 행복해 보였다.",
        "THE END"
	}

	--------------------------------------


	--------------------------------------

	local function showName()
		print("인덱스 "..index)

		nameBox = display.newText("", 100, 900, "Font/Maplestory Light.ttf")
		nameBox.size = 40
		nameBox:setFillColor(0)

		-- 양갱
		if ((index >= 1 and index <= 14) or (index >= 16 and index <= 19) or (index >= 21 and index <= 23)
            or index == 25 or index == 28 or index == 29 or index == 31 or index == 35) then
            nameBox.text = "양갱"
        elseif (index == 15 or index == 20 or index == 24 or index == 26 or index == 27
                or index == 30 or index == 32 or index == 33 or index == 34) then
                nameBox.text = "나비"
        else
            nameBox.text = ""
        end

	end

	local function closeName()
		nameBox.alpha = 0
	end

	--------------------------------------

	local function showEnding()
		print(index.."번째 ending 대사")

		textBox = display.newText("", display.contentWidth/2, 1060, 600, 150, "Font/Maplestory Light.ttf")
		textBox.text = ending[index]
		textBox.size = 40
		textBox:setFillColor(0)

	end

	local function closeEnding()
		textBox.alpha = 0
	end

	--------------------------------------

	local function showChar()
        if index == 1  then
            char[2].x, char[2].y = 200, 400
            transition.to(char[1], {time = 2000, alpha = 1, width = 280, height = 400})
            transition.to(char[2], {time = 500, alpha = 1})
        elseif (index >= 2 and index <= 11) then
            for i = 1, 2, 1 do char[i].alpha = 1 end
        elseif index == 12 then
            for i = 1, 2, 1 do char[i].alpha = 1 end
            transition.to(char[1], {time = 500, width = 200, height = 300})
            transition.to(char[2], {time = 500, x = display.contentWidth/2 - 50, y = display.contentHeight/2 + 50})
        elseif index >= 13 and index <= 35 then
            for i = 1, 2, 1 do char[i].alpha = 1 end
        else
            char[1] = display.newImageRect("img/nabi_love.png", 200, 300)
            char[1].x, char[1].y = display.contentWidth/2 + 100, display.contentHeight/2 + 50
            char[2] = display.newImageRect("img/yang_love.png", 200, 300)
            char[2].x, char[2].y = display.contentWidth/2 - 50, display.contentHeight/2 + 50
            for i = 1, 2, 1 do char[i].alpha = 1 end
        end

	end

	local function closeChar()
		for i = 1, 2, 1 do
            char[i].alpha = 0
        end
	end

	--------------------------------------

	local function nextEvent()
		closeEnding()
		closeName()
		closeChar()


		if index == 37 then
			arrow[1].alpha = 0
		end
		index = index + 1

		showEnding()
		showName()
		showChar()
	end

	-------------------------------------- 초기화

	showEnding()
	showName()
	showChar()


	--------------------------------------
	
	--이벤트 등록
	arrow[1]:addEventListener("tap", nextEvent)

	-- 씬 삽입
	for i = 1, 2, 1 do sceneGroup:insert(background[i]) end
	sceneGroup:insert(building[1]) 
	sceneGroup:insert(arrow[1])
	for i = 1, 2, 1 do sceneGroup:insert(char[i]) end
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