local function place(player, entity, inventory, radius, inventory_type, tile_type, ignore_func, replace_mapping)
	local tiles = {};
	local inventory_count = inventory.get_item_count(inventory_type)
	local placement_count = 0
	local replace_counts = {};
	for i=-radius,radius do
		for j=-radius,radius do
			if placement_count < inventory_count then
				local tile_to_replace = entity.surface.get_tile(entity.position.x+i,entity.position.y+j).name
				local replaced = replace_mapping[tile_to_replace]
				if replaced or not ignore_func(tile_to_replace) then
					tiles[#tiles+1]={name=tile_type,position={entity.position.x+i,entity.position.y+j}}
					placement_count = placement_count + 1
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
		entity.surface.set_tiles(tiles)
		entity.surface.play_sound{path='entity-build/radar', position=entity.position, volume_modifier=settings.get_player_settings(player)['cement-shoes-placement-volume'].value}
	end
end

local function check_for_shoes(player, entity, grid, inventory_kind)
	if not grid then
		return
	end
	local landfill_shoes_count = grid.get_contents()['landfill-shoes-equipment']
	if landfill_shoes_count ~= nil and landfill_shoes_count >= 1 then
		place(player, entity, entity.get_inventory(inventory_kind), landfill_shoes_count, 'landfill', 'grass-1', function(ignore_tile)
			return not string.find(ignore_tile, 'water')
		end, {})
	end

	local brick_shoes_count = grid.get_contents()['brick-shoes-equipment']
	if brick_shoes_count ~= nil and brick_shoes_count >= 1 then
		local setting_brick_replace_concrete = settings.get_player_settings(player)['cement-shoes-replacement-stone-concrete'].value
		local replace_dict = setting_brick_replace_concrete and {concrete='concrete'} or {}
		place(player, entity, entity.get_inventory(inventory_kind), brick_shoes_count - 1, 'stone-brick', 'stone-path', function(ignore_tile)
			return string.find(ignore_tile, 'concrete') or ignore_tile == 'stone-path' or string.find(ignore_tile, 'water')
		end, replace_dict)
	end

	local cement_shoes_count = grid.get_contents()['cement-shoes-equipment']
	if cement_shoes_count ~= nil and cement_shoes_count >= 1 then
		local setting_concrete_replace_brick = settings.get_player_settings(player)['cement-shoes-replacement-concrete-stone'].value
		local replace_dict = setting_concrete_replace_brick and {['stone-path']='stone-brick'} or {}
		place(player, entity, entity.get_inventory(inventory_kind), cement_shoes_count - 1, 'concrete', 'concrete', function(ignore_tile)
			return string.find(ignore_tile, 'concrete') or ignore_tile == 'stone-path' or string.find(ignore_tile, 'water')
		end, replace_dict)
	end
end

script.on_event({defines.events.on_player_changed_position},
   function (e)
    local player = game.players[e.player_index];
	if player.vehicle then
		check_for_shoes(player, player.vehicle, player.vehicle.grid, defines.inventory.car_trunk)
	else
		local armor_inventory = player.get_inventory(defines.inventory.player_armor)
		if armor_inventory.get_item_count() > 0 then
			check_for_shoes(player, player, armor_inventory[1].grid, defines.inventory.player_main)
		end
	end
   end
)