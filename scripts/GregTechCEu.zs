import mods.gregtech.recipe.RecipeMap;

// Block of Dark Matter
<recipemap:arc_furnace>.findRecipe(30, [<jaopca:item_platedensedarkmatter:0>], [<liquid:oxygen>]).remove();
<recipemap:extruder>.findRecipe(240, [<metaitem:ingotDarkMatter> * 9, <metaitem:shape.extruder.block>], null).remove();
<recipemap:alloy_smelter>.findRecipe(120, [<metaitem:ingotDarkMatter> * 9, <metaitem:shape.mold.block>], null).remove();
// Hot Dark Matter Ingot
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustDarkMatter>], null).remove();
// Dark Matter Ingot
<recipemap:arc_furnace>.findRecipe(30, [<jaopca:item_geardarkmatter:0>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:cableGtDoubleDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadSawDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadSenseDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:blockDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadSwordDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:wireGtDoubleDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadShovelDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:wireGtHexDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadHammerDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadPickaxeDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:wireGtOctalDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:plateDoubleDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadHoeDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadBuzzSawDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:wireGtQuadrupleDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadFileDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadAxeDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:cableGtHexDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:plateDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:cableGtOctalDarkMatter>], [<liquid:oxygen>]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:cableGtQuadrupleDarkMatter>], [<liquid:oxygen> * 3]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadWrenchDarkMatter>], [<liquid:oxygen> * 6]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadChainsawDarkMatter>], [<liquid:oxygen> * 6]).remove();
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:toolHeadDrillDarkMatter>], [<liquid:oxygen> * 56]).remove();

//Assembler Machine
val chemical_reactor as RecipeMap = <recipemap:chemical_reactor>;

//AC Imag to GTCEu Imag
chemical_reactor.recipeBuilder()
 .inputs(<academy:matter_unit:1>)
 .outputs(<academy:matter_unit>)
 .fluidOutputs(<liquid:imag>)
 .circuit(31)
 .duration(20)
 .EUt(32768)
 .buildAndRegister();

//GTCEu Imag to AC Imag
 chemical_reactor.recipeBuilder()
 .inputs(<academy:matter_unit>)
 .outputs(<academy:matter_unit:1>)
 .fluidInputs(<liquid:imag>)
 .circuit(32)
 .duration(20)
 .EUt(32768)
 .buildAndRegister();

 //Dark Matter(GTCEu:Original)
chemical_reactor.recipeBuilder()
 .inputs(<avaritia:resource:5>)
 .notConsumable(<metaitem:nan.certificate>)
 .fluidInputs([<liquid:imag> * 3000, <liquid:blockfluidantimatter> * 5000])
 .outputs(<metaitem:ingotDarkMatter>)
 .duration(4000)//40001024000
 .EUt(134217728)//134217728(UMV)524288
 .buildAndRegister();