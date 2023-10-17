require("paddle")
require("ball")

function love.load()
    Paddle:load()
    Ball:load()
end

function love.update(dt)
    Paddle:update(dt)
    Ball:update(dt)
end

function love.draw()
    Paddle:draw()
    Ball:draw()
end

function checkCollision (bal, pad)
    --AABB Collision Technique
    if bal.y + bal.radius > pad.y and bal.y < pad.y + pad.height and 
    bal.x + bal.radius > pad.x and bal.x < pad.x + pad.width then
        return true
    else
        return false
    end
end