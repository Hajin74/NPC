-----------------------------------------------------------------------------------------
--
-- nabi_random.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--- 랜덤함수 초기화 ---
math.randomseed(os.time())

--- GUI ---
local background = {} -- 배경, 말풍선, 하트
local char = {} -- 양갱, 나비, 벌레떼, 선물, 바퀴벌레
local arrow
local textBox
local nameBox
local checkBox = {}
local hogamdoBox





--- 변수 ---

local num = math.random(1,6) -- 랜덤한 스크립트
local index = 1


print(num.."번째 스크립트")
print("대사 순서: ".. index)


function scene:create( event )
	local sceneGroup = self.view
	
    background[1] = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
    background[1].x, background[1].y = display.contentWidth/2, display.contentHeight/2
    background[2] = display.newImageRect("img/bubble.png", display.contentWidth, 430)
    background[2].x, background[2].y = display.contentWidth/2, display.contentHeight - 215
    background[3] = display.newImageRect("img/heart.png", 120, 100)
    background[3].x, background[3].y = display.contentWidth/2, 100


    char[1] = display.newImageRect("img/yang.png", 200, 300)
    char[1].x, char[1].y = display.contentWidth/2 - 100, display.contentHeight/2
    char[2] = display.newImageRect("img/nabi.png", 200, 300)
    char[2].x, char[2].y = display.contentWidth/2 + 100, display.contentHeight/2
    char[3] = display.newImageRect("img/bug.png", 300, 200)
    char[3].x, char[3].y = display.contentWidth, 50
    char[4] = display.newImageRect("img/giftbox.png", 200, 200)
    char[4].x, char[4].y = display.contentWidth/2, display.contentHeight/2 + 100
    char[5] = display.newImageRect("img/cockroach.png", 200, 200)
    char[5].x, char[5].y = display.contentWidth/2, display.contentHeight/2 + 100
    for i = 1, 5, 1 do char[i].alpha = 0 end

    arrow = display.newImageRect("img/arrow.png", 70, 50)
    arrow.x, arrow.y = display.contentWidth/2 + 300, display.contentHeight - 50

    textBox = display.newText("", display.contentWidth/2, 1060, 600, 150, "Font/Maplestory Light.ttf")
    textBox.size = 40
    textBox:setFillColor(0)

    nameBox = display.newText("", 100, 900, "Font/Maplestory Light.ttf")
    nameBox.size = 40
    nameBox:setFillColor(0)

    checkBox[1] = display.newText("1번", display.contentWidth/2, 1050, 600, 150, "Font/Maplestory Light.ttf")
    checkBox[1].size = 40
    checkBox[1]:setFillColor(0)
    checkBox[2] = display.newText("2번", display.contentWidth/2, 1150, 600, 150, "Font/Maplestory Light.ttf")
    checkBox[2].size = 40
    checkBox[2]:setFillColor(0)
    for i = 1, 2, 1 do 
        checkBox[i].alpha = 0 
        checkBox[i].name = i
    end

    hogamdoBox = display.newText("0", display.contentWidth/2, 105, "Font/Maplestory Light.ttf")
    hogamdoBox.size = 50
    hogamdoBox:setFillColor(1)

    -- 대사 모음 ----------------------------------------------------------------------------

    local script1 = {
        "나비는 아직도 나한테 틱틱댄다.",
        "특별한 사이가 되고 싶다는 내 마음이 아직도 제대로 전달되지 않은 걸까....?",
        "터치하여 게임 시작을 시작하세요."
    }

    local script2 = {
        "어느날처럼 나비에게 일방적으로 말을 걸던 중 벌레 한 무리가 나타났다.",
        "이게 뭐야!?",
        "걱정마. 내가 다 잡아줄게.",
        "터치하여 게임 시작을 시작하세요."
    }

    local script3 = {
        "이러쿵 저러쿵 블라블라블라...",
        "언제나 그렇듯 나비는 아무 말도 없었다.",
        "넌 어떻게 한 마디를 안해?",
        "정말이지 보면 볼수록 신경쓰이는 고양이였다.",
        "아무 말 없는 자신 옆에 와서 조잘대는 모습도, 매번 참새에게 당해서 화내면서도 포기하지 않는 모습도.",
        "전부 평범한 것들 뿐인데.",
        "언제부터 이렇게 눈이 갔는지.",
        "어쩌다 이렇게 너에게 빠져들었는지.",
        "으악 내 손..."
    }

    local script4 = {
        "바람이 둥글게 불어오고 있었다.\n평화로운 오후였다.",
        "따사로운 바람은 두 고양이들의 마음을 풀어지게 하기 충분했다.",
        "돌도 적당하게 달궈져누워 있기 좋아 보였다.",
        "양갱이는 약간 남아있던 경계마저도 풀고 바위 위에 철퍼덕 누웠다.",
        "나비도 양갱이를 보더니 슬쩍 편한 자세로 고쳐 앉았다.",
        "나비는 언제나처럼 무심하게 양갱이를 내려다 보았다.",
        "다른 고양이들은 말 없는 나비를 어려워했지만, 양갱이는 나비가 좋았다.",
        "가끔은 아무 말 없는 모습이 짜증나기도 했지만, 나비는 양갱이의 속마음을 털어놓기 좋은 상대였다.",
        "말 없이도 편하다는 게 이런 건가.",
        "둥실둥실 떠다니는 구름을 눈으로 쫓다 보니 점점 눈이 감겨 왔다.",
        "이내 바위 위에는 고른 숨소리만 들리기 시작했다.",
        "나비는 꾸벅꾸벅 조는 양갱이를 보며 옅게 미소지었다.",
        "햇살이 온 세상을 따뜻하게 비추고 있었다."
    }

    local script5 = {
        "나비에게 찾아가니 나비가 나뭇잎으로 감싼 무언가를 양갱이 앞에 놓았다.",
        "내용물이 컸는지 거의 나비의 몸집만했다.",
        "아까 안 보이더니 사냥을 다녀왔나보네.",
        "....이거 먹어.",
        "고마워! 고생 많이 했겠다.", -- 5: 호감도 +10

        "쉽게 잡을 수 있는 애들은 안 먹는거 알고 있지?", -- 6: 호감도 없음
        "나비는 고개를 끄덕였다.",
        "저러는 걸 보면 꽤 어려운 상대였나본데.",
        "양갱이는 무언가를 잡을 일이 많이 없었다.",
        "평소에 인간들이 밥을 챙겨 줬기 때문이다.",

        "그래서인지 다른 고양이들이 손쉽게 잡는 참새에게도 쩔쩔매곤 했다.",
        "그렇기에 나비가 이렇게까지 자신만만하게 준 것의 정체가 궁금했다.",
        "까치를 잡아온건가?\n고양이랑 몸집이 비슷해 잡기 엄청 어려웠을 텐데.",
        "크기가 꽤 커보이네.",
        "발로 나뭇잎을 툭툭 차자 걷어내자, 토막난 바퀴벌레들의 머리가 보였다.",

        "더듬이와 날개들도 이리저리 흩어져 있었다.",
        "양갱이의 털이 곤두섰다.",
        "으악! 으악!! 으악!!!!",
        "양갱이는 수많은 바퀴벌레들의 머리를 향해 냥냥펀치를 날렸다.",
        "그렇게 나비의 수고는 바위 밑으로 떨어졌다.",

        "양갱은 뒤도 돌아보지 않고 도망갔다.",
        "맛있는 부분만 남겨 놓았던 건데...",
        "나비는 시무룩해졌다."
    }

    local script6 = {
        "(양갱이를 위해 정성스럽게 선물을 준비한다.)",
        "(줄까말까 고민하던 중 양갱이의 인기척이 들려 황급히 선물을 몸으로 숨긴다.)",
        "(벌써 이게 몇 번째 다짐인건지. 나비는 마음이 조급했다.)",
        "아...이런.\n역시 이건 못 주겠어.",
        "한심하긴.\n도대체 같은 짓을 몇 번이나 반복하고 있는 거야!",

        "이러다 갑자기 양갱이가 오기라도 하면...",
        "나 이미 왔는데?",
        "?!",
        "놀란 나비는 간식을 향해 냥냥펀치를 날렸다.",
        "죄 없는 간식들은 알알이 흩어졌다.",
        "아, 방금 그 간식탑은 역대급으로 멋졌는데!",

        "또 그 고양이를 위한 선물을 준비하는거야?",  -- 12: 호감도
        "넌 왜 매번 그 멋진 것들을 다 부숴먹고 있어?",
        
        "..그 고양이?", -- 14: success
        "매번 그것만 만들고 있잖아.",
        "아...", -- 16 -> 20

        ".....", -- 17: fail
        "말이 없는 나비를 보니 화가 난 건지 얼굴이 살짝 붉어져 있었다.",
        "쩝, 너무 참견했나.\n나름 사정이 있어 보이는데.",

        "양갱이는 말이 없는 나비를 보다가 고개를 돌려 간식을 보았다.", -- 20: 공통
        "나비는 한 번 망친 건 다 버리던데, 그러면 저건 내가 먹어도 되겠지?",
        "그걸 왜 먹어?",
        "더러운 거 안 묻어서 다행이다.\n부서진 것도 맛있네.",
        "남의 간식을 함부로 먹다니.",
        "어차피 버릴 건데 나 주면 어디가 덧나나.",

        "다음에는 그 고양이에게 선물이 가길 바라.", -- 26: suceess
        "걱정마. 나 입 무거운거 알잖아!\n아직 10마리밖에 말 안 했어!", --27: fail

        "(아직 내 마음은 들키지 않은건가.\n양갱이가 눈치가 빠른 편이 아니라 다행이다.)", -- 28: success
        "..응, 고마워.",

        "(10마리면 적어도 이 학교의 고양이들은 다 알고 있는건가...)", -- 30: fail
        "나비는 입 밖으로 나오려는 말을애써 눌렀다."
    }

    -- 호감도 저장
    function calcNabi()
        hogamdoBox.text = string.format("%d", nabiHogamdo)
    end
    calcNabi()

    -- 선택지 고르기 ----------------------------------------------------------------------------

    local function selectScript()
        if num == 5 then
            for i = 1, 2, 1 do checkBox[i].alpha = 1 end
            checkBox[1].text = "1: "..script5[index]
            checkBox[2].text = "2: "..script5[index+1]
        elseif num == 6 then
            if index == 12 then
                for i = 1, 2, 1 do checkBox[i].alpha = 1 end
                checkBox[1].text = "1: "..script6[index]
                checkBox[2].text = "2: "..script6[index+1]
            elseif index == 26 then
                for i = 1, 2, 1 do checkBox[i].alpha = 1 end
                checkBox[1].text = "1: "..script6[index]
                checkBox[2].text = "2: "..script6[index+1]
            end
        end
    end

    -- 게임하러 이동 ----------------------------------------------------------------------------

    local function gotoGame()
        print("게임하러 이동")
        
        textBox.alpha = 0

        if num == 1 then
            print("구애의 춤 게임하기")
            composer.gotoScene("dance")
        elseif num == 2 then
            print("벌레잡기 게임하기")
            composer.gotoScene("view1")
        end
    end

    -- 대사 ----------------------------------------------------------------------------

    local function closeScript()
        textBox.alpha = 0
    end

    local function showScript()
        closeScript()
		print(index.."번째 script 대사")

		textBox = display.newText("", display.contentWidth/2, 1060, 600, 150, "Font/Maplestory Light.ttf")
		textBox.size = 40
		textBox:setFillColor(0)

        if num == 1 then
            textBox.text = script1[index]
            if index == 3 then
                arrow.alpha = 0
                textBox:addEventListener("tap", gotoGame) -- 게임하러 이동
            end
        elseif num == 2 then
            textBox.text = script2[index]
            if index == 4 then
                arrow.alpha = 0
                textBox:addEventListener("tap", gotoGame) -- 게임하러 이동
            end
        elseif num == 3 then
            textBox.text = script3[index]
        elseif num == 4 then
            textBox.text = script4[index]
        elseif num == 5 then
            if index == 5 then
                arrow.alpha = 0
                selectScript()
            else
                textBox.text = script5[index]
            end
        elseif num == 6 then
            if index == 12 then
                arrow.alpha = 0
                selectScript()
            elseif index == 16 then
                textBox.text = script6[index]
                --index = 20
            elseif index == 26 then
                arrow.alpha = 0
                selectScript()
            elseif index == 29 then
                textBox.text = script6[index]
                index = 32
            else
                textBox.text = script6[index]
            end
        end
	end

    -- 대사 주인공 ----------------------------------------------------------------------------

    local function closeName()
        nameBox.alpha = 0
    end

    local function showName()
        print("대사 결정 함수, 인덱스 : ".. index)

        if num == 1 then
            if (index == 1 or index == 2) then
                nameBox.text = "양갱"
            else
                closeName()
            end

        elseif num == 2 then
            if (index == 1 or index == 3) then
                nameBox.text = "양갱"
            elseif index == 2 then
                nameBox.text = "나비"
            else
                closeName()
            end

        elseif num == 3 then
            if index >= 1 and index <= 3 then
                nameBox.text = "양갱"
            elseif index >= 4 and index <= 9 then
                nameBox.text = "나비"
            else
                closeName()
            end

        elseif num == 4 then
            nameBox.alpha = 0
        
        elseif num == 5 then
            if (index == 1 or index == 2 or index == 9 or index == 10 or index == 11 or index == 12 or index == 15
                or index == 16 or index == 17 or index == 19 or index == 20 or index == 21 or index == 23) then
                nameBox.text = ""
            elseif (index == 3 or index == 5 or index == 6 or index == 8 or index == 13 or index == 14 or index == 18) then
                nameBox.text = "양갱"
            elseif (index == 4 or index == 7 or index == 22) then
                nameBox.text = "나비"
            end
        
        elseif num == 6 then
            if (index == 1 or index == 2 or index == 3 or index == 4 or index == 5 or index == 6 or index == 8 or
                index == 14 or index == 16 or index == 17 or index == 22 or index == 24 or index == 28 or index == 29 or index == 30 or index == 32) then
                nameBox.text = "나비"
            elseif (index == 7 or index == 11 or index == 12 or index == 13 or index == 15 or index == 19 or index == 21 or
                    index == 23 or index == 25 or index == 26 or index == 27) then
                    nameBox.text = "양갱"
            elseif (index == 9 or index == 10 or index == 18 or index == 20 or index == 31 ) then
                    nameBox.text = ""
            end
        end

    end

    -- 등장인물 ----------------------------------------------------------------------------

    local function closeChar()
        for i = 1, 5, 1 do char[i].alpha = 0 end
    end

    local function showChar()
        if num == 1 then
            if index == 1 then
                for i = 1, 2, 1 do 
                    transition.to(char[i], {time = 500, alpha = 1})
                end
                transition.to(char[1], {time = 500, width = 250, height = 350})
            elseif index == 2 or index == 3 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
            end
        
        elseif num == 2 then
            if index == 1 then
                for i = 1, 2, 1 do 
                    transition.to(char[i], {time = 500, alpha = 1})
                end
                transition.to(char[3], {time = 1000, alpha = 1, x = 500, y = 300})
            elseif index == 2 then
                for i = 1, 3, 1 do char[i].alpha = 1 end
                transition.to(char[2], {time = 500, width = 250, height = 350})
            elseif index == 3 then
                for i = 1, 3, 1 do char[i].alpha = 1 end
                transition.to(char[1], {time = 500, width = 260, height = 360})
            elseif index == 4 then
                for i = 1, 3, 1 do char[i].alpha = 1 end
            end

        elseif num == 3 then
            if index == 1 then
                for i = 1, 2, 1 do transition.to(char[i], {time = 500, alpha = 1}) end
            elseif index == 2 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
            elseif index == 3 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                transition.to(char[1], {time = 500, width = 250, height = 350})
            elseif index == 4 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                transition.to(char[1], {time = 500, width = 200, height = 300})
                transition.to(char[2], {time = 500, width = 250, height = 350})
            elseif index >= 5 and index <= 10 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
            end
        
        elseif num == 4 then
            if index == 1 then
                for i = 1, 2, 1 do transition.to(char[i], {time = 500, alpha = 1}) end
            else
                for i = 1, 2, 1 do char[i].alpha = 1 end
            end
        
        elseif num == 5 then
            if index == 1 then
                for i = 1, 2, 1 do transition.to(char[i], {time = 500, alpha = 1}) end
                transition.to(char[4], {delay = 1000, time = 500, alpha = 1})
            elseif index >= 2 and index <= 14 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
            elseif index == 15 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                transition.to(char[5], {delay = 500, time = 500, alpha = 1})
            elseif index == 16 or index == 17 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[5].alpha = 1
            elseif index == 18 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[5].alpha = 1
                transition.to(char[1], {time = 500, width = 220, height = 320})
            elseif index == 19 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[5].alpha = 1
            elseif index == 20 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[5].alpha = 1
                transition.to(char[5], {time = 500, alpha = 0, x = 0, y = display.contentHeight})
            elseif index == 21 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                transition.to(char[1], {time = 500, alpha = 0, x = 0, y = 0})
            else
                char[2].alpha = 1
            end
        
        elseif num == 6 then
            if index == 1 then
                transition.to(char[2], {time = 500, alpha = 1})
                transition.to(char[4], {time = 500, alpha = 1})
            elseif index == 2 then
                char[2].alpha = 1
                char[4].alpha = 1
                char[1].alpha = 1
                char[1].x, char[1].y = display.contentWidth, 0
                transition.to(char[1], {time = 1500, x = display.contentWidth/2 + 100, y = display.contentHeight/2 - 200})
                transition.to(char[4], {dealy = 1500, time = 500, x = display.contentWidth/2 + 200 })
            elseif index >= 3 and index <= 6 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
            elseif index == 7 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
                transition.to(char[1], {time = 500, x = display.contentWidth/2 - 100, y = display.contentHeight/2})
            elseif index == 8 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
            elseif index == 9 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
                transition.to(char[4], {time = 500, x = display.contentWidth/2, y = display.contentHeight/2 - 250})
            elseif index >= 10 and index <= 12 then
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
            else
                for i = 1, 2, 1 do char[i].alpha = 1 end
                char[4].alpha = 1
            end
        end
    end

    -- 호감도 계산 ----------------------------------------------------------------------------

    local function calcHogamdo(event)
        print("호감도 계산")

        if num == 5 then
            if event.target.name == 1 then
                print("호감도 올라가기")
                nabiHogamdo = nabiHogamdo + 10
                hogamdoBox.text = string.format("%d", nabiHogamdo)
            elseif event.target.name == 2 then
                print("호감도 변화없음")
            end
            index = index + 2

        elseif num == 6 then
            if index == 12 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    nabiHogamdo = nabiHogamdo + 10
                    hogamdoBox.text = string.format("%d", nabiHogamdo)
                    print("나비호감도: "..nabiHogamdo)
                    index = index + 2
                elseif event.target.name == 2 then
                    print("호감도 변화없음")
                    index = 17
                end
            elseif index == 26 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    nabiHogamdo = nabiHogamdo + 10
                    hogamdoBox.text = string.format("%d", nabiHogamdo)
                    print("나비호감도: "..nabiHogamdo)
                    index = index + 2
                elseif event.target.name == 2 then
                    print("호감도 변화없음")
                    index = 30
                end
            end

        end
        
        for i = 1, 2, 1 do checkBox[i].alpha = 0 end
        arrow.alpha = 1
        showScript()
        showName()
        showChar()
        calcNabiMap()
    end

    -- 메인 홀: 맵 으로 이동 ----------------------------------------------------------------------------

    local function gotoMap()
        if num == 3 then
            composer.gotoScene("map")
        elseif num == 4 then
            composer.gotoScene("map")
        elseif num == 5 then
            composer.gotoScene("map")
        elseif num == 5 then
            composer.gotoScene("map")
        elseif num ==6 then
            composer.gotoScene("map")
        end
    end

    -- 다음 대사 버튼 > ----------------------------------------------------------------------------

    local function nextEvent()
        closeScript()
        --closeName()
        closeChar()

        index = index + 1
        
        if num == 3 and index == 10 then
            gotoMap()
        elseif num == 4 and index == 14 then
            gotoMap()
        elseif num == 5 and index == 24 then
            gotoMap()
        elseif num == 6 and index >= 32 then
            gotoMap()
        elseif num == 6 and index == 17 then
            index = 20
        end

        showScript()
        showName()
        showChar()
    end

    -- 초기화 ----------------------------------------------------------------------------

    showScript()
    showName()
    showChar()

    -- 이벤트 등록 ----------------------------------------------------------------------------

    arrow:addEventListener("tap", nextEvent)
    for i = 1, 2, 1 do checkBox[i]:addEventListener("tap", calcHogamdo) end

    -- 씬 삽입 ----------------------------------------------------------------------------
    for i = 1, 3, 1 do sceneGroup:insert(background[i]) end
    sceneGroup:insert(hogamdoBox)
    for i = 1, 5, 1 do sceneGroup:insert(char[i]) end
    sceneGroup:insert(arrow)
    sceneGroup:insert(textBox)
    sceneGroup:insert(nameBox)
    for i = 1, 2, 1 do sceneGroup:insert(checkBox[i]) end
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
		
	elseif phase == "did" then
		-- Called when the scene is now off screen
        composer.removeScene("nabi_random")
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