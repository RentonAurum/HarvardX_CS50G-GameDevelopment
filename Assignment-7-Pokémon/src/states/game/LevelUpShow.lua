LevelUpShow = Class{__includes = BaseState}

function LevelUpShow:init(menuLevel, onClose)
    self.menuLevel = menuLevel
    -- function to be called once this message is popped
    self.onClose = onClose or function() end
end

function LevelUpShow:update(dt)
        self.menuLevel:update(dt)

        if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
            self.onClose()
        end
end

function LevelUpShow:render()
    self.menuLevel:render()
end