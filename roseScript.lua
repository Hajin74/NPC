local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local randomNum
--local hogamdo = 0
local hogamdoBox--호감도

--local send_hogamdo = composer.getVariable("send_hogamdo")
--hogamdo.text = send_hogamdo.text
function scene:create( event )
	local sceneGroup = self.view
	math.randomseed(os.time())
	
	local index = 1

	local background = display.newImageRect("img/road.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local school = display.newImageRect("img/building2.png", 400, 400)
	school.x, school.y = 150, 150

	local image = {}
	image[1] = display.newImageRect("image/yanggeng.png",400, 500)--양갱
	image[2] = display.newImageRect("image/map.png", 720, 1280)--맵
	image[3] = display.newImageRect("image/yangAngry.png", 400, 500)--훼이
	image[4] = display.newImageRect("image/rose.png", 400, 500)--로즈

	for i=1, 4, 1 do
		image[i].x, image[i].y = display.contentWidth/2, display.contentHeight/2
		image[i].alpha = 0
	end
	image[1].x, image[1].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	image[1].alpha = 1 image[4].alpha = 1
	image[3].x, image[3].y = display.contentWidth/2 + 200, display.contentHeight/2 + 80
	image[4].x, image[4].y = display.contentWidth/2-50, display.contentHeight/2 + 80

	local textBox = display.newImageRect("image/text.png",display.contentWidth, 429)--텍스트 배경 박스
	textBox.x, textBox.y = display.contentWidth/2, display.contentHeight/2+460

	local nextButton = display.newImageRect("image/right.png", 100, 100)
	nextButton.x, nextButton.y = 650, 1230

	local heart = display.newImageRect("image/heart.png", 100, 100)
	heart.x, heart.y = display.contentWidth/2, 80

	local cat = {}
	cat[0] =  display.newText("???", 90, 1000, "Font/Maplestory Light.ttf")
	cat[1] =  display.newText("양갱", 90, 1000, "Font/Maplestory Light.ttf")
	cat[2] =  display.newText("젠", 90, 1000, "Font/Maplestory Light.ttf")
	cat[3] =  display.newText("나비", 90, 1000, "Font/Maplestory Light.ttf")
	cat[4] =  display.newText("로즈", 90, 1000, "Font/Maplestory Light.ttf")
	cat[5] =  display.newText("훼이", 90, 1000, "Font/Maplestory Light.ttf")
	for i=0, 5, 1 do
		cat[i].alpha = 0
		cat[i].size = 40
		cat[i]:setFillColor(0)
		cat[i].x, cat[i].y = 140, 935
	end

	local text = {}
	for i=1, 8, 1 do
		text[i] = {}
	end
	--***행간 크기 5
	----> 폰트 사이즈 + 행간(5) = y좌표 차이값(이만큼 씩 다음줄 y값에 더해주기)
	--***("텍스트 내용", x좌표(통일), y좌표(다음줄은 + y좌표 차이값(45), 너비(통일 시켜야 왼쪽 줄맞춤 가능), 높이(2줄 기준 85로 통일함))
----------------------------------------------------------------------------------------------------------------
----1번 스크립트-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------	
text[1][1] = display.newText("로즈와 즐겁게 이야기를 하고 있던 도중, 벌레 한 무리가 나타났다.", textBox.x, textBox.y - 50, 600, 85, "Font/Maplestory Light.ttf")
text[1][2] = display.newText("으악!벌레!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[1][3] = display.newText("걱정마. 내가 다 잡아줄게!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--[[성공
text[1][4] = display.newText("와 벌레를 잡아줘서 정말 고마워! 정말 멋있어!", textBox.x, textBox.y- 50, 600, 85)
text[1][5] = display.newText("이정도야 뭘! 언제던 말만 해!", textBox.x, textBox.y- 50, 600, 85)
--실패
text[1][6] = display.newText("윽...너무 많아...", textBox.x, textBox.y- 50, 600, 85)
text[1][7] = display.newText("내가 벌레들에게 쩔쩔매는 것을 보며 로즈가 고개를 푹 숙였다.", textBox.x, textBox.y- 50, 600, 85)
text[1][8] = display.newText("앗...겁에 질렸나봐.", textBox.x, textBox.y- 50, 600, 85)
text[1][9] = display.newText("로즈를 안심시켜주기 위해 입을 열려는 순간, 로즈가 품 속에서 장미가 그려진 칼 한 자루를 꺼냈다.", textBox.x, textBox.y- 50, 600, 85)
text[1][10] = display.newText("????????", textBox.x, textBox.y- 50, 600, 85)
text[1][11] = display.newText("나에게 달라붙어있던 벌레들이 순식간에 가루가 되어 떨어졌다.", textBox.x, textBox.y- 50, 600, 85)
text[1][12] = display.newText("와! 벌레를 잡아줘서 정말 고마워!", textBox.x, textBox.y- 50, 600, 85)
text[1][13] = display.newText("아니, 벌레는 내가 아니라 방금 네가..", textBox.x, textBox.y- 50, 600, 85)
text[1][14] = display.newText("잘못 본 거겠지!", textBox.x, textBox.y- 50, 600, 85)
text[1][15] = display.newText("아니 네가...", textBox.x, textBox.y- 50, 600, 85)
text[1][16] = display.newText("(무서운 표정으로) 잘못 봤어.", textBox.x, textBox.y- 50, 600, 85)--무서운 표정 이미지 넣으면 지문 삭제
text[1][17] = display.newText("맞아. 내가 잘못 본 거 같아 하하", textBox.x, textBox.y- 50, 600, 85)]]
---------------------------------------------------------------------------------------------------------------
----2번 스크립트--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
text[2][1] = display.newText("로즈는 무료했는지 내가 불러도 움직이지 않고 꼬리만 슬쩍 흔들어 주었다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[2][2] = display.newText("무료한 날이 반복돼서인지 우울해 보이기도 했다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[2][3] = display.newText("반복되는 일상이 지루한 로즈를 위해 멋진 춤을 춰주고 싶어!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--[[성공
text[2][4] = display.newText("로즈는 양갱이가 춤을 추는 모습을 흥미롭게 보았다.", textBox.x, textBox.y- 50, 600, 85)
text[2][5] = display.newText("끝만 살랑거리던 꼬리는 점점 흥미를 가지고 움직이기 시작했다. ", textBox.x, textBox.y- 50, 600, 85)
text[2][6] = display.newText("이내 기분이 좋아진 로즈는 나와 같이 춤을 추기 시작했다.", textBox.x, textBox.y- 50, 600, 85)
text[2][7] = display.newText("로즈가 즐거워 보여서 양갱이의 기분도 덩달아 좋아졌다.", textBox.x, textBox.y- 50, 600, 85)
--실패
text[2][8] = display.newText("로즈는 내가 춤을 추는 모습을 보다 말았다.", textBox.x, textBox.y- 50, 600, 85)
text[2][9] = display.newText("흥미를 가지기 시작한 꼬리는 다시 끝만 살랑이기 시작했다.", textBox.x, textBox.y- 50, 600, 85)
text[2][10] = display.newText("다시 무료해진 로즈는 아예 돌아누워 버렸다.", textBox.x, textBox.y- 50, 600, 85)
text[2][11] = display.newText("양갱이는 우울해졌다.", textBox.x, textBox.y- 50, 600, 85)]]
---------------------------------------------------------------------------------------------------------------
----3번 스크립트-------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
text[3][1] = display.newText("로즈, 옆에 있는 가방에는 뭐가 들어있어?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][2] = display.newText("응, 내 이름을 짓게 된 계기가 되어준 물건이 들어있어.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][3] = display.newText("네 이름도 인간들이 지어준 거구나.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][4] = display.newText("아냐, 내 이름은 다른 고양이들이 지어준거야!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][5] = display.newText("역시, 다른 고양이들도 로즈의 귀여움을 알아봤나보네.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][6] = display.newText("응?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][7] = display.newText("      어....?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][8] = display.newText("                그런 셈이지..?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][9] = display.newText("로즈는 이상하게 말을 흐렸다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][10] = display.newText("\'내가 틀린 말을 한걸까?\'", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][11] = display.newText("그래서 가방에 들어있는 건 뭐야?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][12] = display.newText("그게 알고 싶은 거야?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][13] = display.newText("응! 네가 그걸 들고 있는 걸 보고 싶어!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][14] = display.newText("내가 저걸 드는 걸 보고 싶다고?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][15] = display.newText("로즈는 생각만 해도 기쁘다는 듯 행복하게 웃었다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][16] = display.newText("그런데 이상하다. 장미꽃은 설탕같은 로즈에게 정말로 잘 어울릴텐데,", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][17] = display.newText("왜 고양이의 본능은 여기서 도망치라 하는거지?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][18] = display.newText("부담스럽게 반짝이는 로즈의 눈을 피해 시선을 내리니 가방이 보였다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][19] = display.newText("가방 밖에는 장미가 수놓아진 무언가의 손잡이가 슬쩍 나와있었다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][20] = display.newText("정말 내가 저걸 사용했으면 좋겠어?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1
text[3][21] = display.newText("음... 생각해보니 몰라도 될 것 같아.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][22] = display.newText("그래, 알겠어...", textBox.x, textBox.y- 50, 600, 85)
text[3][23] = display.newText("로즈는 실망한 기색이었다. 양갱이는 양심의 가책을 느꼈다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][24] = display.newText("그러고 보니 인간들이 보던 상자에서 장미칼이라는게 자주 보였던 거 같은데...", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][25] = display.newText("양갱이는 티비에서 봤던 장미칼이 모든 것을 썰어내는 모습을 떠올리지 않으려 머리를 흔들었다.", textBox.x, textBox.y- 50, 600, 130, "Font/Maplestory Light.ttf")
text[3][26] = display.newText("\'아닐거야. 그걸 왜 고양이가 가지고 있겠어....\'", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][27] = display.newText("양갱이는 젠이 책을 가지고 다닌다는 사실은 외면했다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2
text[3][28] = display.newText("(장미꽃으로 꾸며준다는건가?)어! 원해!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][29] = display.newText("로즈는 가방을 열었다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][30] = display.newText("그 속에는 양갱이가 가장 보고 싶지 않았던 장미칼이 빛을 발하고 있었다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][31] = display.newText("내가 고양이 앞에서 검무를 추는 걸 좋아하거든!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][32] = display.newText("그런데 내가 잘 못 춰서 그런지 다른 고양이들은 내가 검무를 추면 도망가더라.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][33] = display.newText("마침 잘됐다! 네가 내 춤좀 봐줘.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][34] = display.newText("그....그래..", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][35] = display.newText("가끔 칼을 놓치기도 하는데, 그런 건 애교로 봐줘!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][36] = display.newText("(살려줘)", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][37] = display.newText("그날 양갱이는 로즈의 검무 속에서 생존하기 위해 온 힘을 다했다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[3][38] = display.newText("로즈는 같이 춤을 추는 내가 마음에 들었다고 다음에도 검무를 추겠다고 한다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
----------------------------------------------------------------------------------------------------------
----4번 스크립트-------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
text[4][1] = display.newText("볼 때마다 생각하는 건데, 네 귀랑 다리는 압도적으로 귀여운 거 같아.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][2] = display.newText("너는 보면 내 접힌 귀를 되게 좋아하는 거 같더라. ", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][3] = display.newText("난 좀 불평인데.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][4] = display.newText("엥? 그게 왜?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][5] = display.newText("소리가 잘 안들리잖아. 접힌 귀가 사냥할 때 조그만한 소리를 듣는 걸 자꾸 방해해.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][6] = display.newText("그리고 어릴 때는 이걸로 놀림도 많이 받았거든. 귀도 반으로 접혀 있고 다리도 두 배나 짧으니 반쪽짜리 고양이라고.", textBox.x, textBox.y- 50+20, 600, 140, "Font/Maplestory Light.ttf")
--선택지 1번
text[4][7] = display.newText("저런....", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[4][8] = display.newText("그래서 고양이들을 칼로 다스리기 시작한거야?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--===--
text[4][9] = display.newText("그래서 검무도 시작하게 된거야. ", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][10] = display.newText("나도 다른 고양이들처럼 조금이라도 멋져 보이고 싶었어.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[4][11] = display.newText("검무 추지 않을 때도 넌 충분히 멋져.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][12] = display.newText("그렇게 말해줘서 정말 고마워.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][13] = display.newText("하지만 그것도 지금은 취미로 즐기고 있어! ", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][14] = display.newText("바람을 가르는 칼의 소리가 예쁘더라.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[4][15] = display.newText("맞아, 솔직히 칼을 들고 있으면 많이 무섭더라. 특히 춤추다 칼이 네 손을 떠날       때...", textBox.x, textBox.y- 50-5, 600, 130, "Font/Maplestory Light.ttf")
text[4][16] = display.newText(".......", textBox.x, textBox.y- 50, 600, 85)
text[4][17] = display.newText("농담 한번 해봤어.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--===--
text[4][18] = display.newText("그리고 난 귀가 접혀 있어도 울지 않아. ", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][19] = display.newText("다리가 짧아도 괜찮아.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][20] = display.newText("그만큼 더 많은 걸 보고 배우고 있고, 누구보다 더 넓은 곳들을 돌아다니고 있으니까.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][21] = display.newText("그러니 네가 여기서 나가고 싶다 하는 것도 이해해.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][22] = display.newText("어떤 선택을 하든 응원할게. ", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][23] = display.newText("가서 기죽지만 마.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[4][24] = display.newText("응, 고마워", textBox.x, textBox.y- 50, 600, 85)
-----------------------------------------------------------------------------------------------------------
---5번 스크립트--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
text[5][1] = display.newText("그거 알아?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[5][2] = display.newText("자기가 들어있는 어항에 따라 성체의 크기가 바뀌는 물고기가 있대.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[5][3] = display.newText("사회생활 잘할 거 같은 물고기네.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[5][4] = display.newText("와 진짜? 그러면 세상에서 제일 큰 어항에 넣어두면 평생 먹을 수 있겠다!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--===================================--
text[5][5] = display.newText("그러게. ", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[5][6] = display.newText("그런 걸 보면 환경이라는 것도 생각보다 중요한가봐.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[5][7] = display.newText("이상하지 않아?", textBox.x, textBox.y- 50, 600, 85)
text[5][8] = display.newText("물고기는 그대로인데, 어항 하나 바꿨다고 몸 크기까지 바꿔야 한다니...", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[5][9] = display.newText("어쩐지 앞에 호수에 있는 물고기들이 가장 배부르더라.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[5][10] = display.newText("어항이 잘못했네.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
----------------------------------------------------------------------------------------------------------
----6번 스크립트-------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------	
text[6][1] = display.newText("로즈가 심심한지 계속 이상한 소리를 낸다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[6][2] = display.newText("웨-오!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[6][3] = display.newText("에-오!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[6][4] = display.newText("오-웨!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--============--
text[6][5] = display.newText("웨-웨-오!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[6][6] = display.newText("오-오-웨!", textBox.x, textBox.y- 50, 600, 85), "Font/Maplestory Light.ttf"
--선택지 2번
text[6][7] = display.newText("에-에-오!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--============--
text[6][8] = display.newText("웨오웨오웨!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[6][9] = display.newText("오에오에오!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[6][10] = display.newText("적당히 좀 해.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
----------------------------------------------------------------------------------------------------------
----7번 스크립트----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------	
text[7][1] = display.newText("선착순 한 냥이 이빨과자.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[7][2] = display.newText("나!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 1번
text[7][3] = display.newText("축하해. 오늘부터 넌 이빨과자야.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[7][4] = display.newText("로즈는 조용히 장미칼을 꺼내들었다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
--선택지 2번
text[7][5] = display.newText("축하해. 여기 이빨과자야.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[7][6] = display.newText("야호!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
----------------------------------------------------------------------------------------------------------
----8번 스크립트------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------	
text[8][1] = display.newText("봐, 여기 맛있는 참치캔이 있어!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][2] = display.newText("진짜 맛있겠다!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][3] = display.newText("로즈는 장미칼을 꺼냈다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][4] = display.newText("이제 이 칼로 뭘 해야 할까?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][5] = display.newText("캔을 따야지...?", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][6] = display.newText("아니, 나는 이 칼로 참치캔을 지킬 거야.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][7] = display.newText("??", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][8] = display.newText("가까이 오지 마!", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
text[8][9] = display.newText("양갱이는 로즈의 보금자리에서 쫓겨났다.", textBox.x, textBox.y- 50, 600, 85, "Font/Maplestory Light.ttf")
----------------------------------------------------------------------------------------------------------
----9번 스크립트-------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------	
	for i=1, 8, 1 do
		for j=1, #text[i], 1 do
			text[i][j].size = 30
			text[i][j].name = j
			text[i][j]:setFillColor(0)
		end
	end

	for i=1, 8, 1 do
		text[i][#text[i]+1] = display.newText("", textBox.x, textBox.y- 50, "Font/Maplestory Light.ttf")
	end
	

	function removeText( )--모든 텍스트 삭제
		-- body
		for i=1, 8, 1 do
			for j=1, #text[i], 1 do
				text[i][j].alpha = 0
			end
		end
	end
	removeText()
	function fadein( )--이미지 등장때 사용하면 좋을 듯
		-- body
		local black = display.newRect(display.contentWidth, display.contentHeight, display.contentWidth/2, display.contentHeight/2 )
	end
	function removeImage( )--모든 이미지 삭제
		-- body
		for i=1, 4, 1 do opening_Image[i].alpha = 0 end
	end
	function removeName( )--모든 이름 삭제
		for i=0, 5, 1 do cat[i].alpha = 0 end
	end

	function chooseScript(  )
		-- body
		randomNum = math.random(3, 3)
		print("randomNum:"..randomNum)
	end
		chooseScript(randomNum)
	
	function printName( )
		-- body
		removeName()
		if randomNum == 1 then--1번째 스크립트에서
			if index == 3 or index == 5 or index == 6 or index == 8 or index == 10 or index == 13
				or index == 15 or index == 17 then--n번째 문장
				cat[1].alpha = 1--양갱
			elseif index == 2 or index == 4 or index == 12 or index == 14 or index == 16 then
				cat[4].alpha = 1
			end
		elseif randomNum == 2 then--2번째 스크립트에서
		elseif randomNum == 3 then--3번째 스크립트에서
			if index == 1 or index == 3 or index == 5 or index == 10 or index == 11 or index == 13
			or index == 22 or index == 26 or index == 34 or index == 36 then
				cat[1].alpha = 1
			elseif index == 2 or index == 4 or index == 6 or index == 7 or index == 8
			or index == 12 or index == 14 or index == 20 or index == 22 or index == 31 or index == 32
			or index == 33 or index == 35 then
				cat[4].alpha = 1
			end
		elseif randomNum == 4 then--4번째 스크립트에서
			if index == 1 or index == 4 or index == 7 or index == 8 or index == 11 or index == 15
				or index == 17 or index == 24 then
				cat[1].alpha = 1
			elseif index == 2 or index == 3 or index == 5 or index == 6 or index == 9
			or index == 10 or index == 12 or index == 13 or index == 14 or index == 16 or index == 18
			or index == 19 or index == 20 or index == 21 or index == 22 or index == 23 then
				cat[4].alpha = 1
			end
		elseif randomNum == 5 then--5번째 스크립트에서
			if index == 3 or index == 4 or index == 9 or index == 10 then
				cat[1].alpha = 1
			elseif index == 1 or index == 2 or index == 5 or index == 6 or index == 7 or index == 8 then
				cat[4].alpha = 1
			end
		elseif randomNum == 6 then--6번째 스크립트에서
			if index == 3 or index == 4 or index == 6 or index == 7 or index == 9 or index == 10 then
				cat[1].alpha = 1
				if index == 10 then
					image[1].alpha = 0
					image[3].alpha = 1
				end
			elseif index == 2 or index ==5 or index == 8 then
				cat[4].alpha = 1
			end
		elseif randomNum == 7 then--7번째 스크립트에서
			if index == 1 or index == 3 or index == 5 then
				cat[1].alpha = 1
			elseif index == 2 or index == 6 then
				cat[4].alpha = 1
			end
		elseif randomNum == 8 then--8번째 스크립트에서
			if index == 2 or index == 5 or index == 7 then
				cat[1].alpha = 1
			elseif index == 1 or index == 4 or index == 6 or index == 8 then
				cat[4].alpha = 1
			end
		end
	end
	
	local checkBox = {}
	checkBox[1] = display.newText("1번", textBox.x, textBox.y-45-10, 600, 85)
    checkBox[1].size = 40
    checkBox[1]:setFillColor(0)
    checkBox[2] = display.newText("2번", textBox.x, textBox.y + 45 - 20 , 600, 85)
    checkBox[2].size = 40
    checkBox[2]:setFillColor(0)
    for i = 1, 2, 1 do 
        checkBox[i].alpha = 0 
        checkBox[i].name = i
    end

	function selectScript()
		for i = 1, 2, 1 do checkBox[i].alpha = 1 end
        if randomNum == 3 then

            checkBox[1].text = "1: "..text[3][21].text

            checkBox[2].text = "2: "..text[3][28].text
        elseif randomNum == 4 then
            if index == 7 then
                checkBox[1].text = "1: "..text[4][7].text
                checkBox[2].text = "2: "..text[4][8].text
            elseif index == 11 then
                checkBox[1].text = "1: "..text[4][11].text
                checkBox[2].text = "2: "..text[4][15].text
            end
        elseif randomNum == 5 then  
        	 if index == 3 then
                checkBox[1].text = "1: "..text[5][3].text
                checkBox[2].text = "2: "..text[5][4].text
            elseif index == 9 then
                checkBox[1].text = "1: "..text[5][9].text
                checkBox[2].text = "2: "..text[5][10].text
                checkBox[2].y =  textBox.y+40
            end
        elseif randomNum == 6 then  
        	if index == 3 then
                checkBox[1].text = "1: "..text[6][3].text
                checkBox[2].text = "2: "..text[6][4].text
            elseif index == 6 then
                checkBox[1].text = "1: "..text[6][6].text
                checkBox[2].text = "2: "..text[6][7].text
            elseif index == 9 then
                checkBox[1].text = "1: "..text[6][9].text
                checkBox[2].text = "2: "..text[6][10].text
            end   
        elseif randomNum == 7 then
            checkBox[1].text = "1: "..text[7][3].text
            checkBox[2].text = "2: "..text[7][5].text 
        end

    end

	function printText(event)
		-- body
		printName()
		print("index:"..index)
		if randomNum == 1 then
			removeText()
			--[[if index == 5 or index == 17 then--end--일단 맵으로 보내기
				--메인으로 이동
				composer.gotoScene("map")
			end]]
			text[1][index].alpha = 1
			if index == 4 then--게임 이동
				--씬 이동
				--벌레잡기 
				composer.gotoScene("view1")
				--이길 시 index = 4
				--질 시 index = 6
			end
			
		elseif randomNum == 2 then
			removeText()
			--[[if index == 7 or index == 11 then--end
				--메인으로 이동
				composer.gotoScene("map")
			end]]
			text[2][index].alpha = 1
			if index == 4 then--게임 이동
				--씬 이동
				composer.gotoScene("dance")
				--이길 시 index = 4
				--질 시 index = 8
			end
			
		elseif randomNum == 3 then
			if index == 39 then--end
					--메인으로 이동
					print("메인으로 이동")
					composer.setVariable("roseHogamdo",hogamdo)
					composer.gotoScene("map")
			end
			if index == 8 or index == 7 then
				text[3][index].alpha = 1
			else
				removeText()
				text[3][index].alpha = 1

				if index == 21 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index ==	28 then --end
					--메인으로 이동
					print("메인으로 이동")
					composer.setVariable("roseHogamdo",hogamdo)
					composer.gotoScene("map")
				end

			end 	
		elseif randomNum == 4 then

			if index == 25 then--end
				--메인으로 이동
				print("메인으로 이동")
				composer.setVariable("roseHogamdo",hogamdo)
				composer.gotoScene("map")
			else
				removeText()
				text[4][index].alpha = 1
				if index == 7 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index == 11 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index == 14 then index = 17 end
			end
			
		elseif randomNum == 5 then
			if index == 11 then--end
				--메인으로 이동
				print("메인으로 이동")
				composer.setVariable("roseHogamdo",hogamdo)
				composer.gotoScene("map")
			else
				removeText()
				text[5][index].alpha = 1
				if index == 3 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index == 9 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				end
			end
			
		elseif randomNum == 6 then
			if index == 11 then--end
				--메인으로 이동
				print("메인으로 이동")
				composer.setVariable("roseHogamdo",hogamdo)
				composer.gotoScene("map")
			else
				print("now 6 index : ".. index)
				removeText()
				text[6][index].alpha = 1
				if index == 3 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index == 6 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index == 9 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				end
			end
			
		elseif randomNum == 7 then--쉉
			if index == 7 then--end
				--메인으로 이동
				print("메인으로 이동")
				composer.setVariable("roseHogamdo",hogamdo)
				composer.gotoScene("map")
			else
				removeText()
				text[7][index].alpha = 1
				if index == 3 then--선택지
					removeText()
					nextButton.alpha = 0
					selectScript()
				elseif index ==	4 then 
					index = 6
				end
			end
		elseif randomNum == 8 then
			if index == 10 then--end
				--메인으로 이동
				print("메인으로 이동")
				composer.setVariable("roseHogamdo",hogamdo)
				composer.gotoScene("map")
			end
			removeText()
			text[8][index].alpha = 1
		end
		index = index + 1
	end

	hogamdoBox = display.newText("0", display.contentWidth/2, 85)
    hogamdoBox.size = 40
    hogamdoBox:setFillColor(1)
    --hogamdo.text = send_hogamdo.text
    -- 호감도 저장 하진
    function calcRose()
        hogamdoBox.text = string.format("%d", roseHogamdo)
    end
	calcRose()

	local function calcHogamdo(event)

        print("호감도 계산")
        if randomNum == 1 then
        elseif randomNum == 2 then
        elseif randomNum == 3 then
            if event.target.name == 1 then
                print("호감도 올라가기")
                roseHogamdo = roseHogamdo + 30
                hogamdoBox.text = string.format("%d", roseHogamdo)
                index = 22
            elseif event.target.name == 2 then
                print("호감도 변화없음")
                index = 29
            end
        elseif randomNum == 4 then
            if index == 8 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)
                elseif event.target.name == 2 then
                    print("호감도 변화없음")
                end
                index = 9
            elseif index == 12 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)
                    index = 12
                elseif event.target.name == 2 then
                    print("호감도  감소")
                    roseHogamdo = roseHogamdo -3
                    hogamdoBox.text = string.format("%d", roseHogamdo)
                    index = 15
                end
            end
            
        elseif randomNum == 5 then
            if index == 4 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)
                elseif event.target.name == 2 then print("호감도 변화없음") end
                index = 5
            elseif index == 10 then
                if event.target.name == 1 then
                    print("호감도 변화없음")
                    index = 11
                elseif event.target.name == 2 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)
                    index = 11
                end
            end
            
        elseif randomNum == 6 then
            if index == 4 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)
                elseif event.target.name == 2 then print("호감도 변화없음") end
                index = 5
            elseif index == 7 then
                if event.target.name == 1 then print("호감도 변화없음")                   
                elseif event.target.name == 2 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)                  
                end
                index = 8
            elseif index == 10 then
                if event.target.name == 1 then
                    print("호감도 올라가기")
                    roseHogamdo = roseHogamdo + 5
                    hogamdoBox.text = string.format("%d", roseHogamdo)                 
                elseif event.target.name == 2 then 
                	print("호감도 변화없음") 
                	image[1].alpha = 0
                	image[3].alpha = 1
                end      
                print(11)
                index = 11 
            end

        elseif randomNum == 7 then
            if event.target.name == 1 then
                print("호감도 변화없음")
                index = 4
            elseif event.target.name == 2 then
                print("호감도 올라가기")
                roseHogamdo = roseHogamdo + 10
               hogamdoBox.text = string.format("%d", roseHogamdo)
                index = 6
            end
        end
        calcRoseMap()--하진
        nextButton.alpha = 1
        for i = 1, 2, 1 do checkBox[i].alpha = 0 end    
    end


    for i = 1, 2, 1 do checkBox[i]:addEventListener("tap", calcHogamdo) end
	
	nextButton:addEventListener("tap", printText)
--삽입--
	sceneGroup:insert(background)
	sceneGroup:insert(school)
	for i=1, 4, 1 do
		sceneGroup:insert(image[i])
	end
	sceneGroup:insert(textBox)
	sceneGroup:insert(nextButton)
	for i=0, 5, 1 do sceneGroup:insert(cat[i]) end
	for i=1, 8, 1 do
		for j=1, #text[i], 1 do sceneGroup:insert(text[i][j]) end
	end
	for i=1, 2, 1 do sceneGroup:insert(checkBox[i]) end
	sceneGroup:insert(heart)
	sceneGroup:insert(hogamdoBox)


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
		composer.removeScene("roseScript")
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
