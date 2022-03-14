#loader gregtech

// import the MaterialBuilder and Material classes for making new materials
import mods.gregtech.material.Elements;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialIconSet;

//#https://github.com/GregTechCEu/GregTech/src/main/j

var Sp = Elements.add(200, 200, -1, null, "Spacium", "Sp", false);
var Ma = Elements.add(201, 201, -1, null, "Magical", "Ma", false);
var Dr = Elements.add(202, 202, -1, null, "Draconium", "Dc", false);
var ADr = Elements.add(203, 203, -1, null, "Awakeneddraconium", "Dc*", false);
var Ic = Elements.add(204, 204, -1, null, "Icor", "Ic", false);
var Ig = Elements.add(205, 205, -1, null, "Imag", "Ig", false);
var Nx = Elements.add(0 , 0, -1, null, "Darkmatter", "Notexist", false);
var AntiH = Elements.add(0 , 0, -1, null, "Antihydrogen", "-H", false);
var AntiHe = Elements.add(0 , 0, -1, null, "Antihelium", "-He", false);
var If = Elements.add(999, 999, -1, null, "Infinity", "If", false);

var draconium = MaterialBuilder(32001, "draconium")
	.fluid()
	.plasma()
	.ingot()
	.iconSet("SHINY")
	.color(0x8c00ff)
	.toolStats(200,50000,999999,200) //speed,damage,durability,enchantability
	.blastTemp(10800)
	.ore()
	.cableProperties(2097152,128,0,false) //(8388608,512,0,false)
	//.fluidPipeProperties(1000000,524288,true)
	.element("Draconium")
	.build();

var awakened_draconium = MaterialBuilder(32002, "draconium_awakened")
	.fluid()
	.plasma()
	.ingot()
	.iconSet("SHINY")
	.color(0xff6000)
	.toolStats(200,50000,999999,200) //speed,damage,durability,enchantability
	.blastTemp(10800)
	.ore()
	.cableProperties(2097152,128,0,false) //(8388608,512,0,false)
	//.fluidPipeProperties(1000000,524288,true)
	.element("Awakeneddraconium")
	.build();

var infinity = MaterialBuilder(32003, "infinity")
	.fluid()
	.iconSet("SHINY")
	.color(0xffffff)
	.blastTemp(10800)
	.ore()
	.cableProperties(2097152,512,0,false) //(2097152512,512,0,false)
	//.fluidPipeProperties(1000000,524288,true)
	.element("Infinity")
	.build();

var imag = MaterialBuilder(32004, "imag")
	.fluid("fluid", true)
	.fluidTemp(1)
	.element("Imag")
	.color(0x000000)
	.build();

var constraint = MaterialBuilder(32005, "constraint")
    .fluid()
    .ingot()
    .color(0xf5c787) // pure red
    .components([<material:iron> * 1, <material:imag> * 1]) // set the components
    .build(); // build the actual material

var darkmatter = MaterialBuilder(32006, "dark_matter")
	.fluid()
	.plasma()
	.ingot()
	.iconSet("DULL")
	.color(0xffffff)
	.toolStats(200,50000,999999,200) //speed,damage,durability,enchantability
	.blastTemp(8000)
	.ore()
	.cableProperties(2097152,128,0,false) //(8388608,512,0,false)
	//.fluidPipeProperties(1000000,524288,true)
	.element("Darkmatter")
	.build();

var antihydrogen = MaterialBuilder(32007, "anti_hydrogen")
	.fluid("fluid", false)
	.fluidTemp(14)
	.color(0xff9d9d)
	.element("Antihydrogen")
	.build();

var antihelium = MaterialBuilder(32008, "anti_helium")
	.fluid("fluid", false)
	.fluidTemp(14)
	.color(0xff9d9d)
	.element("Antihelium")
	.build();

var spacium = MaterialBuilder(32009, "spacium")
	.element("Spacium")
	.build();

var cosmic_neutronium = MaterialBuilder(32010, "cosmic_neutronium")
	.fluid()
	.iconSet("SHINY")
	.color(0x000000)
	.blastTemp(10800)
	.cableProperties(33554432,512,0,false)
	.components([<material:neutronium> * 1, <material:spacium> * 1])
	.build();

var samariumcobalt = MaterialBuilder(32011, "samariumcobalt")
	.ingot()
	.color(0xF7B29B)
	.iconSet("MAGNETIC")
	.flags(["generate_plate", "generate_rod", "generate_long_rod", "decomposition_by_centrifuging"])
	.blastTemp(1345)
	.addOreByproducts(<material:samarium>, <material:cobalt>)
	.components([<material:samarium> * 2, <material:cobalt> * 17])
	.colorAverage()
	.build();
