-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local index = 0
local textBox1

-- 소리
audio.pause( openingChannel )
audio.stop( mapChannel )
ending= audio.loadStream("music/ending.mp3")
endingChannel = audio.play( ending, { channel=13, loops=0, fadein=2000 } )


function scene:create( event )
	local sceneGroup = self.view
	
	local  background = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local image = {}
	image[1] = display.newImageRect("image/yanggeng.png",400, 500)--양갱
	image[2] = display.newImageRect("image/map.png", 720, 1280)--맵
	image[3] = display.newImageRect("image/hyei.png", 400, 500)--훼이
	image[4] = display.newImageRect("image/rose.png", 400, 500)--로즈

	for i=1, 4, 1 do
		image[i].x, image[i].y = display.contentWidth/2, display.contentHeight/2
		image[i].alpha = 0
	end
	image[1].x, image[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	image[4].x, image[4].y = display.contentWidth/2-50, display.contentHeight/2 + 80
	image[3].x, image[3].y = display.contentWidth/2-230, display.contentHeight/2 + 80

	local textBox = display.newImageRect("image/text.png",display.contentWidth, 429)--텍스트 배경 박스
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2+460

	local nextButton = display.newImageRect("image/right.png", 100, 100)
	nextButton.x, nextButton.y = 650, 1230

	local cat = {}
	cat[0] =  display.newText("???", 90, 1000, "Font/Maplestory Bold.ttf")
	cat[1] =  display.newText("양갱", 90, 1000, "Font/Maplestory Bold.ttf")
	cat[2] =  display.newText("젠", 90, 1000, "Font/Maplestory Bold.ttf")
	cat[3] =  display.newText("나비", 90, 1000, "Font/Maplestory Bold.ttf")
	cat[4] =  display.newText("로즈", 90, 1000, "Font/Maplestory Bold.ttf")
	cat[5] =  display.newText("훼이", 90, 1000, "Font/Maplestory Bold.ttf")

	for i=0, 5, 1 do
		cat[i].alpha = 0
		cat[i].size = 40
		cat[i]:setFillColor(0)
		cat[i].x, cat[i].y = 140, 935
	end

	local text = {}
	--***행간 크기 5
	----> 폰트 사이즈 + 행간(5) = y좌표 차이값(이만큼 씩 다음줄 y값에 더해주기)
	--***("텍스트 내용", x좌표(통일), y좌표(다음줄은 + y좌표 차이값(45), 너비(통일 시켜야 왼쪽 줄맞춤 가능), 높이(2줄 기준 85로 통일함))
	text ={
	"구름같이 폭신거리는 털.",
	"강아지풀처럼 살랑이는 꼬리.",
	"검무를 출 때마다 짓는 매혹적인 미소.",
    "그 모습을 볼 때면, 내 옆을 스쳐가는 장미칼도 무섭지 않아.",
	"어떤 걸 봐도 로즈만 생각나.",--5
	"로즈와 함께라면, 바깥세상을 여행하는 것도 훨씬 더 행복할거야.",
	"로즈에게 이런 내 마음을 전하고 싶어.",
	"양갱이는 로즈의 보금자리로 달려나갔다.",
	"로즈는 빠른 속도로 뛰어온 양갱이의 모습에 살짝 놀란 듯 했지만",
	"양갱이가 무슨 말을 할지 안다는 듯 웃었다.",--10
	"양갱이는 숨이 차 헉헉거리면서도 말을 이어나갔다.",
	--양갱 : 
	"로..로즈야! 나랑....나랑 같이 이곳을 떠나자!",--12
	"로즈는 흔쾌하게 양갱이의 제안을 받아들였다.",
	--로즈 : 
	"안 그래도 내 춤을 봐줄 고양이들이 더 필요했어!",
	"그 때, 어디서 나타난건지 모르는 훼이가 두 고양이에게 빽 소리쳤다.",--15
	--훼이 : 
	"이렇게 떠나보낼 순 없어! 양갱이는 내 반려..",
	--로즈 : 
	"뭐라고? 다시 말해줄래?",
	"훼이는 로즈가 치켜든 칼을 보고 뒤도 돌아보지 않고 줄행랑쳤다.\n초라한 뒷모습이였다.",
	--로즈 : 
	"아, 빈 자리 있으면 거기 이 칼도 넣어줘!",
	--양갱 : 
	"으..응...",--20
	"그 뒤로 두 고양이는, 전국의 고양이들에게 고양이 분쇄기라는 이명으로 불리게 되었다.",
	"The End"}

	
	local function showText()
		textBox1 = display.newText("", textBox.x, textBox.y - 35, 600, 130, "Font/Maplestory Light.ttf")
		textBox1.text = text[index]
		textBox1.size = 30
		textBox1:setFillColor(0)
	end

	local function fadein( )--이미지 등장때 사용하면 좋을 듯
		-- body
		local black = display.newRect(display.contentWidth, display.contentHeight, display.contentWidth/2, display.contentHeight/2 )
	end
	function removeImage( )--모든 이미지 삭제
		-- body
		for i=1, 4, 1 do
			image[i].alpha = 0
		end
	end
	local function removeName( )--모든 이름 삭제
		for i=0, 5, 1 do
			cat[i].alpha = 0
		end
	end

	
	local function removeText( )
		-- body
		textBox1.alpha = 0
	end

	local function printName( )
		-- body
		
		print("프린트네임")
		if index == 12 or index ==20 then
			removeName()
			cat[1].alpha = 1
		elseif index == 14 or index == 17 or index == 19 then
			removeName()
			cat[4].alpha = 1
		elseif index == 16 then
			removeName()
			cat[5].alpha = 1
		end
		if index == 8 then
			image[4].alpha = 1
		elseif index == 9 then
			image[1].alpha = 1
			image[4].alpha = 1
		elseif index == 15 then
			image[3].alpha = 1
		elseif index == 18 then
			image[3].alpha = 0
		elseif index == 22 then
			nextButton.alpha = 0
		end
	end
	local function printText()
		-- body
		removeText()
		removeName()
		--removeText()
			--printImage()
			--textBox1.alpha = 1
		if index == 23 then
			composer.gotoScene("map")
		end
		index = index + 1
		showText()
		printName()

		print("index:"..index)
	end
	showText()
	printName()
	nextButton:addEventListener("tap", printText)

	sceneGroup:insert(background)
	for i=1, 4, 1 do
		sceneGroup:insert(image[i])
	end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nextButton)
	for i=0, 5, 1 do
		sceneGroup:insert(cat[i])
	end

		--sceneGroup:insert(textBox1)


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
		composer.removeScene("roseFirst")
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
