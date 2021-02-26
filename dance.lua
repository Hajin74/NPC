-----------------------------------------------------------------------------------------
--
-- dance.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 소리
audio.pause( openingChannel )
audio.stop( mapChannel )
dance= audio.loadStream("music/dance.mp3")
danceChannel = audio.play( dance, { channel=3, loops=0, fadein=2000 } )
--audio.pause( danceChannel )

function scene:create( event )
	local sceneGroup = self.view
	
	math.randomseed( os.time() )
	local widget = require("widget")
	local timer = require("timer")
	local hogamdo = composer.getVariable("sendHogamdo")
	local clearOrNot

	local viewUI = {}
	local buttonUI = {}
	local view = {}
	local score = 0
	local showScore = display.newText("0", display.contentWidth/2, 70)
	showScore:setFillColor(0)
	showScore.size = 75

	local time = 30
	local clock = display.newText("30초", display.contentWidth/2, display.contentHeight-75)
	clock:setFillColor(0)
	clock.size = 75

	local background = display.newImageRect("image/gameBack.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local layer = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
	layer:setFillColor(0)
	layer.alpha = 0.7

	local howToPlay = display.newText("백 마디의 말보다\n하나의 행동이 중요한 법!\n\n양갱이의 진심을 몰라주는 친구를 위해,\n춤을 춰서 양갱이의 진심을 보여주자.\n\n올바른 화살표를 눌러 양갱이가\n멋진 구애의 춤을 출 수 있게 하자.",
		layer.x+20, layer.y-100, "Font/Maplestory Light.ttf")
	howToPlay.size = 40

	local clear = display.newText("성공!", display.contentWidth/2, display.contentHeight/2-300)
	clear.size = 70
	clear.alpha = 0
	local fail = display.newText("실패!", display.contentWidth/2, display.contentHeight/2-300)
	fail.size = 70
	fail.alpha = 0

	for i = 1, 50, 1 do--길 생성
		viewUI[i] = {}
    	viewUI[i][1] = display.newImageRect("image/Dance1.png", 100, 100)
    	viewUI[i][2] = display.newImageRect("image/Dance0.png", 100, 100)
    	viewUI[i][3] = display.newImageRect("image/Dance2.png", 100, 100)
    end

	local imageX = display.contentWidth/2
	local imageY = display.contentHeight/2+130
    for i = 1, 50, 1 do
    	for j = 1, 3, 1 do
    		viewUI[i][j].alpha = 0--모두 투명화
    		viewUI[i][j].x, viewUI[i][j].y = imageX, imageY
    	end
    	if i >= 1 and i <= 6 then		
	    	imageY = imageY - 120
	    end
    end

    local white = display.newRect(imageX, 70, 100, 70)

	local a = display.newImageRect("image/score.png", 500, 100)
	a.x, a.y = imageX, 70

	function endGame()
		audio.pause( danceChannel )
		finish.alpha = 0
		if fail.alpha == 1 then
			composer.setVariable("result", 0)
			composer.setVariable("sendHogamdo", hogamdo)
			composer.setVariable("number", 2)
			composer.gotoScene("map")----타임아웃
		else
			composer.setVariable("number", 2)
			composer.setVariable("result", 1)
			composer.setVariable("sendHogamdo", hogamdo)
			composer.gotoScene("map")
		end
		mapChannel = audio.play( map, { channel=2, loops=0, fadein=2000 } )
	end

	function countTime (event)
		clock.text = " "
		time = time - 1
		clock.text = string.format("%d초", time)
		if time == 0 then
			timer.pause("gameTimer")
			for i = 1, 3, 1 do buttonUI[i].alpha = 0 end
			layer.alpha = 0.7
			fail.alpha = 1

			finish = widget.newButton ({defaultFile = "bug_img/okbtn.png", overFile = "bug_img/okbtn.png",
			width = 150, height = 150, onPress = endGame})
			finish.x, finish.y = display.contentWidth/2, display.contentHeight-300
		end
	end

	local iconSize
	function resize()
		if index <= 45 then
			for i = 1, 3, 1 do
				viewUI[index][i].width = 400
				viewUI[index][i].height = 400
				viewUI[index+1][i].width = 350
				viewUI[index+1][i].height = 350
				viewUI[index+2][i].width = 300
				viewUI[index+2][i].height = 300
				viewUI[index+3][i].width = 250
				viewUI[index+3][i].height = 250
				viewUI[index+4][i].width = 200
				viewUI[index+4][i].height = 200
				viewUI[index+5][i].width = 150
				viewUI[index+5][i].height = 150
			end
		elseif index <= 50 then
			iconSize = 400
			for i = index, 50, 1 do
				for j = 1, 3, 1 do
					viewUI[i][j].width = iconSize
					viewUI[i][j].height = iconSize
				end
				iconSize = iconSize - 30
			end
		end
	end

    local iLimit = 7
    local last = 5
	function playerInput(event)
		if event.target.name == "left" then
			if viewUI[index][1].alpha == 1 then
				viewUI[index][1].alpha = 0
				index = index + 1
				showScore.text = " "
				score = score + 100
				showScore.text = string.format("%d", score)
				if index <= 45 then
					for i = index, iLimit, 1 do
						for j = 1, 3, 1 do
							viewUI[i][j].y = viewUI[i][j].y + 120
						end
					end
					print(index..","..iLimit)
					iLimit = iLimit + 1

				elseif index <= 50 then
					for i = index, 50, 1 do
						for j = 1, 3, 1 do
							viewUI[i][j].y = viewUI[i][j].y + 120
						end
					end
					print(index..","..iLimit)
				end
				resize()
			end
		end

		if event.target.name == "up" then
			if viewUI[index][2].alpha == 1 then
				viewUI[index][2].alpha = 0
				index = index + 1
				showScore.text = " "
				score = score + 100
				showScore.text = string.format("%d", score)
				if index <= 45 then
					for i = index, iLimit, 1 do
						for j = 1, 3, 1 do
							viewUI[i][j].y = viewUI[i][j].y + 120
						end
					end
					print(index..","..iLimit)
					iLimit = iLimit + 1

				elseif index <= 50 then
					for i = index, 50, 1 do
						for j = 1, 3, 1 do
								viewUI[i][j].y = viewUI[i][j].y + 120
						end
					end
					print(index..","..iLimit)
				end
				resize()
			end
		end

		if event.target.name == "right" then
			if viewUI[index][3].alpha == 1 then
				viewUI[index][3].alpha = 0
				index = index + 1
				showScore.text = " "
				score = score + 100
				showScore.text = string.format("%d", score)
				if index <= 45 then
					for i = index, iLimit, 1 do
						for j = 1, 3, 1 do
							viewUI[i][j].y = viewUI[i][j].y + 120
						end
					end
					print(index..","..iLimit)
					iLimit = iLimit + 1

				elseif index <= 50 then
					for i = index, 50, 1 do
						for j = 1, 3, 1 do
								viewUI[i][j].y = viewUI[i][j].y + 120
						end
					end
					print(index..","..iLimit)
				end
				resize()
			end
		end

		if score == 5000 then---클리어
			timer.pause("gameTimer")
			for i = 1, 3, 1 do buttonUI[i].alpha = 0 end
			layer.alpha = 0.7
			clear.alpha = 1

			finish = widget.newButton ({defaultFile = "bug_img/okbtn.png", overFile = "bug_img/okbtn.png",
			width = 150, height = 150, onPress = endGame})
			finish.x, finish.y = display.contentWidth/2, display.contentHeight-300
		end
	end

	function startGame ()
		layer.alpha = 0
		howToPlay.text = " "
		start:removeEventListener("touch", startGame)
		start.alpha = 0
		index = 1

		buttonUI[1] = widget.newButton ({defaultFile = "image/DanceLeft.png", overFile = "image/DanceLeft.png",
		width = 180, height = 180, onPress = playerInput})
		buttonUI[1].x, buttonUI[1].y = display.contentWidth/2-200, display.contentHeight-250
		buttonUI[1].name = "left"

		buttonUI[2] = widget.newButton ({defaultFile = "image/DanceUp.png", overFile = "image/DanceUp.png",
		width = 180, height = 180, onPress = playerInput})
		buttonUI[2].x, buttonUI[2].y = display.contentWidth/2, display.contentHeight-250
		buttonUI[2].name = "up"

		buttonUI[3] = widget.newButton ({defaultFile = "image/DanceRight.png", overFile = "image/DanceRight.png",
		width = 180, height = 180, onPress = playerInput})
		buttonUI[3].x, buttonUI[3].y = display.contentWidth/2+200, display.contentHeight-250
		buttonUI[3].name = "right"

		resize()
		timer.performWithDelay(1000, countTime, 0, "gameTimer")

		for i = 1, 50, 1 do
			view[i] = math.random(1, 3)
			viewUI[i][view[i]].alpha = 1
		end
	end


	start = widget.newButton ({defaultFile = "bug_img/okbtn.png", overFile = "bug_img/okbtn.png",
	width = 150, height = 150, onPress = startGame})
	start.x, start.y = display.contentWidth/2, display.contentHeight-300

	--[[local start = display.newImageRect("image/next.png", 150, 150)
	start.x, start.y = display.contentWidth/2, display.contentHeight-300
	start:addEventListener("touch", startGame)]]

	sceneGroup:insert(background) 
	for i = 1, #viewUI, 1 do 
		for j = 1, 3, 1 do
			sceneGroup:insert(viewUI[50-i+1][j]) 
		end
	end
	sceneGroup:insert(white)
	sceneGroup:insert(a)
	sceneGroup:insert(showScore) 
	sceneGroup:insert(clock)
	sceneGroup:insert(layer) 
	sceneGroup:insert(clear)
	sceneGroup:insert(fail) 
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
		composer.removeScene("dance")
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