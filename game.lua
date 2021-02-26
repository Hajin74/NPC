-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local physics = require ("physics")

local background--배경
local player--양갱이
local heart = {} --플레이 생명
local object = {}
local buttonUI = {}

-- 소리

function scene:create( event )
	local sceneGroup = self.view
	math.randomseed(os.time())
	physics.start(true)
	physics.setGravity(0, 20)
	--게임 배경
	background = display.newImageRect( "img/road.jpg", display.contentWidth, display.contentHeight )
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2

    --양갱이
    player = display.newImageRect( "image/yanggang_angry.png", 200, 300)
    player.x = 398 * 0.75 / 2
    player.y = 1100
    physics.addBody(player, "static", {friction=0})

    local score1 = display.newText("0:30", 600, 100, "돋움")
    score1.size = 60
    local score1count = 30

    local function time()--시간 제한->현재 30초(조절)
   	-- body
	   	score1count = score1count - 1
	   	score1.text = string.format("0:%02d", score1count)
    end
  	timer.performWithDelay(1000, time, 30)

    for i=1, 3, 1 do--목숨
	   heart[i] = display.newImageRect("image/heart.png", 100, 100)
	   heart[i].x, heart[i].y = 100+100*(i-1), 100
	end

	local showObject
	object = {"image/plant1.png", "image/plant2.png"}--화분 두개
	local function createObject(event)

		showObject = display.newImage(object[math.random(1,2)])--이번에 떨어질 화분

		showObject.width = 100 showObject.height = 100
		showObject.x = math.random(50, 670) showObject.y = 0

		physics.addBody(showObject, "dynamic", {friction=1})
	end

	local drop = timer.performWithDelay(math.random(1000, 2000), createObject, 15)--랜덤함수 시간조절..밸런스 맞추기

	function inputEvent( event )
        if event.target.name == "L" then
        	player.x = player.x -100
		elseif event.target.name == "R" then
			player.x = player.x +100
		end
	end
	--왼쪽 이동 버튼
	buttonUI[1] = widget.newButton({
      defaultFile = "image/left.png", overFile = "image/left.png",
      width = 200, height = 200, onRelease = inputEvent
   })
   buttonUI[1].x, buttonUI[1].y = display.contentWidth-150-85, display.contentHeight - 150
   buttonUI[1].name = "L"
   --오른쪽 이동 버튼
   buttonUI[2] = widget.newButton({ 
      defaultFile = "image/right.png", overFile = "image/right.png", 
      width = 200, height = 200, onRelease = inputEvent 
   })
   buttonUI[2].x, buttonUI[2].y = display.contentWidth-150+85, display.contentHeight-150
   buttonUI[2].name = "R"

   local num = 4--하트 뒤에서부터 사라지게 하기위함
   local function onCollision( self, event )
       --local collideObject = event.other
       if  event.contact.isTouching == true  then
       		if heart[2].alpha == 0  then
       			print("gameOver")
       			--num = num -1
       			--heart[num].alpha = 0
       			timeover()
       		else
	       		num = num -1
	       		heart[num].alpha = 0
	       		event.other:removeSelf()
				--event.other = nill
			end
          print(0)
          if num <= 1 then
          	--event.other:removeEventListener("collision")
          	print("gameOver")
          	--씬 이동
          end
       end
    end

	player.collision = onCollision
	player:addEventListener( "collision" )

	function timeover( )
		physics.removeBody(showObject, "dynamic", {friction=1})
		if heart[1].alpha == 1 then--하트 1개 남았다면 바로 게임오버
			print("win")
			--씬 이동 코드 작성
			local win = 1
			composer.setVariable("winornot", win)
			composer.gotoScene("map")--일단 맵으로
		else
			print("lose")
			--씬 이동 코드 작성
			local win = 0
			composer.setVariable("winornot", win)
			composer.gotoScene("map")--일단 맵으로

		end
	end

	timer.performWithDelay(30000, timeover)--30초 제한

	sceneGroup:insert(background)

	--sceneGroup:insert(showObject) 

	sceneGroup:insert(player)
	for i=1, 3, 1 do
		sceneGroup:insert(heart[i])
	end
	for i=1, 2, 1 do
		sceneGroup:insert(buttonUI[i])
	end
	sceneGroup:insert(score1)

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
		composer.removeScene("game")
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