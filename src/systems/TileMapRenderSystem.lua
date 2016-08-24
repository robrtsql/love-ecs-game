local TileMapRenderSystem = tiny.system()

function TileMapRenderSystem:init(tileMap, bumpWorld, camera)
	self.tileMap = tileMap
	self.bumpWorld = bumpWorld
	self.cam = camera
end

function TileMapRenderSystem:update(dt)
	--clamp values
	local camX, camY = self.cam:position()
	local mapWidth = self.tileMap.width * self.tileMap.tilewidth
	local mapHeight = self.tileMap.height * self.tileMap.tileheight
	local factor = 2 * self.cam.scale
	local minX = love.graphics.getWidth() / factor
	local minY = love.graphics.getHeight() / factor
	local maxX = mapWidth - love.graphics.getWidth() / factor
	local maxY = mapHeight - love.graphics.getHeight() / factor
	camX = math.max(minX, camX)
	camX = math.min(maxX, camX)
	camY = math.max(minY, camY)
	camY = math.min(maxY, camY)
	self.cam:lookAt(camX, camY)
	self.cam:attach()
	self.tileMap:update(dt)
	--TODO: we should cull some tiles via this draw range
	--self.tileMap:setDrawRange(-l, -t, w, h)
	self.tileMap:draw()
	--self.tileMap:bump_draw(bumpWorld)
	self.cam:detach()
end

return TileMapRenderSystem
