
Paddle = {}

function Paddle:load()
    self.x = love.graphics.getWidth() / 2 - 50
    self.y = love.graphics.getHeight() - 150
    self.width = 200
    self.height = 35
    self.speed = 500
end

function Paddle:update(dt)
    self:move(dt)
    self:wallCollision()
end

function Paddle:move(dt)
    if love.keyboard.isDown("a") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    end
end

function Paddle:wallCollision()
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.width
    end
end

function Paddle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end