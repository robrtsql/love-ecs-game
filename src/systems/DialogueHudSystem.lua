local DialogueHudSystem = tiny.processingSystem()

DialogueHudSystem.filter = tiny.requireAll("hud")

function DialogueHudSystem:init(camera)
    self.cam = camera
end

function DialogueHudSystem:process(e, dt)
    if e.hud.dialogue then
        self.cam:attach()
        love.graphics.draw(e.hud.image, e.hud.x, e.hud.y)

        local printLength = table.getn(e.hud.print)
        if printLength < string.len(e.hud.dialogue) and e.hud.timer < 0 then
            local next = table.getn(e.hud.print) + 1
            table.insert(e.hud.print, e.hud.dialogue:sub(next, next))
            e.hud.timer = 0.02
        else
            e.hud.timer = e.hud.timer - dt
        end

        love.graphics.setFont(e.hud.font)
        for i, char in ipairs(e.hud.print) do
            local offset = i * 8
            love.graphics.pop()
            love.graphics.print(char, (e.hud.x + offset) * e.hud.scale, e.hud.y * e.hud.scale)
            love.graphics.push()
        end
        self.cam:detach()
    end
end

return DialogueHudSystem
