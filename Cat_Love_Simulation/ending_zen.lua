-----------------------------------------------------------------------------------------
--
-- ending_zen.lua 
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 소리
-- 소리
audio.pause( openingChannel )
audio.stop( mapChannel )
ending= audio.loadStream("music/ending.mp3")
endingChannel = audio.play( ending, { channel=11, loops=0, fadein=2000 } )

function scene:create( event )
	local sceneGroup = self.view
	
	math.randomseed( os.time() )

	local widget = require("widget")

	local index = 1
	local showText = {}
	local showName = {}
	local characterUI = {}
	--호감도는 setVariable로 넘어다녀야 할 듯...나중에 구현

	local background = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	local textBox = display.newImageRect("image/text.png", 720, 429)
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight-200

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2,display.contentWidth, display.contentHeight)
	black:setFillColor(0)

	-----------------------------------------------------
	local zen_small = display.newImageRect("image/zen_small.png", 450, 600)
	zen_small.x, zen_small.y = display.contentWidth/2+150, display.contentHeight/2-30
	zen_small.alpha = 0

	local yanggang = display.newImageRect("image/yanggang.png", 450, 600)
	yanggang.x, yanggang.y = display.contentWidth/2, display.contentHeight/2-30
	yanggang.alpha = 0

	------------------------------------------------------
	local name = {"양갱", "젠"}

	local text = {"고뇌하는 하늘을 닮은 푸른 털.",
		"웃을 때마다 둥글어지는 두 눈.",
		"내가 다가가면 나를 향해 살짝씩 쫑긋이는 귀.",
		"그리고 고개를 올려 부드럽게 미소짓는 표정.",
		"이젠 어떤 걸 봐도 젠만 생각나.",
		"젠과 함께라면, 바깥세상을 여행하는 것도 훨씬 더 행복할거야.",
		"젠에게 이런 내 마음을 전하고 싶어.",
		"양갱이는 떠날 채비를 마친 채로 버려진 책장이 있는 곳으로 갔다.",
		"젠은 언제나처럼 책을 읽고 있었지만, 양갱이의 기척을 듣자 고개를 들었다.",
		"항상부드럽게 올라가 있던 입꼬리는 양갱이가 맨 가방을 보자 굳게 다물렸다.",
		"마치 무언가를 결심한 듯, 혹은 각오한 듯 했다.",
		"고요한 정적이 두 고양이를 휩쓸었다.",
		"양갱이는 길게 심호흡을 한 후, 젠에게 같이 떠나자고 소리쳤다.",
		"정확히는, 소리치려 했다.",
		"젠!",
		"좋아.",
		"응? 나 아직 아무 말도 안했는데.",
		"같이 가자는 말이 하고 싶었던 거 아니었어?",
		"너...괜찮아? 책들을 다 들고가진 못할텐데.",
		"이미 여러번 읽은 것들이라 상관없어. 책이야 바깥에 가면 더 많을 테니까.",
		"물론 그런 게 없더라도 같이 갈 거야. 물론 지식도 좋지만,",
		"...",
		"그 곳에는 네가 있을 거잖아.",
		"Ending"
	}
					
	-----------------------------------------------------------
	for i = 1, 2, 1 do
		showName[i] = display.newText(name[i], textBox.x-200, textBox.y-160, "Font/Maplestory Light.ttf")
		showName[i]:setFillColor(0)
		showName[i].size = 50
		showName[i].alpha = 0
	end

	for i = 1, #text, 1 do
		showText[i] = display.newText(text[i], textBox.x, textBox.y, 600, 85, "Font/Maplestory Light.ttf")
	end
	for i = 1, #showText, 1 do
		showText[i].size = 40
		showText[i]:setFillColor(0)
		showText[i].alpha = 0
	end
	showText[1].alpha = 1
	showName[1].alpha = 1
	showName[1]:setFillColor(1)

	function nameText ()
		if index >= 2 and index <= 4 then
			showName[1]:setFillColor(1)
		elseif index == 5 then
			showName[1]:setFillColor(0)
		end

		if (index >= 1 and index <= 7) or index == 15 or index == 17 or index == 19 then
			showName[2].alpha = 0
			showName[1].alpha = 1

		elseif index == 16 or index == 18 or (index >= 20 and index <= 23) then
			showName[1].alpha = 0
			showName[2].alpha = 1
		elseif (index >= 8 and index <= 14) then
			showName[1].alpha = 0
			showName[2].alpha = 0
		end
	end

	function occurEvent()
		if index == 5 then
			yanggang.alpha = 1
			transition.to(black, {time = 500, alpha = 0})
		elseif index == 8 then
			yanggang.x = zen_small.x-300
			transition.to(zen_small, {time = 500, alpha = 1.0})
		elseif index == 22 then
			transition.to(black, {time = 1000, alpha = 0.5})
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		nameText()
		occurEvent()

		if index == 24 then
			event.target.alpha = 0
		end
	end

	local next = widget.newButton(
		{defaultFile = "image/next.png", overFile = "image/next.png",
		width = 100, height = 100, onPress = nextText}
	)
	next.x, next.y = display.contentWidth-100, display.contentHeight-100

-------------------------------------------------------------------

	sceneGroup:insert(background)
	sceneGroup:insert(black)
	sceneGroup:insert(textBox)
	sceneGroup:insert(zen_small)
	sceneGroup:insert(yanggang)
	for i = 1, #showText, 1 do sceneGroup:insert(showText[i]) end
	for i = 1, #showName, 1 do sceneGroup:insert(showName[i]) end
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
		composer.removeScene("story_zen")
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
