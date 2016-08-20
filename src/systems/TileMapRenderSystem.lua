local TileMapRenderSystem = tiny.system()

function TileMapRenderSystem:init(tileMap)
	--self.camera = camera
	function self.drawFn(l, t, w, h)
        tileMap:update(dt)
        --tileMap:setDrawRange(-l, -t, w, h)
        tileMap:draw()
    end
end

function TileMapRenderSystem:update(dt)
	--self.camera:draw(self.drawFn)
    self.drawFn()
end

return TileMapRenderSystem
