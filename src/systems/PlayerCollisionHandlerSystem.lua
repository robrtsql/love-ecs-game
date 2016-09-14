local json = require("libs.json")

-- Note that this collision handler system is for triggering scripts in
-- response to collisions. Collision resolution is left to bump.lua.
-- An example of what we would use the collision handler system for is for
-- triggering the script to remove a coin from our system and incrementing
-- the player's score when they touch/collide with that coin.

local PlayerCollisionHandlerSystem = {}

function PlayerCollisionHandlerSystem:process(e, dt, gameState)
    if e.collisions.list then
        for _, collision in ipairs(e.collisions.list) do
            if collision.other.type == "teleport" then
                local teleport = collision.other
                if self:shouldTeleport(e, dt, teleport) then
                    gameState.levelSwitch = teleport
                end
            end
        end
    end
end

-- Only teleport to the next screen if the player really intended to (they
-- were holding down the movement key to move in the direction of the next
-- screen when they touched the edge)

function PlayerCollisionHandlerSystem:shouldTeleport(e, dt, teleport)
    -- TODO: it's probably a code smell that the 'player collision
    -- handler system' knows about the love.keyboard API.
    if teleport.direction then
        if love.keyboard.isDown("w") and teleport.direction == "up" then
            return true
        elseif love.keyboard.isDown("s") and teleport.direction == "down" then
            return true
        elseif love.keyboard.isDown("a") and teleport.direction == "left" then
            return true
        elseif love.keyboard.isDown("d") and teleport.direction == "right" then
            return true
        end
    else
        return true
    end
end

return PlayerCollisionHandlerSystem
