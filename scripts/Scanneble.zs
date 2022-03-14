import mods.gregtech.recipe.RecipeMap;

//Assembler Machine
val assembler as RecipeMap = <recipemap:assembler>;

recipes.remove(<scannable:scanner>);
recipes.remove(<scannable:module_blank>);
recipes.remove(<scannable:module_range>);
recipes.remove(<scannable:module_animal>);
recipes.remove(<scannable:module_monster>);
recipes.remove(<scannable:module_ore_common>);
recipes.remove(<scannable:module_ore_rare>);
recipes.remove(<scannable:module_block>);
recipes.remove(<scannable:module_structure>);
recipes.remove(<scannable:module_fluid>);
recipes.remove(<scannable:module_entity>);

//Scanner
assembler.recipeBuilder()
 .inputs([
  <metaitem:plateStainlessSteel> * 6, <metaitem:stickSteel> * 2, <metaitem:screwIron> * 4,
  <metaitem:circuit.advanced_integrated> * 2, <metaitem:sensor.hv> * 2, <minecraft:glass_pane>,
  <metaitem:battery.re.hv.lithium>, <metaitem:circuit.integrated>.withTag({Configuration: 8})])
 .outputs(<scannable:scanner>)
 .duration(200)
 .EUt(510)
 .buildAndRegister();

//Blank Scanner Module
recipes.addShaped(<scannable:module_blank>,
 [[<metaitem:circuit.advanced_integrated>, <metaitem:board.fiber_reinforced>, <metaitem:circuit.advanced_integrated>],
  [<metaitem:foilElectrum>               , <metaitem:wireGtSingleElectrum>  , <metaitem:foilElectrum>               ],
  [null                                  , null                             , null                                  ]]);

//Scanner Module:Range
recipes.addShapeless(<scannable:module_range>,
 [<metaitem:wireless>, <scannable:module_blank>]);

//Scanner Module:Monsters
recipes.addShaped(<scannable:module_monster>,
[[null                               , <deepmoblearning:data_model_zombie> , null                                 ],
 [<deepmoblearning:data_model_spider>, <scannable:module_blank>            , <deepmoblearning:data_model_skeleton>],
 [null                               , <deepmoblearning:data_model_creeper>, null                                 ]]);

//Scanner Module:Animals
assembler.recipeBuilder()
.inputs([
 <scannable:module_monster>, <metaitem:circuit.integrated>.withTag({Configuration: 1})])
.outputs(<scannable:module_animal>)
.duration(20)
.EUt(110)
.buildAndRegister();

//Scanner Module:Common Ores
assembler.recipeBuilder()
.inputs([
 <metaitem:emitter.lv>, <scannable:module_blank>, <minecraft:coal>, <metaitem:circuit.integrated>.withTag({Configuration: 1})])
.outputs(<scannable:module_ore_common>)
.duration(20)
.EUt(110)
.buildAndRegister();

//Scanner Module:Rare Ores
assembler.recipeBuilder()
.inputs([
 <metaitem:emitter.hv>, <scannable:module_blank>, <minecraft:diamond>, <metaitem:circuit.integrated>.withTag({Configuration: 1})])
.outputs(<scannable:module_ore_rare>)
.duration(20)
.EUt(220)
.buildAndRegister();

//Scanner Module:Block
recipes.addShaped(<scannable:module_block>,
[[<minecraft:grass>  , <metaitem:emitter.lv>   , <minecraft:stone:0>],
 [<minecraft:stone:1>, <scannable:module_blank>, <minecraft:stone:5>],
 [<minecraft:gravel> , <minecraft:stone:3>     , <minecraft:sand:0> ]]);

//Scanner Module:Structures
recipes.addShaped(<scannable:module_structure>,
[[<minecraft:planks:0>    , <metaitem:emitter.lv>   , <minecraft:purpur_block>],
 [<minecraft:nether_brick>, <scannable:module_blank>, <minecraft:stonebrick:0>],
 [null                    , <minecraft:bookshelf>   , null                    ]]);

//Scanner Module:Fluids
assembler.recipeBuilder()
.inputs([
 <scannable:module_blank>, <metaitem:emitter.lv>, <bloodmagic:component:0>, 
 <bloodmagic:component:1>, <metaitem:circuit.integrated>.withTag({Configuration: 1})])
.outputs(<scannable:module_fluid>)
.duration(20)
.EUt(110)
.buildAndRegister();

//Scanner Module:Entity
assembler.recipeBuilder()
.inputs([
 <scannable:module_animal>, <scannable:module_monster>, <metaitem:circuit.integrated>.withTag({Configuration: 2})])
.outputs(<scannable:module_entity>)
.duration(20)
.EUt(110)
.buildAndRegister();
