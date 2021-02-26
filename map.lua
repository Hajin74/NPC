-----------------------------------------------------------------------------------------
--
-- map.lua
-- 고양이 고르는 씬
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 소리
audio.pause( openingChannel )
audio.pause( danceChannel )
map= audio.loadStream("music/main.mp3")
mapChannel = audio.play( map, { channel=2, loops=-1, fadein=2000 } )


--호감도 점수 
nabiHogamdo = 0
print("나비호감도: "..nabiHogamdo)

roseHogamdo = 0--하진
print("나비호감도: "..roseHogamdo)

zenHogamdo = 0
print("젠호감도: "..zenHogamdo)

-- 고양이를 몇 번 클릭했는가?
nabiCount = 1
print(nabiCount)
function calcNabiCount()
    print("나비카운트함수")
    nabiCount = 2
end
--추가
roseCount = 1
print(roseCount)
function calcRoseCount()
    print("로즈카운트함수")
    roseCount = 2
end
--추가 --
zenCount = 1
print(zenCount)
function calcZenCount()
    print("젠카운트함수")
    zenCount = 2
end

function scene:create( event )
	local sceneGroup = self.view
	
    local background = display.newImageRect("img/mapbg.jpg", display.contentWidth, display.contentHeight)
    background.x, background.y = display.contentWidth/2, display.contentHeight/2

    local endingbtn = display.newImageRect("img/endingbtn.png", 200, 200)
    endingbtn.x, endingbtn.y = display.contentWidth/2, 130

    local heart = {}
    for i = 1, 3, 1 do 
        heart[i] = display.newImageRect("img/heart.png", 140, 100)
        heart[i]:scale(0.8, 0.8)
    end
    heart[1].x, heart[1].y = display.contentWidth*0.2, display.contentHeight*0.23
    heart[2].x, heart[2].y = display.contentWidth*0.75 - 20, display.contentHeight*0.3 - 10
    heart[3].x, heart[3].y = display.contentWidth*0.48, display.contentHeight*0.67


    --추가
    --roseHogamdo = composer.getVariable("roseHogamdo")
    --print("roseHogamdo"..roseHogamdo)
    --[[roseHogamdoBox = display.newText("", heart[3].x, heart[3].y)
    roseHogamdoBox.size = 40
    roseHogamdoBox:setFillColor(1)
    roseHogamdoBox.text = roseHogamdo]]

    local roseHogamdoBox = display.newText("", heart[3].x, heart[3].y, "Font/Maplestory Light.ttf")
    roseHogamdoBox.text = roseHogamdo
    roseHogamdoBox.size = 40--하진

    -- 추가
    local nabiHogamdoBox = display.newText("", heart[2].x, heart[2].y, "Font/Maplestory Light.ttf")
    nabiHogamdoBox.text = nabiHogamdo
    nabiHogamdoBox.size = 40

    local zenHogamdoBox = display.newText("", heart[1].x, heart[1].y, "Font/Maplestory Light.ttf")
    zenHogamdoBox.text = zenHogamdo
    zenHogamdoBox.size = 40--하진

    local zen = display.newImage("img/zen.png")
    zen.x, zen.y = display.contentWidth*0.25, display.contentHeight*0.4
    zen.name = "zen"

    local nabi = display.newImage("img/nabi.png")
    nabi.x, nabi.y = display.contentWidth*0.75, display.contentHeight*0.45
    nabi.name = "nabi"

    local rose = display.newImage("img/rose.png")
    rose.x, rose.y = display.contentWidth*0.5 + 10, display.contentHeight*0.75 + 80
    rose.name = "rose"


    ------------------------------------------
    --- 호감도 메인에서도 적용
    function calcNabiMap()
        nabiHogamdoBox.text = string.format("%d", nabiHogamdo)
    end

    function calcRoseMap()--하진
        --roseHogamdo = composer.getVariable("roseHogamdo")
        roseHogamdoBox.text = string.format("%d", roseHogamdo)
    end

    function calcZenMap()--하진
        --roseHogamdo = composer.getVariable("roseHogamdo")
        zenHogamdoBox.text = string.format("%d", zenHogamdo)
    end
    ----------------------------------------

    -- 엔딩이벤트
    function endingEvent()
        if ( nabiHogamdo >= 20 and roseHogamdo < 20 and zenHogamdo < 20 ) then -- 나비가 우승
            composer.gotoScene("nabi_ending")
        elseif ( nabiHogamdo < 20 and roseHogamdo >= 20  and zenHogamdo < 20) then -- 로즈가 우승
            composer.gotoScene("roseEnding")
        elseif (nabiHogamdo < 20 and roseHogamdo <  20 and zenHogamdo >= 20) then -- 젠이 우승
            composer.gotoScene("ending_zen")
        elseif (nabiHogamdo < 20 and roseHogamdo <  20 and zenHogamdo < 20) then -- 독립엔딩
            composer.gotoScene("hyei")
        elseif (nabiHogamdo >= 20 and roseHogamdo >=  20 and zenHogamdo >= 20) then -- 독립엔딩
            composer.gotoScene("ending_solo")
        else
            composer.gotoScene("ending_solo")
        end
    end

    endingbtn:addEventListener("tap", endingEvent)

    ---------------------------------------

    local function gotoLove(event)
        if event.target.name == "zen" then 
            composer.setVariable("sendCount", zenCount)
            composer.setVariable("sendHogamdo",composer.getVariable("sendHogamdo"))
            composer.setVariable("number",0)
            composer.setVariable("result",-1)
            composer.gotoScene("story_zen")

        elseif event.target.name == "nabi" then
            if nabiCount == 1 then
                composer.gotoScene("nabi")
            else
                composer.gotoScene("nabi_random")
            end
        elseif event.target.name == "rose" then
            composer.setVariable("send_hogamdo", roseHogamdo)--호감도 보내기
            if roseCount == 1 then
                composer.gotoScene("roseFirst")
            else
                composer.gotoScene("roseScript")
            end
        end
    end

    ------------------------------------------
    
    zen:addEventListener("tap", gotoLove)
    nabi:addEventListener("tap", gotoLove)
    rose:addEventListener("tap", gotoLove)


    -----------------------------------------
    sceneGroup:insert(background)
    sceneGroup:insert(endingbtn)
    sceneGroup:insert(zen)
    sceneGroup:insert(nabi)
    sceneGroup:insert(rose)
    for i = 1, 3, 1 do
        sceneGroup:insert(heart[i])
    end
    sceneGroup:insert(nabiHogamdoBox)
    sceneGroup:insert(roseHogamdoBox)
    sceneGroup:insert(zenHogamdoBox)
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
		--composer.removeScene("map")
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