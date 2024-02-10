-----------------------------------------------------------------------------------------
--
-- ending_solo.lua 
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 소리
audio.pause( openingChannel )
audio.stop( mapChannel )
ending= audio.loadStream("music/ending.mp3")
endingChannel = audio.play( ending, { channel=10, loops=0, fadein=2000 } )

function scene:create( event )
	local sceneGroup = self.view
	
	math.randomseed( os.time() )

	local widget = require("widget")

	local index = 1
	local showText = {}
	local showName
	local characterUI = {}
	--호감도는 setVariable로 넘어다녀야 할 듯...나중에 구현

	local background = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	local textBox = display.newImageRect("image/text.png", 720, 429)
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight-200
	textBox.alpha = 0

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2,display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 0

	-----------------------------------------------------
	--[[local zen = display.newImageRect("image/zen.png", 450, 600)
	zen.x, zen.y = display.contentWidth/2+150, display.contentHeight/2-30
	zen.alpha = 0

	local yanggang = display.newImageRect("image/yanggang.png", 450, 600)
	yanggang.x, yanggang.y = display.contentWidth/2, display.contentHeight/2-30
	yanggang.alpha = 0]]

	------------------------------------------------------
	local name = {"양갱"}

	local text = {" ",
		"찾아봤지만 내 반려가 될만한 고양이는 없었어.",
		"역시 내 그릇을 품기에 지금의 세상은 너무 작아.",
		"같이 다닐 반려가 없다는 건 좀 아쉽지만...",
		"반려묘가 없더라도 난 더 넓은 세상을 향해 나아가겠어.",
		"혹시 알아?",
		"다니다 보면 운명처럼 나와 딱 맞는 고양이가 나타날지.",
		"The End"
	}
					
	-----------------------------------------------------------
	showName = display.newText(name[1], textBox.x-200, textBox.y-160)
	showName:setFillColor(0)
	showName.size = 50
	showName.alpha = 0

	for i = 1, #text, 1 do
		showText[i] = display.newText(text[i], textBox.x, textBox.y, 600, 85)
	end
	for i = 1, #showText, 1 do
		showText[i].size = 40
		showText[i]:setFillColor(0)
		showText[i].alpha = 0
	end

	function nameText ()
		print("인덱스: "..index)
		if index == 2 then
			showName.alpha = 1
		end
	end

	function occurEvent()
		if index == 2 then
			transition.to(black, {time = 500, alpha = 0.5})
			textBox.alpha = 1
		end
	end

	function nextText (event)
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1

		nameText()
		occurEvent()

		if index == 8 then
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
