Player = {}

Player.create = function()
  local self = {}
  self.x = 600
  self.y = 321
  self.speed_x = 2
  self.speed_y = 2
  self.direction = "right"
  self.state = "normal"

  self.move = function()
    if love.keyboard.isDown("down") then
      self.y = self.y + self.speed_y
    elseif love.keyboard.isDown("up") then
      self.y = self.y - self.speed_y
    end

    if love.keyboard.isDown("right") then
      self.x = self.x + self.speed_x
      self.direction = "right"
    elseif love.keyboard.isDown("left") then
      self.x = self.x - self.speed_x
      self.direction = "left"
    end
  end

  self.munch = function()
    self.state = "open"
    -- score points here
  end

  self.digest = function()
    if self.state == "open" then
      self.state = "halfOpen"
    elseif self.state == "halfOpen" then
      self.state = "normal"
    end
  end

  self.getImage = function()
    if self.direction == "right" then
      if self.state == "normal" then
        return love.graphics.newImage("assets/player-right-close-mouth.png")
      elseif self.state == "halfOpen" then
        return love.graphics.newImage("assets/player-right-half-open-mouth.png")
      else
        return love.graphics.newImage("assets/player-right-open-mouth.png")
      end
    elseif self.state == "normal" then
      return love.graphics.newImage("assets/player-left-close-mouth.png")
    elseif self.state == "halfOpen" then
      return love.graphics.newImage("assets/player-left-half-open-mouth.png")
    else
      return love.graphics.newImage("assets/player-left-open-mouth.png")
    end
  end

  return self
end