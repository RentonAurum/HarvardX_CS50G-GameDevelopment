--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    
    local item1 = love.graphics.newImage('bronze_medal.png')
    local item2 = love.graphics.newImage('silver_medal.png')
    local item3 = love.graphics.newImage('gold_medal.png')

    local getMedal = nil
    local medalRank = nil
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 50, VIRTUAL_WIDTH, 'center')

    if self.score >= 3 then
        getMedal = item3
        medalRank = 'gold'
    elseif self.score == 2 then
        getMedal = item2
        medalRank = 'silver'
    elseif self.score <= 1 then
        getMedal = item1
        medalRank = 'bronze'
    end
        if getMedal ~= nil then
            love.graphics.printf('Game Over! You Got ' .. medalRank .. ' medal' ,0,75,VIRTUAL_WIDTH, 'center')
            love.graphics.draw(getMedal, VIRTUAL_WIDTH / 2 - getMedal:getWidth() / 2, 95)
        end
        
        love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')
end

