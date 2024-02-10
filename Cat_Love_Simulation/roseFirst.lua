-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

function scene:create( event )
	local sceneGroup = self.view

	local  background = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local school = display.newImageRect("img/building2.png", 400, 400)
	school.x, school.y = 150, 150

	local textBox = display.newImageRect("image/text.png",display.contentWidth, 429)--텍스트 배경 박스
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2+460

	local nextButton = display.newImageRect("image/right.png", 100, 100)
	nextButton.x, nextButton.y = 650, 1230

	local image = {}
	image[1] = display.newImageRect("image/yanggeng.png",400, 500)--양갱
	image[2] = display.newImageRect("image/map.png", 720, 1280)--맵
	image[3] = display.newImageRect("image/Hyei.png", 400, 500)--훼이
	image[4] = display.newImageRect("image/rose.png", 400, 500)--로즈

	for i=1, 4, 1 do
		image[i].x, image[i].y = display.contentWidth/2, display.contentHeight/2
		image[i].alpha = 0
	end
	image[1].x, image[1].y = display.contentWidth/2 + 100, display.contentHeight/2 
	image[4].x, image[4].y = display.contentWidth/2-150, display.contentHeight/2 
	image[4].alpha = 0

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
	text[1] = display.newText("이 지도에는 언제쯤 익숙해질 수 있을까... ", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")

	text[2] = display.newText("인간들도 참 바보 같다니까.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")

	text[3] = display.newText("이런 종이 쪼가리 말고 움직이는 화살표 같은 걸 만들어서 편하게 안내해주면 좋잖아?", textBox.x, textBox.y - 50 + 18, 600, 130, "Font/Maplestory Light.ttf")
	
	text[4] = display.newText("머리를 너무 많이 써서인가, 날이 추워서인가. 유독 기분이 꿀꿀했다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")

	text[5] = display.newText("괜시리 지나가는 학생들의 발목을 툭툭 치며 시비를 걸었다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	text[6] = display.newText("안녕!", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	text[7] = display.newText("발목을 건드린 학생이 웃으며 내민 이빨과자를 입에 넣으려는 순간,", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[8] = display.newText("                      어떤 고양이가 나를 불렀다.", textBox.x, textBox.y - 50 + 35, 600, 85, "Font/Maplestory Light.ttf")
	text[9] = display.newText("귀엽다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[10] = display.newText("            우유 생크림 같은 고양이를 보고 처음 든 생각이었다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[11] = display.newText("               지도에 대한 불평이나 맛있는 이빨과자 생각은 순식간에 날아가 버렸다.", textBox.x, textBox.y - 50 + 35 + 18, 600, 130, "Font/Maplestory Light.ttf")
	
	text[12] = display.newText("안녕?", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[13] = display.newText("         나는 양갱이라고 해.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[14] = display.newText("초면에 실례지만 정말정말 사랑스럽다.", textBox.x, textBox.y - 50 + 35, 600, 85, "Font/Maplestory Light.ttf")
	
	text[15] = display.newText("나는 로즈야.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[16] = display.newText("그런 말 많이 들어. 고마워!", textBox.x, textBox.y - 50 + 35, 600, 85, "Font/Maplestory Light.ttf")
	
	text[17] = display.newText("그런데 너는 여기 왜 온거야?", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[18] = display.newText("여기는 내 영역인데.", textBox.x, textBox.y - 50 + 35, 600, 85, "Font/Maplestory Light.ttf")
	
	text[19] = display.newText("난 이 학교를 같이 졸업할 반려를 찾고 있어!", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	text[20] = display.newText("반려?", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[21] = display.newText("         음...", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[22] = display.newText("                좋은 생각이네.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	text[23] = display.newText("그런데 남의 영역을 막 침범하는 아이를 반려로 삼고 싶어 하는 고양이가 있을까...?", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	text[24] = display.newText("그렇지만 내 영역 안에만 있으면 아무도 만날 수 없잖아.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[25] = display.newText("원래 모험은 위험을 동반하는 거랬어.", textBox.x, textBox.y - 50  + 35+ 35, 600, 85, "Font/Maplestory Light.ttf")
	text[26] = display.newText("듣고 보니 그러네!", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[27] = display.newText("그러면 여기도 자주 놀러와!", textBox.x, textBox.y  - 50+ 35, 600, 85, "Font/Maplestory Light.ttf")
	text[28] = display.newText("마침 혼자라 심심했는데 잘됐다.", textBox.x, textBox.y  - 50+ 35+ 35, 600, 85, "Font/Maplestory Light.ttf")
	
	text[29] = display.newText("초반의 우유거품같던 이미지와 달리, 로즈는 생각보다 야무지고 당당한 아이였다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	text[30] = display.newText("위풍당당하게 나방을 으적거리는 모습이 정말 멋진 고양이다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	text[31] = display.newText("               하지만 재미있는 일이 없어 많이 심심해 보였다.", textBox.x, textBox.y - 50 + 35, 600, 85, "Font/Maplestory Light.ttf")
	
	text[32] = display.newText("로즈는 이곳에 사는 듯하니 앞으로 여기 오면 볼 수 있을 것 같다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
	
	for i=1, 32, 1 do
		text[i].size = 30
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	function removeText( )--모든 텍스트 삭제
		-- body
		for i=1, 32, 1 do
			text[i].alpha = 0
		end
	end
	removeText()
	function fadein( )--이미지 등장때 사용하면 좋을 듯
		-- body
		local black = display.newRect(display.contentWidth, display.contentHeight, display.contentWidth/2, display.contentHeight/2 )
	end
	--[[function removeImage( )--모든 이미지 삭제
		-- body
		for i=1, 4, 1 do
			opening_Image[i].alpha = 0
		end
	end]]
	function removeName( )--모든 이름 삭제
		for i=0, 5, 1 do
			cat[i].alpha = 0
		end
	end

	local index = 1
	function printImage()--인덱스 별로 필요한 이미지와 이름이 뜰 수 있도록
		-- body
		if index == 1 then--양갱: 이 지도에는 언제쯤 익숙해질 수 있을까... 
			cat[1].alpha = 1
			image[1].alpha = 1
		elseif index == 2 then--양갱: 인간들도 참 바보 같다니까.
		elseif index == 3 then--양갱: 이런 종이 쪼가리 말고 움직이는 화살표 같은 걸 만들어서 편하게 안내해주면 좋잖아?
		elseif index == 4 then--머리를 너무 많이 써서인가, 날이 추워서인가. 유독 기분이 꿀꿀했다.
			removeName()
		elseif index == 5 then--괜시리 지나가는 학생들의 발목을 툭툭 치며 시비를 걸었다.
		elseif index == 6 then--???: 안녕!
			cat[0].alpha = 1
			--image[4].alpha = 1
			transition.to(image[4], {time = 500, alpha = 1})
		elseif index == 7 then--발목을 건드린 학생이 웃으며 내민 이빨과자를 입에 넣으려는 순간,
			removeName()
		elseif index == 8 then--어떤 고양이가 나를 불렀다.
		elseif index == 9 then--귀엽다.
		elseif index == 10 then--우유 생크림 같은 고양이를 보고 처음 든 생각이었다.
		elseif index == 11 then--지도에 대한 불평이나 맛있는 이빨과자 생각은 순식간에 날아가 버렸다.
		elseif index == 12 then--양갱: 안녕?
			cat[1].alpha = 1
		elseif index == 13 then--양갱: 나는 양갱이라고 해.
		elseif index == 14 then--양갱: 초면에 실례지만 정말정말 사랑스럽다.
		elseif index == 15 then--로즈: 나는 로즈야.
			removeName()
			cat[4].alpha = 1
		elseif index == 16 then--로즈: 그런 말 많이 들어. 고마워!
		elseif index == 17 then--로즈: 그런데 너는 여기 왜 온거야?
		elseif index == 18 then--로즈: 여기는 내 영역인데.
		elseif index == 19 then--양갱: 난 이 학교를 같이 졸업할 반려를 찾고 있어!
			removeName()
			cat[1].alpha = 1
		elseif index == 20 then--로즈: 반려?
			removeName()
			cat[4].alpha = 1
		elseif index == 21 then--로즈: 음...
		elseif index == 22 then--로즈: 좋은 생각이네.
		elseif index == 23 then--로즈: 그런데 남의 영역을 막 침범하는 아이를 반려로 삼고 싶어 하는 고양이가 있을까...?
		elseif index == 24 then--양갱: 그렇지만 내 영역 안에만 있으면 아무도 만날 수 없잖아.
			removeName()
			cat[1].alpha = 1 
		elseif index == 25 then--양갱: 원래 모험은 위험을 동반하는 거랬어.
		elseif index == 26 then--로즈: 듣고 보니 그러네!
			removeName()
			cat[4].alpha = 1
		elseif index == 27 then--로즈: 그러면 여기도 자주 놀러와!
		elseif index == 28 then--로즈: 마침 혼자라 심심했는데 잘됐다.
		elseif index == 29 then--초반의 우유거품같던 이미지와 달리, 로즈는 생각보다 야무지고 당당한 아이였다.
			removeName()
		elseif index == 30 then--위풍당당하게 나방을 으적거리는 모습이 정말 멋진 고양이다.
		elseif index == 31 then--하지만 재미있는 일이 없어 많이 심심해 보였다.
		elseif index == 32 then--로즈는 이곳에 사는 듯하니 앞으로 여기 오면 볼 수 있을 것 같다.
		end
	end
	function printText()
		-- body
		print("index:"..index)
		if index == 1 or index == 2 or index == 3 or index == 4 or index == 5 or index == 6 or index == 7 or index == 9
			or index == 12 or index == 15 or index == 17 or index == 19 or index == 20 or index == 23
			or index == 24 or index == 26 or index == 29 or index == 30 or index == 32 then
			removeText()
			printImage()
			text[index].alpha = 1
			index = index + 1
		elseif index == 33 then
			--removeName()
			--removeImage()
			--removeText()
			--씬 이동
			calcRoseCount()
			--print("calcRoseCount".. calcRoseCount())
			composer.gotoScene("map")
		else
			printImage()
			text[index].alpha = 1
			index = index + 1
		end
	end

	nextButton:addEventListener("tap", printText)

	sceneGroup:insert(background)
	sceneGroup:insert(school)
	for i=1, 4, 1 do
		sceneGroup:insert(image[i])
	end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nextButton)
	
	for i=0, 5, 1 do
		sceneGroup:insert(cat[i])
	end
	for i=1, 32, 1 do
		sceneGroup:insert(text[i])
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
