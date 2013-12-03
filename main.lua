require "player"
require "enemy"

background = love.graphics.newImage("assets/background.png")
background:setFilter("nearest", "nearest")

WINDOW = {width = 1200, height = 642}

function love.load()
  love.graphics.setMode(WINDOW.width, WINDOW.height)
  player = Player.create()
  enemies = {}
end

function love.update(dt)
  player.digest()
  player.move()
  if(Enemy.isTimeToSpawn()) then
    table.insert(enemies, Enemy.create())
  end

  for i, enemy in pairs(enemies) do
    -- Hacky way to get center of fish since it's late
    if math.abs(player.x + 15 - enemy.x + 10) < 20 and math.abs(player.y + 15 - enemy.y + 10) < 20 then
      player.munch()
      table.remove(enemies, i)
    end

    enemy.move()
  end
end

function love.draw()
  love.graphics.draw(background, 0, 0, 0, 2, 2)
  love.graphics.draw(player.getImage(), player.x, player.y)
  -- Hacky way to get center of fish since it's late
  love.graphics.rectangle("fill", player.x + 15, player.y + 15, 2, 2)

  for i, enemy in pairs(enemies) do
    love.graphics.draw(enemy.image, enemy.x, enemy.y)
    -- Hacky way to get center of fish since it's late
    love.graphics.rectangle("fill", enemy.x + 10, enemy.y + 10, 2, 2)
  end
end