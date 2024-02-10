-----------------------------------------------------------------------------------------
--
-- story_zen.lua 
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	math.randomseed( os.time() )

	local widget = require("widget")

	local index
	local showText = {}
	local showChoice = {}
	local showName = {}
	local zen
	local characterUI = {}
	local dialogNum
	local lastIndex
	--local hogamdo = composer.getVariable("sendHogamdo")
	local clearOrNot = composer.getVariable("result")
	local gameNum = composer.getVariable("number")
	--호감도는 setVariable로 넘어다녀야 할 듯...나중에 구현
	local firstMeet = composer.getVariable("sendCount")--나중에 setVariable로 변경

	--[[if hogamdo == nil then
		hogamdo = 0
	end]]
	if clearOrNot == nil then
		clearOrNot = -1
	end
	if gameNum == nil then
		gameNum = 0
	end
	print(clearOrNot.."게임번호"..gameNum)
	local background = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	local school = display.newImageRect("img/building3.png", 400, 400)
	school.x, school.y = 150, 150


	local textBox = display.newImageRect("image/text.png", 720, 429)
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight-200

	--local nameTag = display.newImageRect("image/tag.png", 200, 70)
	--nameTag.x, nameTag.y = textBox.x-180, textBox.y-150

	local first = display.newText("(화살표 터치)", textBox.x, textBox.y, "Font/Maplestory Light.ttf")
	first.size = 50
	first:setFillColor(0)

	local showHogamdo = display.newText(zenHogamdo, display.contentWidth/2, 100, "Font/Maplestory Light.ttf")
	showHogamdo.size = 50
	showHogamdo:setFillColor(1)

	local black = display.newRect(display.contentWidth/2, display.contentHeight/2,display.contentWidth, display.contentHeight)
	black:setFillColor(0)
	black.alpha = 0

	local heart  = display.newImageRect("image/heart.png", 200, 200)
	heart.x, heart.y = showHogamdo.x, showHogamdo.y-20
	-----------------------------------------------------
	zen = display.newImageRect("image/zen_small.png", 450, 600)
	zen.x, zen.y = display.contentWidth/2+150, display.contentHeight/2-30

	yanggang = display.newImageRect("image/yanggang.png", 450, 600)
	yanggang.x, yanggang.y = display.contentWidth/2-150, display.contentHeight/2-30

	yanggang_angry = display.newImageRect("image/yanggang_angry.png", 450, 600)
	yanggang_angry.x, yanggang_angry.y = yanggang.x, yanggang.y
	yanggang_angry.alpha = 0

	yanggang_love = display.newImageRect("image/yanggang_love.png", 450, 600)
	yanggang_love.x, yanggang_love.y = yanggang.x, yanggang.y
	yanggang_love.alpha = 0

	------------------------------------------------------
	local name = {"양갱", "젠"}

	local choice = {"1.토하면서 자는거라면 죽는 게 더 우아하겠지?",
		"2.죽음은 결국 다 끝나는 거잖아. 살아있는 게 더 우아할 수밖에.",
		"1.당연하지",
		"2.왜 울상이야? 같이 가면 되잖아?",
		"1.난 네가 좋아.",
		"2.너 진짜 지루해",
		"1.인간성",
		"2.없음."
	}

	local text = {"1",	
		"현실에서 우연을 배제한 것이 픽션이다.",
		"우리가 만난 게 우연이 아니라면, 이 또한 픽션일 수도 있지 않을까?",
		"왠지 으스스한 소리네...",
		"5",
		"함정에 제일 처음 빠지는 사람은 그 함정을 만든 사람이다.",
		"악의는 항상 비참한 결말을 가져오곤 하지.",
		"나 오늘 참새 잡으려고 함정 만들고 왔는데...",
		"......고양이는 예외 아닐까?",
		"10",
		"하면 잘하는 아이는 안 하는 아이이다.",
		"나도 하면 한다는 고양이인데!",
		"그래서 하고 있어?",
		"아니!",
		"15",
		"한 번도 시합에서 이긴 적이 없다면 그것도 훌륭한 기록이다.",
		"그러니까 참새 못잡는다고 울지마...",
		"ㅠㅠㅠㅠㅠㅠㅠ",
		"19",
		"카레를 만들고 있을 때 소리를 내서는 안 된다.",
		"고양이가 제일 잘하는 짓이네!",
		"너 아까 나방잡을 때 엄청 시끄럽던데.",
		"조용히 해",
		"24",
		"질문을 당하기 전에 대답하면 말썽을 피할 수 있다.",
		"알았어! 츄르 먹은거 참새가 아니라 나 맞아.",
		"......",
		"28",
		"어두운 곳에서는 밝은 곳이 잘 보이지만 밝은 곳에서는 어두운 곳이 잘 보이지 않는다.",
		"지금 가로등 밑에 있다고 유세떠는거야?",
		"응.",
		"32",
		"숨이 계속되는 한 사람은 살아갈 수 있다.",
		"거기 고양이도 추가해줘.",
		"알겠어.",
		"36",
		"행복한 사람에게 행복이 모인다. 꽃에 모이는 나비처럼...",
		"그럼 나는 행복한 고양인가봐. 너라는 행복이 계속 찾아오니까 말이야.",
		"...",
		"부끄러워하는거야?",
		"시끄러",
		"42",
		"자신이 가지고 있는 이상과 다른 부분을 인정하는 것이 사랑이다.",
		"나는 너의 이상과 맞는 모습이야?",
		"아니. 근데 그런 너의 모습도 인정해.",
		"46",
		"일류를 좋아한다고 당당하게 말할 수 있는 사람은 일류이다.",
		"난 너 좋아!",
		"헷갈리게 말하지 마.",
		"50",
		"사람들은 아무리 노력한 인간이라도 천재라는 말로 단정 지으려 한대.",
		"혹시...그거 네 이야기야?",
		"나도 결국 하나씩 공부했다는 걸 모르는 고양이들이 많은 거 같아.",
		"그럼 앞으로 하나 말할 때마다 칭찬해줄게!",
		"그건 좀.",
		"56",
		"자는 것은 죽는 것보다 우아하다.",
		"너는 어떻게 생각해?",
		" ",
		"...뭐, 그건 맞는 말이지",
		"나도 그렇게 생각해",
		"62",
		"이별을 경험할 때마다 사람은 어른이 된다.",
		"젠도 곧 어른이 되겠네~",
		"...진짜 갈거야?",
		" ",
		"그럼 조금만 더 옆에 있어줘.",
		"......",
		"69",
		"이건 비밀인데...라고 말하는 순간 비밀이 아니다.",
		"이건 비밀인데...",
		" ",
		"......나도",
		"......나도 알아.",
		"75",
		"내가 읽는 소설에 수수께끼가 나오는데, 한 번 맞혀볼래?",
		"응.",
		"이것은 신보다 우월하고, 악마보다 나쁘다. 가난한 사람들에게는 이것이 있고 부자에게는 이것이 부족하다. 만약 사람이 이것을 먹으면 죽는다. 이것은 무엇일까?",
		" ",
		"땡!",
		"신보다 우월한 건 없고, 악마보다 나쁜 건 없지. 가난한 자는 없는 게 많으며 부자는 없는게 부족해.",
		"없는 걸 먹는다는 건 즉 못 먹는다는 말이니, 이걸 먹으면 죽겠지.",
		"그래도 좋은 시도였어. 다음엔 더 잘할 수 있을거야.",
		"맞아.",
		"신보다 우월한 건 없고, 악마보다 나쁜 건 없지. 가난한 자는 없는 게 많으며 부자는 없는게 부족해.",
		"없는 걸 먹는다는 건 즉 못 먹는다는 말이니, 이걸 먹으면 죽겠지.",
		"잘 하는데?",
		"88",
		"건물 근처를 의미 없이 걷다 보니 수풀 뒤에서 부스럭대는 소리가 들렸다.",
		"씨앗을 주워 먹으러 내려온 새일까?",
		"아니면 혹시... 쥐?",
		"기대감을 숨기지 못한 꼬리가 붕붕 흔들렸다.",
		"사냥하면 나 양갱이지. 최대한 기척을 줄이고 다가갔다.",
		"사냥감도 이쪽으로 오기 시작했다.",
		"조금만 더... 지금!",
		"다리에 힘을 주고 뛰쳐나간 곳에서 마주친 건 사냥감이 아닌 다른 고양이의 놀란 눈이었다.",
		"갑자기 마주친 다른 고양이의 모습에 꼬리가 제멋대로 부풀었다. 아, 기껏 단장해 놓은건데....",
		"지적인 모습을 풍기는 고양이 한 마리가 조심스럽게 내게 말을 걸었다.",
		"음...안녕?",
		"난 안녕 못해.",
		"놀라게 했다면 미안해. 그럴 생각은 아니었어",
		"넌 누구야?",
		"나는 \'젠\'이라고 해. 만나서 반가워.",
		"나도 반가워.",
		"\'젠\'은 아주 똑똑한 고양이었다. 고양이가 책을 어떻게 읽는지는 모르겠지만, 버려진 책장을 보금자리 삼아 책들을 쌓아두고 읽곤 했다.",
		"책이 많네.",
		"내가 지식욕이 많은 편이거든. 원하면 몇 권 빌려가도 돼.",
		"평범한 고양이는 책 같은 건 못 읽어...",
		"그래? 그러면 내가 읽어줄게! 항상 지식을 공유할 친구가 필요했는데 너라면 좋을 것 같아.",
		"첫 만남 기념이라고 여러 가지 지식도 얻었다.",
		"그러니까 인간들은 발톱을 못 숨긴단 말이지? 어떻게 그것도 못 하지? 나약하네.",
		"지식이라는 건 생각보다 재미있는 듯하다.",
		"젠은 이곳에 사는 듯하니 앞으로 여기 오면 볼 수 있을 것 같다.",
		"앞으로 여기 오면 젠이 읽는 책의 내용도 계속 들을 수 있을 듯하다.",
		"115",
		"어느날처럼 나비에게 일방적으로 말을 걸던 중, 벌레 한 무리가 나타났다.",
		"젠의 눈에 곤란한 기색이 비쳤다.",
		"벌레들이 책을 망치면 안되는데...",
		"걱정마. 내가 다 잡아줄게!",
		"120",
		"젠의 책에 실수로 인간에게 받아온 츄르를 쏟았다. 입으로 물어오는게 아니었는데!",
		"미안하다 했지만, 전적이 화려해서인지 내 말을 믿는 것 같지 않다.",
		"젠에게 미안한 마음을 어떻게 전해야 할까?",
		"124",
		"사냥 실력이 뛰어나네. 누구라도 반할 모습이야.",
		"이정도야 뭘! 언제던 말만 해!",
		"윽... 너무 많아...",
		"양갱이에게 벌레들은 많아도 너무 많았다.",
		"젠도 동감하는지 한숨을 내쉬더니 남은 벌레들을 하나씩 잡기 시작했다.",
		"뭐야, 너 생각보다 사냥 잘하잖아?",
		"...날 어떻게 보고 있던거야? 이건 고양이의 기본소양이라고.",
		"고양이의 기본 소양을 제대로 갖추지 못한 양갱은 딴청을 피우기 시작했다.",
		"멋진 춤을 보여줘서 고마워. 너의 진심이 와닿은 것 같아.",
		"내가 좀 잘 춰.",
		"젠의 화가 말끔하게 풀렸다!",
		"책에 다른 것도 흘렸던건 비밀로 해야겠다.",
		"......",
		"......",
		"음...수고했어...?",
		"어찌저찌 화는 풀린 것 같지만 더 어색해진 것 같다.",
		"141",
		"마음의 근시를 치료하고 싶다면 그 색안경을 벗으면 된다.",
		"너도 안경 벗는 게 어때?",
		"이건 색안경이 아니야.",
		"145"	,
		"바퀴벌레를 싫어하는 이유도, 강아지를 사랑하는 이유도 80%는 선입견이다.",
		"그래도 바퀴벌레는 싫은걸...",
		"왜? 안 좋은 경험이라도 있어?",
		"있어. 어떤 갈색 고양이가 머리만 잔뜩 모아둔 걸 봤거든.",
		"?",
		"151",
		"그거알아? 우리는 죽을 때까지 과거만 볼 수 있어. 우리 눈에 도달하는 빛은 우리가 보는 것들에게서 반사되어 도달한 거니까, 빛이 아무리 빨라도 그 사이에 사물은 변하잖아.",
		"(젠의 간식을 재빠르게 먹고 있다.)",
		"...그래도 네가 빛보다 빠를 순 없어.",
		"155",
		"자, 따라해봐.",
		"응!",
		"I가 무슨 뜻이지?",
		"나!",
		"그럼 \'can\'은?",
		"할 수 있다!",
		"\'see\'는?",
		"보다!",
		"이제 그 셋을 붙여봐.",
		"나는 할 수 있는가 보다!",
		"......",
		"167",
		"이어폰이라는게 뭐야?",
		"인간들이 귀에 꽂고 다니는 물건이야.",
		"그럼 핸드폰은 손에 꽂는거야?",
		"...?",
		"아이폰은 눈에 꽃는 거구나! 인간들은 꽃는 걸 참 좋아하네!",
		"173",
		"젠 나 큰일났어!",
		"왜?",
		"나 츄르 알레르기가 있었나봐...",
		"뭐?? 그동안 잘 먹고 다녔잖아.",
		"그니까. 왜 이러지...  어제 계속 먹고 토했어.",
		"얼마나 먹었는데?",
		"30개...?",
		"그 정도면 뭘 먹어도 토하겠다.",
		"182",
		"내가 이걸 읽을 수 있을까?",
		"너무 부담 가지지 말고, 못 읽는 부분이 있으면 넘겨. 알겠지?",
		"응!",
		"아니 다 넘기지는 말고...",
		"187",
		"젠 여기 \'louder\'이 무슨 뜻이야?",
		"더 크게.",
		"젠!! 여기 \'louder\'이!! 무슨 뜻이야!!!",
		"...",
		"192"
	}
					
	-----------------------------------------------------------
	for i = 1, 2, 1 do
		showName[i] = display.newText(name[i], textBox.x-200, textBox.y-160, "Font/Maplestory Light.ttf")
		showName[i]:setFillColor(0)
		showName[i].size = 50
		showName[i].alpha = 0
	end

	for i = 1, #choice, 1 do
		if i % 2 ~= 0 then 
			showChoice[i] = display.newText(choice[i], textBox.x, textBox.y-50, 600, 85, "Font/Maplestory Light.ttf")
		else
			showChoice[i] = display.newText(choice[i], textBox.x, textBox.y+30, 600, 85, "Font/Maplestory Light.ttf")
		end
		showChoice[i]:setFillColor(0)
		showChoice[i].alpha = 0
	end

	for i = 1, #text, 1 do
		showText[i] = display.newText(text[i], textBox.x, textBox.y, 600, 250, "Font/Maplestory Light.ttf")
	end
	-------------------------------------------------------
	for i = 1, #showText, 1 do
		showText[i].size = 40
		showText[i]:setFillColor(0)
		showText[i].alpha = 0
		if i == 78 or i == 81 or i == 85 or i == 121 then
			showText[i].size = 30
		end
	end

	calcZenMap()
	
	function randomNum()
		if dialogNum == 0 then
			index = 88
			lastIndex = 115
		elseif dialogNum == 1 then
			index = 1
			lastIndex = 5
		elseif dialogNum == 2 then
			index = 5
			lastIndex = 10
		elseif dialogNum == 3 then
			index = 10
			lastIndex = 15
		elseif dialogNum == 4 then
			index = 15
			lastIndex = 19
		elseif dialogNum == 5 then
			index = 19
			lastIndex = 24
		elseif dialogNum == 6 then
			index = 24
			lastIndex = 28
		elseif dialogNum == 7 then
			index = 28
			lastIndex = 32
		elseif dialogNum == 8 then
			index = 32
			lastIndex = 36
		elseif dialogNum == 9 then
			index = 36
			lastIndex = 42
		elseif dialogNum == 10 then
			index = 42
			lastIndex = 46
		elseif dialogNum == 11 then
			index = 46
			lastIndex = 50
		elseif dialogNum == 12 then
			index = 50
			lastIndex = 56
		elseif dialogNum == 13 then
			index = 56
			lastIndex = 62
		elseif dialogNum == 14 then
			index = 62
			lastIndex = 69
		elseif dialogNum == 15 then
			index = 69
			lastIndex = 75
		elseif dialogNum == 16 then
			index = 75
			lastIndex = 88
		elseif dialogNum == 17 then
			index = 115
			lastIndex = 120
		elseif dialogNum == 18 then
			index = 120
			lastIndex = 124
		elseif dialogNum == 19 then
			index = 141
			lastIndex = 145
		elseif dialogNum == 20 then
			index = 145
			lastIndex = 151
		elseif dialogNum == 21 then
			index = 151
			lastIndex = 155
		elseif dialogNum == 22 then
			index = 155
			lastIndex = 167
		elseif dialogNum == 23 then
			index = 167
			lastIndex = 173
		elseif dialogNum == 24 then
			index = 173
			lastIndex = 182
		elseif dialogNum == 25 then
			index = 182
			lastIndex = 187
		elseif dialogNum == 26 then
			index = 187
			lastIndex = 192
		end
	end

	function nameText ()
		if index == 4 or index == 8 or index == 12 or index == 14 or index == 18 or 
			index == 21 or index == 23 or index == 26 or index == 30 or index == 34 or
			index == 39 or index == 41 or index == 44 or index == 48 or index == 52 or
			index == 54 or index == 59 or index == 64 or index == 66 or index == 71 or
			index == 72 or index == 77 or index == 79 or (index >= 89 and index <= 98) or
			index == 100 or index == 102 or index == 104 or index == 105 or index == 106 or
			index == 108 or (index >= 110 and index <= 114) or index == 116 or index == 117 or
			index == 119 or index == 121 or index == 122 or index == 123 or index == 134 or
			index == 136 or index == 138 or index == 140 or index == 143 or index == 147 or
			index == 149 or index == 153 or (index >= 157 and index <= 165 and index % 2 == 1) or
			(index >= 168 and index <= 180 and index % 2 == 0) or index == 183 or index == 185 or
			index == 188 or index == 190 then
			showName[2].alpha = 0
			showName[1].alpha = 1

		elseif index == 2 or index == 3 or index == 6 or index == 7 or index == 9 or
			index == 11 or index == 13 or index == 16 or index == 17 or index == 20 or
			index == 22 or index == 25 or index == 27 or index == 29 or index == 31 or
			index == 33 or index == 35 or index == 37 or index == 38 or index == 40 or
			index == 43 or index == 45 or index == 47 or index == 49 or index == 51 or
			index == 53 or index == 55 or index == 57 or index == 58 or index == 60 or 
			index == 61 or index == 63 or index == 65 or index == 67 or index == 68 or 
			index == 70 or index == 73 or index == 74 or index == 76 or index == 78 or
			(index >= 80 and index <= 87) or index == 99 or index == 101 or index == 103 or
			index == 107 or index == 109 or index == 118 or index == 133 or index == 137 or
			index == 139 or (index >= 142 and index <= 166 and index % 2 == 0) or index == 169 or
			index == 171 or index == 175 or index == 177 or index == 179 or index == 181 or
			index == 184 or index == 186 or index == 189 or index == 191 then
			showName[1].alpha = 0
			showName[2].alpha = 1
		end
	end

	local answer = -1
	function choice (event)
		if index == 59 then
			if event.target.name == "1" then
				index = 59
				answer = 0
			elseif event.target.name == "2" then
				index = 60
				answer = 1
			end
			showText[index].alpha = 1
			showChoice[1].alpha = 0
			showChoice[2].alpha = 0
		elseif index == 66 then
			if event.target.name == "3" then
				index = 66
				answer = 0
			elseif event.target.name == "4" then
				index = 67
				answer = 1
			end
			showText[index].alpha = 1
			showChoice[3].alpha = 0
			showChoice[4].alpha = 0
		elseif index == 72 then
			if event.target.name == "5" then
				index = 72
				answer = 1
			elseif event.target.name == "6" then
				index = 73
				answer = 0
			end
			showText[index].alpha = 1
			showChoice[5].alpha = 0
			showChoice[6].alpha = 0			
		elseif index == 79 then
			if event.target.name == "7" then
				index = 79
				answer = 0
			elseif event.target.name == "8" then
				index = 83
				answer = 1
			end
			showText[index].alpha = 1
			showChoice[7].alpha = 0
			showChoice[8].alpha = 0	
		end

		local next2 = widget.newButton(
			{defaultFile = "image/next.png", overFile = "image/next.png",
			width = 100, height = 100, onPress = nextText}
		)
		next2.x, next2.y = display.contentWidth-100, display.contentHeight-100
		nextText()
	end

	function occurEvent()
		if index == 23 then
			yanggang.alpha = 0
			yanggang_angry.alpha = 1
		elseif index == 39 then
			yanggang.alpha = 0
			yanggang_love.alpha = 1
		elseif index == 41 then
			yanggang_love.alpha = 0
			yanggang_angry.alpha = 1
		elseif index == 89 then
			yanggang.alpha = 1
			yanggang.x, yanggang.y = display.contentWidth/2, display.contentHeight/2
		elseif index == 99 then
			transition.to(zen, {time = 500, alpha = 1})
			yanggang.x, yanggang.y = display.contentWidth/2-150, display.contentHeight/2-30
		elseif index == 100 then
			yanggang.alpha = 0
			yanggang_angry.alpha = 1
		elseif index == 102 then
			yanggang_angry.alpha = 0
			yanggang.alpha = 1
		end
	end

	function nextText (event)
		first.alpha = 0
		showText[index].alpha = 0
		index = index + 1
		showText[index].alpha = 1
		nameText()
		occurEvent()

		if index == 59 then---분기점
			event.target.alpha = 0
			showChoice[1].alpha = 1
			showChoice[1]:addEventListener("tap", choice)
			showChoice[1].name = "1"
			showChoice[2].alpha = 1
			showChoice[2]:addEventListener("tap", choice)
			showChoice[2].name = "2"
		elseif index == 66 then
			event.target.alpha = 0
			showChoice[3].alpha = 1
			showChoice[3]:addEventListener("tap", choice)
			showChoice[3].name = "3"
			showChoice[4].alpha = 1
			showChoice[4]:addEventListener("tap", choice)
			showChoice[4].name = "4"
		elseif index == 72 then
			event.target.alpha = 0
			showChoice[5].alpha = 1
			showChoice[5]:addEventListener("tap", choice)
			showChoice[5].name = "5"
			showChoice[6].alpha = 1
			showChoice[6]:addEventListener("tap", choice)
			showChoice[6].name = "6"
		elseif index == 79 then
			event.target.alpha = 0
			showChoice[7].alpha = 1
			showChoice[7]:addEventListener("tap", choice)
			showChoice[7].name = "7"
			showChoice[8].alpha = 1
			showChoice[8]:addEventListener("tap", choice)
			showChoice[8].name = "8"
		end
		if answer == 1 then
			if index == 61 or index == 68 or index == 73 or index == 84 then
				zenHogamdo = zenHogamdo + 10
				showHogamdo.text = " "
				showHogamdo.text = string.format("%d", zenHogamdo)
				calcZenMap()
			elseif index == 62 or index == 69 or index == 74 or index == 88 then--이동
				event.target.alpha = 0
				answer = nil
				print("보내는 호감도는"..zenHogamdo..",정답")
				calcZenMap()	
				--composer.setVariable("sendHogamdo",hogamdo)
				composer.gotoScene("map")
			end
		elseif answer == 0 then
			if index == 60 or index == 67 or index == 74 or index == 80 then
				zenHogamdo = zenHogamdo  - 3
				showHogamdo.text = " "
				showHogamdo.text = string.format("%d", zenHogamdo)
			elseif index == 61 or index == 68 or index == 75 or index == 84 then--이동
				event.target.alpha = 0
				answer = nil
				print("보내는 호감도는"..zenHogamdo..",오댭")
				calcZenMap()
				--composer.setVariable("sendHogamdo",hogamdo)
				composer.gotoScene("map")
			end
		end
		if index == lastIndex then
			showText[index].alpha = 0
			event.target.alpha = 0
			if index  == 42 or index == 46 or index == 50 or index == 56 then
				zenHogamdo = zenHogamdo + 10
				print("보내는 호감도는"..zenHogamdo..",확정+10")
				showHogamdo.text = " "
				showHogamdo.text = string.format("%d", zenHogamdo)
				calcZenMap()
				--composer.setVariable("sendHogamdo",hogamdo)
				composer.gotoScene("map")
			elseif index  == 5 or index == 10 or index == 15 or index == 19 or
					index  == 24 or index == 28 or index == 32 or index == 36 or 
					index == 137 or index == 141 or index == 145 or index == 151 or index == 155 or 
					index == 167 or index == 173 or index == 182 or index == 187 or index == 192 then
				print("보내는 호감도는"..zenHogamdo..",일반스크립트")
				calcZenMap()
				--composer.setVariable("sendHogamdo",hogamdo)
				composer.gotoScene("map")
			elseif index == 120 then--벌레게임
				calcZenMap()
				--composer.setVariable("sendHogamdo", hogamdo)
				composer.gotoScene("view1")
			elseif index == 124 then--미니게임(춤)
				calcZenMap()
				--composer.setVariable("sendHogamdo", hogamdo)
				composer.gotoScene("dance")
			elseif index == 115 then
				calcZenCount()
				composer.gotoScene("map")
			end
		end
		if index == 125 or index == 133 then
			zenHogamdo = zenHogamdo + 10
			showHogamdo.text = " "
			showHogamdo.text = string.format("%d", zenHogamdo)
		end
	end

	local next = widget.newButton(
		{defaultFile = "image/next.png", overFile = "image/next.png",
		width = 100, height = 100, onPress = nextText}
	)
	next.x, next.y = display.contentWidth-100, display.contentHeight-100

-------------------------------------------------------------------
	if (firstMeet == 1) then
		dialogNum = 0
		zen.alpha = 0
		yanggang.alpha = 0
	elseif gameNum == 2 then---춤추기
		if clearOrNot == 1 then--클리어
			index = 132
			lastIndex = 137
		else
			index = 136
			lastIndex = 141
		end
		gameNum = 0
		clearOrNot = -1
	else
		--setVariable변수가 1이 아닐때 동작(최초가 아닐때)
		dialogNum = math.random(1, 26)
		print(dialogNum)
	end
	randomNum()

	sceneGroup:insert(background)
	sceneGroup:insert(school)
	sceneGroup:insert(zen)
	sceneGroup:insert(yanggang)
	sceneGroup:insert(yanggang_angry)
	sceneGroup:insert(heart)
	sceneGroup:insert(showHogamdo)
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
		composer.removeScene("story_zen")
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
