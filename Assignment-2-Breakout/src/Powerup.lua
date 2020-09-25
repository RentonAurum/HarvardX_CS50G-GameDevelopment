Powerup = Class{}

function Powerup:init(type, x, y)

     self.dy = 40
     self.dx = 0
     self.x = x
     self.y = y
     self.width = 16
     self.height = 16

     self.type = type
     self.active = true

end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    return true

end

-- Added on PS.lua
-- function Powerup:spawn()
--end
function Powerup:update(dt)

    if self.y < VIRTUAL_HEIGHT then
        self.y = self.y + self.dy * dt
    end

end


function Powerup:render()
    if self.active then
        love.graphics.draw(gTextures['main'], gFrames['power'][self.type], self.x, self.y)
    end
end
