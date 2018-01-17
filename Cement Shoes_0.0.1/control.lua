script.on_event({defines.events.on_player_changed_position},
   function (e)
    local player = game.players[e.player_index];
	local armor = player.get_inventory(defines.inventory.player_armor)[1]
	if armor ~= nil then
		local cement_shoes_count = armor.grid.get_contents()['cement-shoes-equipment']
		if cement_shoes_count ~= nil and cement_shoes_count >= 1 then
			local tiles={};
			local inventory = player.get_inventory(defines.inventory.player_main)
			local cement_inventory = inventory.get_item_count('concrete')
			local cement_count = 0
			local stone_count = 0 -- any stone path encountered must be put back in the player's inventory
			local area = cement_shoes_count - 1
			for i=-area,area do
				for j=-area,area do
					if cement_count < cement_inventory then
						local tile_name = player.surface.get_tile(player.character.position.x+i,player.character.position.y+j).name
						if not string.find(tile_name, 'concrete') and tile_name ~= 'water' then
							tiles[#tiles+1]={name="concrete",position={player.character.position.x+i,player.character.position.y+j}}
							cement_count = cement_count + 1
							if tile_name == 'stone-path' then
								stone_count = stone_count + 1
							end
						end
					end
				end
			end
			if cement_count > 0 then
				inventory.remove({name="concrete", count=cement_count})
				if stone_count > 0 then
					inventory.insert({name='stone-brick', count=stone_count})
				end
				player.surface.set_tiles(tiles)
				player.surface.play_sound{path='entity-build/radar', position=player.position}
			end
		end
	end
   end
)