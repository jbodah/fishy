Timer = {}

Timer.create = function(obj)
  local self = {}
  local currentValue = love.timer.getTime()

  self.hasTimePassed = function(diff)
    if(love.timer.getTime() - currentValue > diff) then
      currentValue = love.timer.getTime()
      return true
    end
    return false
  end

  return self
end