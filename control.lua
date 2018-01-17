local function place(game, player, radius, inventory_type, tile_type, ignore_func, replace_mapping)
	local tiles = {};
	local inventory = player.get_inventory(defines.inventory.player_main)
	local inventory_count = inventory.get_item_count(inventory_type)
	local placement_count = 0
	local replace_counts = {};
	for i=-radius,radius do
		for j=-radius,radius do
			if placement_count < inventory_count then
				local tile_to_replace = player.surface.get_tile(player.character.position.x+i,player.character.position.y+j).name
				if not ignore_func(tile_to_replace) then
					tiles[#tiles+1]={name=tile_type,position={player.character.position.x+i,player.character.position.y+j}}
					placement_count = placement_count + 1
					local replaced = replace_mapping[tile_to_replace]
					if replaced then
						if replace_counts[replaced] then
							replace_counts[replaced] = replace_counts[replaced] + 1
						else
							replace_counts[replaced] = 1
						end
					end
				end
			end
		end
	end
	if placement_count > 0 then
		inventory.remove({name=inventory_type, count=placement_count})
		for tile, count in pairs(replace_counts) do
			inventory.insert({name=tile,count=count})
		end
		player.surface.set_tiles(tiles)
		player.surface.play_sound{path='entity-build/radar', position=player.position}
	end
end

script.on_event({defines.events.on_player_changed_position},
   function (e)
    local player = game.players[e.player_index];
	if player.vehicle then
		return -- TODO: check vehicle's grid and inventory instead
	else
		local armor = player.get_inventory(defines.inventory.player_armor)[1]
		if armor ~= nil then
			local cement_shoes_count = armor.grid.get_contents()['cement-shoes-equipment']
			if cement_shoes_count ~= nil and cement_shoes_count >= 1 then
				place(game, player, cement_shoes_count - 1, 'concrete', 'concrete', function(ignore_tile)
					return string.find(ignore_tile, 'concrete') or ignore_tile == 'water'
				end, {['stone-path']='stone-brick'})
			else
				local brick_shoes_count = armor.grid.get_contents()['brick-shoes-equipment']
				if brick_shoes_count ~= nil and brick_shoes_count >= 1 then
					place(game, player, brick_shoes_count - 1, 'stone-brick', 'stone-path', function(ignore_tile)
					return string.find(ignore_tile, 'concrete') or ignore_tile == 'stone-path' or ignore_tile == 'water'
				end, {})
				end
			end
		end
	end
   end
)