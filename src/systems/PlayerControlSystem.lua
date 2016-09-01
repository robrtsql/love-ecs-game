local PlayerControlSystem = tiny.processingSystem()

PlayerControlSystem.filter = tiny.requireAll("playerControl", "bumpMotion",
    "animation", "position")

function PlayerControlSystem:init(bumpWorld)
    self.bumpWorld = bumpWorld
    self.held = {}
end

function PlayerControlSystem:process(e, dt)
    local playerControl, walking = self:_handleKeys(e, dt)
    self:_chooseAnimation(playerControl, walking, e)

    local isPeriodPressed = self:_getPeriodKeypress()
    if isPeriodPressed then
        local pos = e.position
        local bumpWorld = self.bumpWorld
        local o = e.animation.offset
        local ahead = nil
        if (playerControl.facing == "left") then ahead={x=pos.x-1,y=pos.y} end
        if (playerControl.facing == "right") then ahead={x=pos.x+16,y=pos.y}end
        if (playerControl.facing == "up") then ahead={x=pos.x,y=pos.y-1} end
        if (playerControl.facing == "down") then ahead={x=pos.x,y=pos.y+16} end
        local items, len = bumpWorld:queryPoint(ahead.x, ahead.y)
        for _, item in ipairs(items) do
            if item.type == 'sign' then
                print(item.properties.message)
            end

        end
    end
end

function PlayerControlSystem:_getPeriodKeypress()
    if love.keyboard.isDown(".") then
        if not self.held.period then
            self.held.period = true
            return true
        end
    else
        self.held.period = nil
    end
end

function PlayerControlSystem:_handleKeys(e, dt)
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

    return playerControl, walking
end

function PlayerControlSystem:_chooseAnimation(playerControl, walking, e)
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

return PlayerControlSystem
