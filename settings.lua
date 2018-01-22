data:extend({
    {
        type = "bool-setting",
        name = "cement-shoes-replacement-concrete-stone",
        setting_type = "runtime-per-user",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "cement-shoes-replacement-stone-concrete",
        setting_type = "runtime-per-user",
        default_value = false
    },
	{
        type = "double-setting",
        name = "cement-shoes-placement-volume",
        setting_type = "runtime-per-user",
        minimum_value = 0,
		maximum_value = 1,
        default_value = 1
    },
})