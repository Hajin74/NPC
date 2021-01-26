-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 랜덤함수
math.randomseed(os.time())

-- 라이브러리 추가
local widget = require("widget")
local physics = require("physics")

-- 변수 선언
local kitchenBG
local gameUI = {} -- 1: setting, 2: recipe, 3: trashcan, 4: back_arrow(go to counter), 5: cutting board
local igUI = {} -- InGedient/ 나열된 재료/  1: 김, 2: 밥, 3: 단무지, 4: 달걀, 5: 햄
local usedigUI = {} -- used InGedient/ 조리대 위 재료/ 1: 김, 2: 밥, 3: 단무지, 4: 달걀, 5: 햄
local btnUI = {} -- 1: 완료 btn
local kimbapUI = {} -- 김밥종류/ 1: 꼬마김밥

function scene:create( event )
	local sceneGroup = self.view
    
    -- 배경화면
    kitchenBG = display.newImageRect("img/kitchen.jpeg", display.contentWidth, display.contentHeight)
    kitchenBG.x, kitchenBG.y = display.contentWidth/2, display.contentHeight/2
    
    -- 게임 UI(비교적 동적인 변화가 없는)
    gameUI[1] = display.newImageRect("img/setting.png", 70, 70)
    gameUI[1].x, gameUI[1].y = display.contentWidth - 50, 50
    gameUI[2] = display.newImageRect("img/recipe.png", 70, 70)
    gameUI[2].x, gameUI[2].y = display.contentWidth - 120, 50
    gameUI[3] = display.newImageRect("img/trashcan.png", 70, 70)
    gameUI[3].x, gameUI[3].y = display.contentWidth - 50, display.contentHeight - 50
    gameUI[4] = display.newImageRect("img/back_arrow.png", 70, 60)
    gameUI[4].x, gameUI[4].y = display.contentWidth - 120, display.contentHeight - 50
    gameUI[5] = display.newImageRect("img/cuttingboard.png", 700, 700)
    gameUI[5].x, gameUI[5].y = display.contentWidth/2 + 250, display.contentHeight/2

    kimbapUI[1] = display.newImageRect("img/kimbap.png", 250, 250)
    kimbapUI[1].x, kimbapUI[1].y = 795, 360
    kimbapUI[1].alpha = 0

    kimbapUI[2] = display.newImageRect("img/kimbap_fail.png", 250, 250)
    kimbapUI[2].x, kimbapUI[2].y = 795, 360
    kimbapUI[2].alpha = 0

    -- 재료들 클릭하면 재료가 사용되어지는 함수: 성공적으로 완성이 되면 김밥을 가지고 counter로 이동
    local function putIg(e)
        usedigUI[e.target.name].alpha = 1
    end

    -- 김밥 완성 함수
    local function completeKimbap(e)
        local flag = 1

        for i = 1, 5, 1 do
            if usedigUI[i].alpha == 0 then
                flag = 0
            end
        end

        if flag == 1 then
            for j = 1, 5, 1 do
                usedigUI[j].alpha = 0
            end
            kimbapUI[1].alpha = 1
        else
            for j = 1, 5, 1 do
                usedigUI[j].alpha = 0
            end
            kimbapUI[2].alpha = 1
        end
    end

    
    -- 김밥 재료들 나열
    igUI[1] = display.newImageRect("img/seaweed.png", 100, 100)
    igUI[2] = display.newImageRect("img/rice1.png", 100, 100)
    igUI[3] = display.newImageRect("img/pickledradish.png", 100, 100)
    igUI[4] = display.newImageRect("img/egg1.png", 100, 100)
    igUI[5] = display.newImageRect("img/ham1.png",100, 100)
    for i = 1, 5, 1 do
        igUI[i].x, igUI[i].y = 120, 100 + 130 * (i - 1)
        igUI[i].name = i
        igUI[i]:addEventListener("touch", putIg)
    end

    -- 도마위에 올려지고 사용되는 김밥 재료들
    usedigUI[1] = display.newImageRect("img/seaweed.png", 300, 250)
    usedigUI[1].x, usedigUI[1].y = 795, 360
    usedigUI[2] = display.newImageRect("img/rice2.png", 270, 220)
    usedigUI[2].x, usedigUI[2].y = 795, 360
    usedigUI[3] = display.newImageRect("img/pickledradish2.png", 270, 20)
    usedigUI[4] = display.newImageRect("img/egg2.png", 270, 20)
    usedigUI[5] = display.newImageRect("img/ham2.png", 270, 20)
    for i = 3, 5, 1 do
        usedigUI[i].x, usedigUI[i].y = 795, 500 - 25 * (i - 1)
    end
    -- 숨김처리, 나열되어 있는 재료들을 클릭하면 숨겨진 재료가 보일 것임
    for i = 1, 5, 1 do
        usedigUI[i].alpha = 0
    end

    -- 완료 버튼
    btnUI[1] = widget.newButton({
        defaultFile = "img/ok.png", overFile = "img/ok.png", 
        width = 100, height = 100, onPress = completeKimbap
    })
    btnUI[1].x, btnUI[1].y = 1145, display.contentHeight/2



    -- scene 삽입
    sceneGroup:insert(kitchenBG)
    sceneGroup:insert(gameUI[5])
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