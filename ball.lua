
Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.radius = 20
    self.speed = 375
    self.yVel = self.speed
    self.xVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:wallCollide()
    self:collidePlayer()
end

function Ball:wallCollide()
--Left and Right Wall Collision
    if self.x < 0 then
        self.x = 0 + 20
        self.xVel = self.speed
    elseif self.x + self.radius > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.radius
        self.xVel = -self.speed
    end

    if self.y < 0 then
        self.y = 0
        self.yVel = self.speed
    elseif self.y + self.radius > love.graphics.getHeight() then
        self.x = love.graphics.getWidth() / 2
        self.y = love.graphics.getHeight() / 2 
        self.yVel = -375
        self.xVel = 0
    end
end

function Ball:collidePlayer()
    if checkCollision(self, Paddle) then
        self.yVel = -self.yVel * 1.05
        self.speed = self.speed + 3
        if self.xVel <= 0 then
            self.xVel = -love.math.random(375, 450)
        else
            self.xVel = love.math.random(375, 450)
        end
    end
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end