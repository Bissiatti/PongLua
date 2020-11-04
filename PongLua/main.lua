width, height, flags = love.window.getMode( )
wPlay = 20
hPlay = 120
yPlay1 = height/2 - hPlay/2
yPlay2 = height/2 - hPlay/2
xPlay1 = 0
xPlay2 = width - wPlay
xBall = width/2
yBall = height/2
xSpeed = 32
ySpeed = 32
r = 10
player = 0
xPong = width/2 -128
yPong = height/2 - 64
ySelect = yPong + 132
menu = 0
p1Speed = 0
p2Speed = 0
goal1 = 0
goal2 = 0
function love.load()
    pong = love.graphics.newImage("title.png")
end
function love.update(dt)
    function love.keyreleased(key, unicode)
        if menu == 0 then
            if key == "s" then
                ySelect = yPong+132 + 32
                menu = 1
            end
        elseif menu == 1 then
            if key == "s" then
                ySelect = yPong+132 + 32 + 32
                menu = 2
            elseif key == "w" then
                ySelect = yPong+132
                menu = 0
            end
        elseif menu == 2 then
            if key =="w" then
                menu = 1
                ySelect = yPong+132+32
            end
        end
        if player ~= 0 then
            if key == "escape" then
                retur()
            end
        end
    end
    
    if player == 1 or player == 2 then
    xBall = xBall + xSpeed*dt*10
    yBall = yBall + ySpeed*dt*10

    if (xBall + r > xPlay2 - wPlay
    and yBall - r < yPlay2 + hPlay
    and yBall + r > yPlay2) then
        xSpeed = -xSpeed -0.025
        if ySpeed > 0 then
            ySpeed = ySpeed + 0.025
        else
            ySpeed = ySpeed + 0.025
        end
    end

    if (xBall - r < xPlay1 + wPlay
    and yBall - r < yPlay1 + hPlay
    and yBall + r> yPlay1) then
        xSpeed = -xSpeed -0.025
        if ySpeed > 0 then
            ySpeed = ySpeed + 0.025
        else
            ySpeed = ySpeed + 0.025
        end
    end

    if yBall - r > 0 then
        ySpeed = -ySpeed -0.025
        if xSpeed > 0 then
            xSpeed = xSpeed + 0.025
        else
            xSpeed = xSpeed - 0.025
        end
    end
    if yBall + r < height then
        ySpeed = -ySpeed -0.025
        if xSpeed > 0 then
            xSpeed = xSpeed + 0.025
        else
            xSpeed = xSpeed - 0.025
        end
    end
    if xBall < 0 then
        xBall = width/2
        yBall = height/2
        ySpeed = 32
        xSpeed = 32
        goal2 = goal2 + 1
    end
    if xBall > width then
        xBall = width/2
        yBall = height/2
        ySpeed = 32
        xSpeed = 32
        goal1 = goal1 + 1
    end
    if yPlay1 > 0 then
        if love.keyboard.isDown("w") then
        yPlay1 = yPlay1 - dt*1000
        end
    end
    if yPlay1 < height - hPlay then
        if love.keyboard.isDown("s") then
            yPlay1 = yPlay1 + dt*1000
        end
    end
    end
    if player == 2 then
    if yPlay2 > 0 then
        if love.keyboard.isDown("up") then
        yPlay2 = yPlay2 - dt*1000
        end
    end
    if yPlay2 < height - hPlay then
        if love.keyboard.isDown("down") then
            yPlay2 = yPlay2 + dt*1000
        end
    end
    end
    
    if love.keyboard.isDown("return") then
        if ySelect == yPong+132 then
            player = 1
        elseif  ySelect == yPong+132 + 32 then
            player = 2
        end
    end
    if player == 1 then
        if yBall - 3*hPlay/4> yPlay2 then
            if yPlay2 < height - hPlay then
                yPlay2 = yPlay2 + dt*1000
            end
        elseif yBall + 3*hPlay/4 < yPlay2 then
            if yPlay2 > 0 then
                yPlay2 = yPlay2 - dt*1000
            end
        end
    end
end

function love.draw()
    if player == 0 then
        title()
    elseif player == 2 or player == 1 then
        Play()
    end
end

function title()
    love.graphics.draw(pong,xPong,yPong)
    love.graphics.circle("fill",xPong-16,ySelect,8)
    love.graphics.print("1 player",xPong,(yPong+128))
    love.graphics.print("2 player",xPong,(yPong+160))
    love.graphics.print("settings",xPong,(yPong+160+32))
end

function Play()
    love.graphics.setColor(255/255,211/255,25/255)
    love.graphics.rectangle("fill",xPlay1,yPlay1,wPlay,hPlay)
    love.graphics.setColor(11/255,125/255,35/255)
    love.graphics.rectangle("fill",xPlay2,yPlay2,wPlay,hPlay)
    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill",xBall,yBall,r)
    love.graphics.print("Score:",width/2-(5*6),32,0,3)
    love.graphics.print(goal1,width/2-2*64,32,0,3)
    love.graphics.print(goal2,width/2+2*64,32,0,3)
end

function retur()
wPlay = 20
hPlay = 120
yPlay1 = height/2 - hPlay/2
yPlay2 = height/2 - hPlay/2
xPlay1 = 0
xPlay2 = width - wPlay
xBall = width/2
yBall = height/2
xSpeed = 32
ySpeed = 32
r = 10
player = 0
xPong = width/2 -128
yPong = height/2 - 64
ySelect = yPong + 132
menu = 0
p1Speed = 0
p2Speed = 0
goal1 = 0
goal2 = 0
end