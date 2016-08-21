local SpriteRenderSystem = tiny.processingSystem()

SpriteRenderSystem.filter = tiny.requireAll("playerControl", "bumpMotion")

function SpriteRenderSystem:process(e, dt)
    local speed = 100
    local motion = e.bumpMotion
    if (e.playerControl) then
        if love.keyboard.isDown("w") then
            motion.y = motion.y - (speed * dt)
        elseif love.keyboard.isDown("s") then
            motion.y = motion.y + (speed * dt)
        end

        if love.keyboard.isDown("a") then
            motion.x = motion.x - (speed * dt)
        elseif love.keyboard.isDown("d") then
            motion.x = motion.x + (speed * dt)
        end
    end
end

return SpriteRenderSystem
