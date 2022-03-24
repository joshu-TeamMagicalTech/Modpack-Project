import mods.gregtech.recipe.RecipeMap;

recipes.remove(<minecraft:shield>);
recipes.remove(<minecraft:planks>);


//Shield
recipes.addShaped(<minecraft:shield>,
[[<test:iron_screw_x2>, <metaitem:plateWood>      , <test:iron_screw_x2>],
 [<metaitem:tool.screwdriver>, <test:shield_frame>, <metaitem:ringIron>        ],
 [<test:iron_screw_x2>, <metaitem:plateWood>      , <test:iron_screw_x2>]]);

//Oak Plank
recipes.addShapeless(<minecraft:planks> * 2,
 [<minecraft:log>]);


//
//
//
//
//
