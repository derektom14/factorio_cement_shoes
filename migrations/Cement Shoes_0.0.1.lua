game.reload_script()
local a = 5

if not next(game.forces) then
	a[7] = 3
end

for i, force in pairs (game.forces) do

  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["cement-shoes-equipment"].researched then
	force.recipes["cement-shoes"].enabled = true
    force.recipes["brick-shoes"].enabled = true
  end
end