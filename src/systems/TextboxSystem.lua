local TextboxSystem = tiny.processingSystem()

TextboxSystem.filter = tiny.requireAll("textbox")

function TextboxSystem:init(camera)
    self.cam = camera
end

function TextboxSystem:process(e, dt)
    if e.textbox.index > 0 then
        self.cam:attach()
        love.graphics.draw(e.textbox.image, e.textbox.x, e.textbox.y)
        self.cam:detach()

        e.textbox.textblocks[e.textbox.index]:update(dt)

        love.graphics.setFont(e.textbox.font)
        e.textbox.textblocks[e.textbox.index]:draw(e.textbox)
    end
end

return TextboxSystem
