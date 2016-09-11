local json = require("libs.json")

-- Note that this collision handler system is for triggering scripts in
-- response to collisions. Collision resolution is left to bump.lua.
-- An example of what we would use the collision handler system for is for
-- triggering the script to remove a coin from our system and incrementing
-- the player's score when they touch/collide with that coin.

local CollisionHandlerSystem = tiny.processingSystem()

CollisionHandlerSystem.filter = tiny.requireAll("position", "bumpMotion",
    "hitbox", "collisions")

function CollisionHandlerSystem:process(e, dt)
    if e.tag == "player" then
        if e.collisions.list then
            for _, collision in ipairs(e.collisions.list) do
                if collision.other.type == "teleport" then
                    local teleport = json.decode(collision.other.properties.obj)
                    if love.keyboard.isDown("w") and teleport.direction == "up" then
                        self.gameState.levelSwitch = teleport
                    elseif love.keyboard.isDown("s") and teleport.direction == "down" then
                        self.gameState.levelSwitch = teleport
                    elseif love.keyboard.isDown("a") and teleport.direction == "left" then
                        self.gameState.levelSwitch = teleport
                    elseif love.keyboard.isDown("d") and teleport.direction == "right" then
                        self.gameState.levelSwitch = teleport
                    end
                end
            end
        end
    end
end

return CollisionHandlerSystem
