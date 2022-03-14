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

// Antimatter Generator
<gcym:large_multiblock_casing:8>.displayName = "Noncondusting Casing";
val antimatter_generator = Builder.start("antimatter_generator")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "xNNNNNx",
                "NNDDDNN",
                "xNDDDNx",
                "xNDDDNx",
                "xNNNNNx"
            )
            .aisle(
                "xNNNNNx",
                "NNCCCNN",
                "xNCCCNx",
                "xNCCCNx",
                "xNNNNNx"
            )
            .aisle(
                "xNNNNNx",
                "NNFFFNN",
                "xNFBFNx",
                "xNFFFNx",
                "xxNNNxx"
            )
            .aisle(
                "xNxxxNx",
                "NNNNNNN",
                "xNNBNNx",
                "xNNNNNx",
                "xxNNNxx"
            )
            .aisle(
                "xNNNNNx",
                "NFAAAFN",
                "NFABAFN",
                "NFAAAFN",
                "xNNNNNx"
            )
            .aisle(
                "xNNNNNx",
                "NFAAAFN",
                "IPP PPI",
                "NFAAAFN",
                "xNNNNNx"
            )
            .aisle(
                "xNNNNNx",
                "NFAAAFN",
                "NFAAAFN",
                "NFAAAFN",
                "xNNNNNx"
            )
            .aisle(
                "xNNMNNx",
                "NNNSNNN",
                "xNNNNNx",
                "xNNNNNx",
                "xxNNNxx"
            )
            .where('S', controller.self())
            .where('N', <metastate:gcym:large_multiblock_casing:8>)
            .where('C', <metastate:gregtech:fusion_casing:0>)
            .where('F', <metastate:gregtech:fusion_casing:1>)
            .where('B', <metastate:gregtech:meta_block_compressed_2000:11>)
            .where('A', <metastate:gcym:large_multiblock_casing:11>)
            .where('P', <metastate:gregtech:boiler_casing:3>)
            .where('I', CTPredicate.states(<metastate:gregtech:metal_casing:4>) 
            | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(2).setMaxGlobalLimited(2).setPreviewCount(2)
            )
            .where('M', CTPredicate.states(<metastate:gregtech:metal_casing:4>) 
            | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)
            )
            .where('D', CTPredicate.states(<metastate:gregtech:metal_casing:4>)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(9).setPreviewCount(1)
            )
            .where("x", CTPredicate.getAny())
            .where(" ", CTPredicate.getAir())
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("antimatter_generator")
            .minFluidInputs(2)
            .maxFluidInputs(2)
            .build()
            )
    .withBaseTexture(<metastate:gregtech:metal_casing:4>)
    .buildAndRegister();
antimatter_generator.hasMufflerMechanics = false;
antimatter_generator.hasMaintenanceMechanics = true;

antimatter_generator.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return [recipe.getEUt(), recipe.getDuration()];
} as IRunOverclockingLogicFunction;


// Antimatter Generator Recipes
antimatter_generator.recipeMap
    .recipeBuilder()
    .duration(1862049100)//116378068
    .EUt(-2097152)//33554432
    .fluidInputs([<liquid:anti_hydrogen> * 1000])
    .fluidInputs([<liquid:hydrogen> * 1000])
    .buildAndRegister();