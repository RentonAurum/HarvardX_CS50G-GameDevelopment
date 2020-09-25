PlayerPotIdleState = Class{__includes = EntityIdleState}

function PlayerPotIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
    self.pot = params.pot

	self.entity:changeAnimation('idle-pot-' .. self.entity.direction)
end

function PlayerPotIdleState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerPotIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk-pot', {pot = self.pot})
    end

    if love.keyboard.wasPressed('e') then
        Event.dispatch('pot-thrown', {pot = self.pot, direction = self.entity.direction})
        self.entity:changeState('idle')
    end

    self.pot.x, self.pot.y = self.entity.x, self.entity.y
end

function PlayerPotIdleState:render()
    EntityIdleState.render(self)
    self.pot:render(0, -12)
end