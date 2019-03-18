data:extend(
{
  {
    type = "movement-bonus-equipment",
    name = "cement-shoes-equipment",
    sprite =
    {
      filename = "__Cement Shoes__/graphics/equipment/cement-shoes-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
	
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    categories = {"armor"},
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
        buffer_capacity = "0kJ",
	},
	energy_consumption = "1kW",
	movement_bonus = 0.0,
  },
  {
    type = "movement-bonus-equipment",
    name = "brick-shoes-equipment",
    sprite =
    {
      filename = "__Cement Shoes__/graphics/equipment/brick-shoes-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },

    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    categories = {"armor"},
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
        buffer_capacity = "0kJ",
	},
	energy_consumption = "1kW",
	movement_bonus = 0.0,
  },
  {
    type = "movement-bonus-equipment",
    name = "landfill-shoes-equipment",
    sprite =
    {
      filename = "__Cement Shoes__/graphics/equipment/landfill-shoes-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },

    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    categories = {"armor"},
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
        buffer_capacity = "0kJ",
	},
	energy_consumption = "1kW",
	movement_bonus = 0.0,
  },
}
)