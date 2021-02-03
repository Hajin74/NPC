-----------------------------------------------------------------------------------------
--
-- levelup.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

---
local backgroundMusic = audio.loadStream( "music/levelup.mp3" )
--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=5, loops=0, fadein=2000 } )
---
local background = {}
local gameUI = {}


function scene:create( event )
	local sceneGroup = self.view

    background[1] = display.newImageRect("img/map.png", display.contentWidth, display.contentHeight)
	background[1].x, background[1].y = display.contentWidth/2, display.contentHeight/2
	
    
    gameUI[1] = display.newImageRect("img/bubble.png", 800, 500)
    gameUI[1].x, gameUI[1].y = display.contentWidth/2, display.contentHeight/2
    gameUI[2] = display.newText("ㅇㅇㅇ", display.contentWidth/2, display.contentHeight/2, "굴림")
    gameUI[2].size = 30
    gameUI[2]:setFillColor(0)


	local function toCounter2()
		composer.gotoScene("counter2")
	end

    if money > 3000 then
        gameUI[2].text = string.format("오늘은 %d원이나 벌었네!!\n내 꿈에 더 가까워 지고 있어.\n내일은 중학교로 이동해서 장사를 해야지.\n레시피도 늘려볼까?", money)
		gameUI[1]:addEventListener("tap", toCounter2)
	else 
        gameUI[2].text = string.format("오늘은 영 장사가 안되네...\n%d원으로 레시피를 늘리기에는 무리야.\n다시 제대로 장사해보자!", money)
    end
    print(money)
    


    -- 장면 삽입
	sceneGroup:insert(background[1])
	for i = 1, 2, 1 do sceneGroup:insert(gameUI[i]) end
end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
	elseif phase == "did" then
		
		-- e.g. start timers, begin animation, play audio, etc.
	end   
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
        
	elseif phase == "did" then
		
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene