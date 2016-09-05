Textblock = {}
Textblock.__index = Textblock

function Textblock.new(text, font)
    local self = {}
    setmetatable(self,Textblock)
    self.text = text
    self.chars = {}
    self.font = font
    self.timer = 0.02
    local offset = 0
    for i=1, string.len(text) do
        local char = text:sub(i,i)
        table.insert(self.chars, {char=char,offset=offset})
        offset = offset + font:getWidth(char)
    end
    self.index = 1
    return self
end

function Textblock:update(dt)
    if self.index < string.len(self.text) then
        if self.timer < 0 then
            self.index = self.index + 1
            self.timer = 0.02
        else
            self.timer = self.timer - dt
        end
    end
end

function Textblock:draw(textbox)
    for i=1, self.index do
        local letter = self.chars[i]
        local xPos = (textbox.x + textbox.scale) + letter.offset
        local yPos = textbox.y * textbox.scale
        love.graphics.print(letter.char, xPos, yPos)
    end
end

function Textblock:advanceTextIfTyping()
    local textlen = string.len(self.text)
    if self.index ~= textlen then
        self.index = textlen
        return true
    else
        return false
    end
end

return Textblock
