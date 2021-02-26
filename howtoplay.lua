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
    background.alpha =0

   local opening_Image = {}
	opening_Image[1] = display.newImageRect("image/yanggeng.png",400, 500)--양갱
	opening_Image[2] = display.newImageRect("image/map.png", 500, 500)--맵

	opening_Image[1].x, opening_Image[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	opening_Image[1].alpha = 0
	opening_Image[2].x, opening_Image[2].y = display.contentWidth/2, display.contentHeight/2
	opening_Image[2].alpha = 0

    local textBox = display.newImageRect("image/text.png",display.contentWidth, 429)--텍스트 배경 박스
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2+460

	local nextButton = display.newImageRect("image/right.png", 100, 100)
	nextButton.x, nextButton.y = 650, 1230

	local cat = {}
	cat[0] =  display.newText("???", 90, 1000, "Font/Maplestory Bold.ttf")
	cat[1] =  display.newText("양갱", 60, 1000, "Font/Maplestory Bold.ttf")
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
	cat[1].alpha = 1

	local text = {}--***
	text[1] = display.newText("귀가 간지럽네.", textBox.x , textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")

	text[2] = display.newText("내가 뭘 하고 있었더라...", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	text[3] = display.newText("아,", textBox.x, textBox.y-50 + 35, 600 , 85,"Font/Maplestory Light.ttf")
	text[4] = display.newText("     지도를 보고 있었지.", textBox.x, textBox.y-50 + 35, 600 , 85, "Font/Maplestory Light.ttf")

	text[5] = display.newText("나는 어떤 곳이던 두렵지 않으니까,", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	text[6] = display.newText("네가 갈 곳을 선택해줘. 가고 싶은 건물을 클릭하면 돼.", textBox.x, textBox.y-50 + 35, 600 , 85, "Font/Maplestory Light.ttf")

	text[7] = display.newText("같은 곳을 여러 번 가도 돼.", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	text[8] = display.newText("하지만 나 말고는 다 바보같은 고양이들 뿐이라 같은 말을 반복할 수도 있어.", textBox.x, textBox.y-50 + 35, 600 , 85, "Font/Maplestory Light.ttf")
	text[9] = display.newText("물론 운이 좋으면 내 반려를 만날 수도 있겠지?", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	
	text[10] = display.newText("만날 고양이들의 호감도는 하트의 숫자를 보면 확인할 수 있어!", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	
	text[11] = display.newText("내 말 다 이해했지?", textBox.x, textBox.y-50, 600 , 85, "Font/Maplestory Light.ttf")
	text[12] = display.newText("그럼 어서 아무 곳이나 가보자!", textBox.x, textBox.y-50 + 35, 600 , 85, "Font/Maplestory Light.ttf")

	function removeText( )--모든 텍스트 삭제
		-- body
		for i=1, 12, 1 do
			text[i].size = 30
			text[i].alpha = 0
			text[i]:setFillColor(0)
		end
	end	
	removeText()
	function removeImage( )--모든 이미지 삭제
		-- body
		for i=1, 2, 1 do
			opening_Image[i].alpha = 0
		end
	end

	function removeName( )--모든 이름 삭제
		for i=1, 5, 1 do
			cat[i].alpha = 0
		end
	end

	function fadein( )--이미지 등장때 사용하면 좋을 듯
		-- body
		local black = display.newRect(display.contentWidth, display.contentHeight, display.contentWidth/2, display.contentHeight/2 )
	end

	local index = 1--부터 시작
	function printImage()--인덱스 별로 필요한 이미지와 이름이 뜰 수 있도록
		-- body
		if index == 1 then--양갱:귀가 간지럽네.
		elseif index == 2 then--양갱:내가 뭘 하고 있었더라...
			background.alpha = 1
			opening_Image[1].alpha = 1
		elseif index == 3 then--양갱:아,
			--background.alpha = 1
		elseif index == 4 then--양갱:지도를 보고 있었지.
			opening_Image[1].alpha = 0
			opening_Image[2].alpha = 1

		elseif index == 5 then--양갱:나는 어떤 곳이던 두렵지 않으니까,
		elseif index == 6 then--양갱:네가 갈 곳을 선택해줘. 가고 싶은 건물을 클릭하면 돼.
		elseif index == 7 then--양갱:같은 곳을 여러 번 가도 돼.
		elseif index == 8 then--양갱:하지만 나 말고는 다 바보같은 고양이들 뿐이라 같은 말을 반복할 수도 있어.
		elseif index == 9 then--양갱:물론 운이 좋으면 내 반려를 만날 수도 있겠지?
			removeText()
		elseif index == 10 then--양갱:만날 고양이들의 호감도는 왼쪽 아래(게이지 위치)를 통해 확인할 수 있어!
		elseif index == 11 then--양갱:내 말 다 이해했지?
		elseif index == 12 then--양갱:그럼 어서 아무 곳이나 가보자!
			composer.gotoScene("map")
		end
	end

	function printText()
		-- body
		print("index:"..index)
		if index == 2 or index == 5 or index == 7 
			or index == 10 or index == 11  then
			removeText()
			printImage()
			text[index].alpha = 1
			index = index + 1
		elseif index == 13 then
			--씬 이동
			print("스토리 시작")
		else
			printImage()
			text[index].alpha = 1
			index = index + 1
		end
	end
	nextButton:addEventListener("tap", printText)

	sceneGroup:insert(background)
	
	
	for i=1, 2, 1 do
		sceneGroup:insert(opening_Image[i])
	end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nextButton)
	for i=0, 5, 1 do
		sceneGroup:insert(cat[i])
	end
	for i=1, 12, 1 do
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
		composer.removeScene("howtoplay")
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
