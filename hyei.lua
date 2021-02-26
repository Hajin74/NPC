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
function scene:create( event )
	local sceneGroup = self.view

	--[[local winornot = composer.getVariable("winornot")--일단 삭제
	--이겼는지 여부....
	if winornot == 1 then
		index = 7--이겼으면 index = 7
		print("winornot: "..winornot)
	elseif winornot == 0 then
		index = 11--졌으면 index = 11
		print("winornot: "..winornot)
	end]]

	local  background = display.newImageRect("image/background.png", display.contentWidth, display.contentHeight)
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
	--image[1].x, image[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	--image[4].x, image[4].y = display.contentWidth/2-50, display.contentHeight/2 + 80
	image[3].x, image[3].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	image[3].alpha = 1
	local textBox = display.newImageRect("image/text.png",display.contentWidth, 429)--텍스트 배경 박스
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2+460

	local nextButton = display.newImageRect("image/right.png", 100, 100)
	nextButton.x, nextButton.y = 650, 1230

	local cat = {}
	cat[0] =  display.newText("???", 90, 1000, "Font/Maplestory Light.ttf")
	cat[1] =  display.newText("양갱", 90, 1000, "Font/Maplestory Light.ttf")
	cat[2] =  display.newText("젠", 90, 1000, "Font/Maplestory Light.ttf")
	cat[3] =  display.newText("나비", 90, 1000, "Font/Maplestory Light.ttf")
	cat[4] =  display.newText("로즈", 90, 1000, "Font/Maplestory Light.ttf")
	cat[5] =  display.newText("훼이", 90, 1000, "Font/Maplestory Light.ttf")

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
		--훼이 : 
		"으으...양갱이와 저렇게까지 친한 고양이가 있다니. 인정할 수 없어!",
		"그때, 훼이의 눈에 창가에 있는 화분이 들어왔다.",
		"화분을 보는 훼이의 눈이 반짝였다.",
		--훼이 : 
		"지구가 왜 둥근지 알아?",
		"지구가 평평했으면 고양이들이 모든 걸 우주 밖으로 떨어트렸을 테니까..!",
		"이대로 다른 놈을 반려로 맞는 건 절대 용납 못 해! 에잇!",
		--[[성공
		"헥...헥.....더 이상은 못 하겠다.",--7
		--(울면서)
		"크윽...! 양갱..너란 고양이란....정말 완벽해...!",
		--양갱 : 
		"휴~무사히 피했다.",
		"어떤 정신 나간 인간이 위에서 화분을 떨구던 거야. 잡히기만 해봐라.",
		--󰂜실패시
		--훼이 : 
		"가지지 못한다면 부숴버리겠어! 솔로천국 커플지옥!",--11
		--양갱 : 
		"으악!! 고양이 살려!"]]}

	
	local function showText()
		textBox1 = display.newText("", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
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
		if index == 2 or index == 3 or index == 9 or index == 10 or index ==12 then
			cat[5].alpha = 0
		else
			cat[5].alpha = 1
		end
	end
	function gotoGame( )
		-- body
		composer.gotoScene("game")
	end
	local background1 = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
		background1:setFillColor(0)
		background1.alpha = 0
	local gameScript = display.newText("훼이가 고양이의 본능에 충실하게 창가에 있는 화분들을 떨어트리고 있어요.창가의 화분들이 모두 떨어질 때까지 양갱이가 화분을 피하는 것을 도와주세요!"
    	, display.contentWidth/2, display.contentHeight/2, 600, 200, "Font/Maplestory Light.ttf")
    	gameScript.size  = 40
    	gameScript.alpha = 0
	function howtoplay( )
		background1.alpha = 0.8
		gameScript.alpha = 1
	end

	local function printText()
		-- body
		removeText()
		removeName()

		if index == 6 then--게임으로 넘어가기
			removeText()
			howtoplay()
		else
			index = index + 1
			showText()
			printName()

			--[[if index == 10 or index == 12 then--끝(일단 뒤에 스크립트 제거)
				composer.gotoScene("map")
			end]]
		end
		print("index:"..index)
	end
	showText()
	printName()

	nextButton:addEventListener("tap", printText)
	background1:addEventListener("tap", gotoGame)
	sceneGroup:insert(background)
	for i=1, 4, 1 do
		sceneGroup:insert(image[i])
	end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nextButton)
	for i=0, 5, 1 do
		sceneGroup:insert(cat[i])
	end
	sceneGroup:insert(background1)
	sceneGroup:insert(gameScript)

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
		composer.removeScene("hyei")
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
