game.reload_script()

for i, force in pairs (game.forces) do

  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["cement-shoes-equipment"].researched then
	force.recipes["cement-shoes"].enabled = true
    force.recipes["brick-shoes"].enabled = true
	force.recipes["landfill-shoes"].enabled = true
  end
end