import mods.gregtech.recipe.RecipeMap;

recipes.remove(<minecraft:shield>);
recipes.remove(<minecraft:planks>);


//Shield
recipes.addShaped(<minecraft:shield>,
[[<magicaltech:iron_screw_x2>, <metaitem:plateWood>      , <magicaltech:iron_screw_x2>],
 [<metaitem:tool.screwdriver>, <magicaltech:shield_frame>, <metaitem:ringIron>        ],
 [<magicaltech:iron_screw_x2>, <metaitem:plateWood>      , <magicaltech:iron_screw_x2>]]);

//Oak Plank
recipes.addShapeless(<minecraft:planks> * 2,
 [<minecraft:log>]);


//
//
//
//
//
