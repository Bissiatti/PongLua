width, height, flags = love.window.getMode( )
wPlay = 20
hPlay = 60
yPlay1 = height/2 - hPlay/2
yPlay2 = height/2 - hPlay/2
xPlay1 = 0
xPlay2 = width - wPlay
xBall = width/2
yBall = height/2
xSpeed = 32
ySpeed = 32
r = 10
function love.load()

end
function love.update(dt)
    xBall = xBall + xSpeed*dt*10
    yBall = yBall + ySpeed*dt*10

    if (xBall + r > xPlay2 - wPlay
    and yBall - r < yPlay2 + hPlay
    and yBall + r > yPlay2 - hPlay) then
        xSpeed = -xSpeed
    end

    if (xBall - r < xPlay1 + wPlay
    and yBall - r < yPlay1 + hPlay
    and yBall + r> yPlay1 - hPlay) then
        xSpeed = -xSpeed
    end

    if yBall - r > 0 then
        ySpeed = -ySpeed
    end
    if yBall + r < height then
        ySpeed = -ySpeed
    end
    if xBall < 0 or xBall > width then
        xBall = width/2
        yBall = height/2
    end
    if yPlay1 > 0 then
        if love.keyboard.isDown("w") then
        yPlay1 = yPlay1 - dt*1000
        end
    end
    if yPlay1 < height - 60 then
        if love.keyboard.isDown("s") then
            yPlay1 = yPlay1 + dt*1000
        end
    end
    if yPlay2 > 0 then
        if love.keyboard.isDown("up") then
        yPlay2 = yPlay2 - dt*1000
        end
    end
    if yPlay2 < height - 60 then
        if love.keyboard.isDown("down") then
            yPlay2 = yPlay2 + dt*1000
        end
    end
end

function love.draw()
    love.graphics.setColor(255/255,211/255,25/255)
    love.graphics.rectangle("fill",xPlay1,yPlay1,wPlay,hPlay)
    love.graphics.setColor(11/255,125/255,35/255)
    love.graphics.rectangle("fill",xPlay2,yPlay2,wPlay,hPlay)
    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill",xBall,yBall,r)
    
end