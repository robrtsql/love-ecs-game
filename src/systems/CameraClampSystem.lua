local CameraClampSystem = tiny.processingSystem()

CameraClampSystem.filter = tiny.requireAll("tileMap", "cameraClamp")

function CameraClampSystem:init(camera)
	self.cam = camera
end

function CameraClampSystem:process(e, dt)
	if (e.cameraClamp) then
		local tileMap = e.tileMap
		local camX, camY = self.cam:position()
		local mapWidth = tileMap.width * tileMap.tilewidth
		local mapHeight = tileMap.height * tileMap.tileheight
		local factor = 2 * self.cam.scale
		local minX = love.graphics.getWidth() / factor
		local minY = love.graphics.getHeight() / factor
		local maxX = mapWidth - love.graphics.getWidth() / factor
		local maxY = mapHeight - love.graphics.getHeight() / factor
		camX = math.max(minX, camX)
		camX = math.min(maxX, camX)
		camX = math.floor(camX + 0.5)
		camY = math.max(minY, camY)
		camY = math.min(maxY, camY)
		camY = math.floor(camY + 0.5)
		self.cam:lookAt(camX, camY)
	end
end

return CameraClampSystem
