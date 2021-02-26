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
	
	local background = display.newImageRect( "img/road.jpg", display.contentWidth, display.contentHeight )
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2

    local textBox =display.newImageRect("image/text.png",display.contentWidth, 429)--텍스트 배경 박스
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2+460

	local nextButton = display.newImageRect("image/right.png", 100, 100)
	nextButton.x, nextButton.y = 650, 1230

	local opening_Image = {}
	opening_Image[1] = display.newImageRect("image/yanggeng.png",400, 500)--양갱
	opening_Image[2] = display.newImageRect("image/map.png", 500, 500)--맵
	opening_Image[3] = display.newImageRect("image/Hyei.png", 400, 500)--훼이
	opening_Image[4] = display.newImageRect("image/hwei_love.jpg", 720, 1280)--사랑에빠진 훼이

	for i=1, 4, 1 do
		opening_Image[i].x, opening_Image[i].y = display.contentWidth/2, display.contentHeight/2
		opening_Image[i].alpha = 0
	end
	opening_Image[1].x, opening_Image[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	opening_Image[3].x, opening_Image[3].y = display.contentWidth/2-50, display.contentHeight/2 + 80

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
		cat[i].x, cat[i].y = 140, 935
		cat[i]:setFillColor(0)
	end

	local text = {}
	--***행간 크기 5
	----> 폰트 사이즈 + 행간(5) = y좌표 차이값(이만큼 씩 다음줄 y값에 더해주기)
	--***("텍스트 내용", x좌표(통일), y좌표(다음줄은 + y좌표 차이값(45), 너비(통일 시켜야 왼쪽 줄맞춤 가능), 높이(2줄 기준 85로 통일함))
	text[1] = display.newText("안녕?", textBox.x , textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")
	text[2] = display.newText("          나는 양갱,", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	text[3] = display.newText("이 학교의 터줏대감이다.", textBox.x, textBox.y -50+ 35, 600 , 85, "Font/Maplestory Light.ttf")

	text[4] = display.newText("이곳에서 많은 밥과 사랑을 받으며 행복하게 사는 중이다.", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")

	text[5] = display.newText("이 학교에 다니는 인간들은 여기서 몇 년 살고 나면 이곳을 떠난다.", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	text[6] = display.newText("인간들은 그걸 졸업이라고 하는 것 같다.", textBox.x, textBox.y + 35+ 35 -50, 600 , 85, "Font/Maplestory Light.ttf")

	text[7] = display.newText("나도 여기서 산지 몇 년 되었으니,", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")
	text[8] = display.newText("졸업이라는 걸 해도 되지 않을까?", textBox.x, textBox.y -50+ 35 , 600 , 85, "Font/Maplestory Light.ttf")

	text[9] = display.newText("난 항상 저 바깥 세상이 궁금했어!", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")

	text[10] = display.newText("마침 어제 지도라는 것도 손에 넣었어.", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")
	text[11] = display.newText("이걸로 주변을 돌아다니며 반려를 찾은 다음 같이 세계를 누비고 싶어!", textBox.x, textBox.y-50+ 35 , 600 , 85, "Font/Maplestory Light.ttf")

	text[12] = display.newText("다행히 손에 넣은 지도는 고양이도 볼 수 있을만큼 보기 쉬웠다.", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")

	text[13] = display.newText("그런데 길을 나서려는 때, 갑자기 누가 날 불렀다.", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")
--???:
	text[14] = display.newText("잠깐!거기 서!", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")
--양갱:
	text[15] = display.newText("뭐야 저 어벙이는.", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")
--훼이:
	text[16] = display.newText("어벙이 아니야!!훼이야!", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")

	text[17] = display.newText("훼이라는 고양이는 놀랍도록 존재감이 없었다.", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")
	text[18] = display.newText("내 여정에서 아주 잠깐 나타났다 사라질 것 같았다.", textBox.x, textBox.y-50+ 35 , 600 , 85, "Font/Maplestory Light.ttf")
--양갱:
	text[19] = display.newText("그래. 훼이야. 내 눈 앞에서 사라지렴.", textBox.x, textBox.y-50 , 600 , 85, "Font/Maplestory Light.ttf")
--훼이:
	text[20] = display.newText("네가 반려를 모집한다는 말을 들었다!", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")
	text[21] = display.newText("울퉁바위 짱인 내가 특별히 너의 반려가 되어주...", textBox.x, textBox.y -50+ 35 , 600 , 85, "Font/Maplestory Light.ttf")
	text[22] = display.newText("야!어디가!", textBox.x, textBox.y-50+ 35+ 35 , 600 , 85, "Font/Maplestory Light.ttf")

	text[23] = display.newText("양갱이는 뒤도 돌아보지 않고 그 자리를 떠났다\n", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")
--훼이:
	text[24] = display.newText("뒤도 돌아보지 않고 날 차다니...!", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")
	text[25] = display.newText("정말 매력적이야!", textBox.x, textBox.y -50, 600 , 85, "Font/Maplestory Light.ttf")

	for i=1, 25, 1 do
		text[i].size = 30
	end
------------------------------------------------------------------------------------------------------------
	function removeText( )
		-- body
		for i=1, 25, 1 do
			text[i].alpha = 0
			text[i]:setFillColor(0)
		end
	end
	removeText()
	function fadein( )--이미지 등장때 사용하면 좋을 듯
		-- body
		local black = display.newRect(display.contentWidth, display.contentHeight, display.contentWidth/2, display.contentHeight/2 )
	end

	local index = 1
	function removeImage( )
		-- body
		for i=1, 4, 1 do
			opening_Image[i].alpha = 0
		end
	end

	function removeName( )
		for i=0, 5, 1 do
			cat[i].alpha = 0
		end
	end

	function printImage()--인덱스 별로 필요한 이미지와 이름이 뜰 수 있도록(일단 수정 편하게 모든 인덱스 만들어뒀음)
		-- body
		if index == 1 then--안녕?
			cat[1].alpha = 1
			print("d")
		elseif index == 2 then--나는 양갱,
			opening_Image[1].alpha = 1

		elseif index == 3 then--이 학교의 터줏대감이다.
			--background.alpha = 1
		elseif index == 4 then--이곳에서 많은 밥과 사랑을 받으며 행복하게 사는 중이다.
		elseif index == 5 then--이 학교에 다니는 인간들은 여기서 몇년 살고 나면 이곳을 떠난다.
		elseif index == 6 then--인간들은 그걸 졸업이라고 하는 것 같다.
		elseif index == 7 then--양갱 : "나도 여기서 산지 몇 년 되었으니,"
			cat[1].alpha = 1
		elseif index == 8 then--양갱 : "졸업이라는 걸 해도 되지 않을까?""
		elseif index == 9 then--양갱 : "난 항상 저 바깥 세상이 궁금했어!"
		elseif index == 10 then--양갱 : "마침 어제 지도라는 것도 손에 넣었어."
			removeImage()
			opening_Image[2].alpha = 1
		elseif index == 11 then--양갱 : "이걸로 주변을 돌아다니며 반려를 찾은 다음 같이 세계를 누비고 싶어!"
			cat[1].alpha = 1
		elseif index == 12 then--다행히 손에 넣은 지도는 고양이도 볼 수 있을만큼 보기 쉬웠다.
			removeName()
		elseif index == 13 then--그런데 길을 나서려는 때, 갑자기 누가 날 불렀다.
			removeImage()
			opening_Image[2].alpha = 1
		elseif index == 14 then--???:"잠깐!거기 서!"
			cat[0].alpha = 1--??? 이름표
			removeImage()
		elseif index == 15 then--양갱:"뭐야 저 어벙이는."
			removeName()
			opening_Image[1].alpha = 1
			cat[1].alpha = 1--양갱 이름표
		elseif index == 16 then--훼이:"어벙이 아니야!!훼이야!"
			removeName()
			cat[5].alpha = 1--훼이 이름표
			opening_Image[3].alpha = 1
		elseif index == 17 then---훼이라는 고양이는 놀랍도록 존재감이 없었다.
			removeName()
		elseif index == 18 then--내 여정에서 아주 잠깐 나타났다 사라질 거 같았다.
		elseif index == 19 then--양갱:"그래. 훼이야. 내 눈 앞에서 사라지렴."
			removeName()
			cat[1].alpha = 1--양갱 이름표
		elseif index == 20 then--훼이:"네가 반려를 모집한다는 말을 들었다!"
			removeName()
			cat[5].alpha = 1--훼이 이름표
		elseif index == 21 then--훼이:"울퉁바위 짱인 내가 특별히 너의 반려가 되어주..."
		elseif index == 22 then--훼이:"야!어디가!"
		elseif index == 23 then--양갱이는 뒤도 돌아보지 않고 그 자리를 떠났다.
			removeName()
			opening_Image[1].alpha = 0
		elseif index == 24 then--훼이:"뒤도 돌아보지 않고 날 차다니...!"
			removeName()
			cat[5].alpha = 1--훼이 이름표
		elseif index == 25 then--훼이:"정말 매력적이야!"--여기 ***
			removeText()
			text[24].alpa = 0
			--textBox.alpha = 0
			--opening_Image[4].alpha = 1
		elseif index == 26 then
			removeName()
			removeText()
		end
	end

	function printText()
		-- body
		print("index:"..index)
		if index == 4 or index == 5 or index == 7 
			or index == 9 or index == 10 or index == 12
			or index == 13 or index == 14 or index == 15
			or index == 16 or index == 17 or index == 19
			or index == 20 or index == 23 or index == 24 or index == 25 then
			removeText()
			printImage()
			text[index].alpha = 1
			index = index + 1
		elseif index == 26 then
			removeName()
			removeImage()
			removeText()
			composer.gotoScene("howtoplay")
			
		else
			printImage()
			text[index].alpha = 1
			index = index + 1
		end
	end
	nextButton:addEventListener("tap", printText)

	sceneGroup:insert(background)
	for i=1, 4, 1 do
		sceneGroup:insert(opening_Image[i])
	end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nextButton)
	for i=0, 5, 1 do
		sceneGroup:insert(cat[i])
	end
	for i=1, 24, 1 do
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
		composer.removeScene("opening")
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
