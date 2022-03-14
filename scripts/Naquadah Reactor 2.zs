import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;

// Naquadah Reactor 2
val naquadah_reactor_2 = Builder.start("naquadah_reactor_2")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GOG",
                "GOG",
                "GOG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('G', <blockstate:nuclearcraft:reactor_casing_transparent>)
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('O', <metastate:extendedcrafting:storage:4>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_2")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();

naquadah_reactor_2.hasMufflerMechanics = false;
naquadah_reactor_2.hasMaintenanceMechanics = false;

naquadah_reactor_2.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return [recipe.getEUt(), recipe.getDuration()];
} as IRunOverclockingLogicFunction;


// Naquadah Reactor Mk2 Recipes
naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(7500)
    .EUt(-1048576)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();