local SpriteRenderSystem = tiny.processingSystem()

SpriteRenderSystem.filter = tiny.requireAll("playerControl", "bumpMotion", "animation")

function SpriteRenderSystem:process(e, dt)
    local playerControl = e.playerControl
    local speed = playerControl.speed
    local motion = e.bumpMotion
    local walking = false
    if (e.playerControl.enabled) then
        if love.keyboard.isDown("w") then
            motion.y = motion.y - (speed * dt)
            playerControl.facing = "up"
            walking = true
        elseif love.keyboard.isDown("s") then
            motion.y = motion.y + (speed * dt)
            playerControl.facing = "down"
            walking = true
        end

        if love.keyboard.isDown("a") then
            motion.x = motion.x - (speed * dt)
            playerControl.facing = "left"
            walking = true
        elseif love.keyboard.isDown("d") then
            motion.x = motion.x + (speed * dt)
            playerControl.facing = "right"
            walking = true
        end
    end

    local anim = e.animation
    if (walking) then
        if (playerControl.facing == "left") then anim.next = "walkleft" end
        if (playerControl.facing == "right") then anim.next = "walkright" end
        if (playerControl.facing == "up") then anim.next = "walkup" end
        if (playerControl.facing == "down") then anim.next = "walkdown" end
    else
        if (playerControl.facing == "left") then anim.next = "idleleft" end
        if (playerControl.facing == "right") then anim.next = "idleright" end
        if (playerControl.facing == "up") then anim.next = "idleup" end
        if (playerControl.facing == "down") then anim.next = "idledown" end
    end
end

return SpriteRenderSystem
