data:extend(
{
  {
    type = "technology",
    name = "cement-shoes-equipment",
    icon = "__Cement Shoes__/graphics/technology/cement-shoes-equipment.png",	
	icon_size = 128,
    prerequisites = {"modular-armor"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cement-shoes"
      }
    },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 15
    },
  },
  }
)