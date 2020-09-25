--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(def, x, y, direction)
	
	self.x = x
    self.y = y
    self.width = def.width
	self.height = def.height
	self.direction = direction
	self.distance = def.distance
	self.speed = def.speed

	self.type = def.type
    self.texture = def.texture
    self.frame = def.frame or 1


    self.default = def.default
    self.state = self.default
    self.states = def.states

end

function Projectile:update(dt)

	if self.direction == 'left' then

		if self.x < self.x - self.distance then
			self.x = self.x - self.distance
		end

	elseif self.direction == 'right' then

		if self.x > self.x + self.distance then
			self.x = self.x + self.distance
		end

	elseif self.direction == 'down' then

		if self.y > self.y + self.distance then
			self.y = self.y + distance
		end

	elseif self.direction == 'up' then

		if self.y < self.y + self.distance then
			self.y = self.y - distance
		end

	end

end

function Projectile:render(adjacentOffsetX, adjacentOffsetY)
	love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end