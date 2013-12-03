require "timer"

Enemy = {}

local timer = Timer.create()

Enemy.create = function()
  local self = {}
  self.speed_x = 1
  self.speed_y = 2

  if math.random() < 0.5 then
    print "Spawned fish going left"
    self.direction = "left"
    self.image = love.graphics.newImage("assets/small-fish-left.png")
    self.x = WINDOW.width
    self.y = math.random() * WINDOW.height
  else
    print "Spawned fish going right"
    self.direction = "right"
    self.image = love.graphics.newImage("assets/small-fish-right.png")
    self.x = 0
    self.y = math.random() * WINDOW.height
  end

  self.move = function()
    if(self.direction == "right") then
      self.x = self.x + self.speed_x
    else
      self.x = self.x - self.speed_x
    end
    self.y = self.y + (math.random() * self.speed_y) - 1 -- Normalize around 0
  end

  return self
end

Enemy.isTimeToSpawn = function()
  local spawnTime = 3
  return timer.hasTimePassed(spawnTime)
end
