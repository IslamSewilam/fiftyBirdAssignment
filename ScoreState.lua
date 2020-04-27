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
local score3 = love.graphics.newImage('score3.png')
local score5 = love.graphics.newImage('score5.png')
local score10 = love.graphics.newImage('score10.png')

local Medal = score3
local pipesPassed = 0

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    noMedal = false
    pipesPassed = 0
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
    if self.score >= 10 then
    
        Medal = score10
    
    elseif self.score >= 5 then
        
        Medal = score5
 
    elseif self.score >= 3 then
        
        Medal = score3

    else
        noMedal = true
    end
   

end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Congrats ! The Pipes Passed : ' .. tostring(self.score) , 0, 130, VIRTUAL_WIDTH, 'center')
    if noMedal then
        love.graphics.printf('Too Bad  You Need More work to get your Crystal' , 0, 160, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('Congrats ! The Pipes Passed : ' .. tostring(self.score) , 0, 130, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(Medal,VIRTUAL_WIDTH/2-(Medal:getWidth()/2),185-Medal:getHeight()/2)
    end 
    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')
end