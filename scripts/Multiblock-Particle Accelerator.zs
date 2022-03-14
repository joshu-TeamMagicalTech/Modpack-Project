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

// Particle Accelerator
<gregtech:metal_casing:4>.displayName = "Solid Steel Machine Casing";
val particle_accelerator = Builder.start("particle_accelerator")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "xNxxxxxxxxxxxxxxxxxxxxxNx",
                "xNxxxxxxxxxxxxxxxxxxxxxNx",
                "xNxxxxxxxxxxFxxxxxxxxxxNx",
                "xFFFFFFFFFFFOFFFFFFFFFFFx",
                "xxxxxxxxxxxxFxxxxxxxxxxxx",
                "xxxxxxxxxxxxxxxxxxxxxxxxx"
            )
            .aisle(
                "xxxxxxxxxxxxxxxxxxxxxxxxx",
                "xxxxxxxxxxxxFxxxxxxxxxxxx",
                "xFFFFFFFFFFFCFFFFFFFFFFFx",
                "F  B     B C C B     B  F",
                "xFFFFFFFFFFFCFFFFFFFFFFFx",
                "xxxxxxxxxxxxFxxxxxxxxxxxx"
            )
            .aisle(
                "xxxxxxxxxxxxxxxxxxxxxxxxx",
                "xFFFFFFFFFFFFFFFFFFFFFFFx",
                "F  B     B  C  B     B  F",
                "IPPPPPPPPPPP PPPPPPPPPPPI",
                "F  B     B  C  B     B  F",
                "xFFFFFFFFFFFFFFFFFFFFFFFx"
            )
            .aisle(
                "xxxxxxxxxxxxxxxxxxxxxxxxx",
                "xxxxxxxxxxxxFxxxxxxxxxxxx",
                "xFMFFFFFFFFFCFFFFFFFFFFFx",
                "F  U     U  C  U     U  F",
                "xFFFFFFFFFFFCFFFFFFFFFFFx",
                "xxxxxxxxxxxxFxxxxxxxxxxxx"
            )
            .aisle(
                "xNxxxxxxxxxxxxxxxxxxxxxNx",
                "xNxxxxxxxxxxxxxxxxxxxxxNx",
                "xNxxxxxxxxxxFxxxxxxxxxxNx",
                "xFSEFFFFFEFFEFFEFFFFFEFFx",
                "xxxxxxxxxxxxFxxxxxxxxxxxx",
                "xxxxxxxxxxxxxxxxxxxxxxxxx"
            )
            /*.aisle(
                "FIFF",
                "FSFM"
            )*/
            .where('S', controller.self())
            .where('N', <metastate:gregtech:meta_block_frame_7:15>)
            .where('F', <metastate:gregtech:fusion_casing:4>)
            .where('C', <metastate:gregtech:fusion_casing:1>)
            .where('B', <metastate:gregtech:meta_block_frame_16:4>)
            .where('P', <metastate:gregtech:boiler_casing:0>)
            .where('U', <metastate:gregtech:fusion_casing:0>)
            .where('I', CTPredicate.states(<metastate:gregtech:metal_casing:4>) 
            | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(2).setMaxGlobalLimited(2).setPreviewCount(2)
            )
            .where('O', CTPredicate.states(<metastate:gregtech:metal_casing:4>)
            | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)
            )
            .where('M', CTPredicate.states(<metastate:gregtech:metal_casing:4>) 
            | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)
            )
            .where('E', CTPredicate.states(<metastate:gregtech:metal_casing:4>)
            | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(5).setMaxGlobalLimited(5).setPreviewCount(5)
            )
            .where("x", CTPredicate.getAny())
            .where(" ", CTPredicate.getAir())
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("particle_accelerator")
            .minFluidInputs(2)
            .maxFluidInputs(2)
            .minFluidOutputs(1)
            .maxFluidOutputs(1)
            .build()
            )
    .withBaseTexture(<metastate:gregtech:metal_casing:4>)
    .buildAndRegister();
particle_accelerator.hasMufflerMechanics = false;
particle_accelerator.hasMaintenanceMechanics = true;

particle_accelerator.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return [recipe.getEUt(), recipe.getDuration()];
} as IRunOverclockingLogicFunction;


// Particle Accelerator Recipes
particle_accelerator.recipeMap
    .recipeBuilder()
    .duration(2000)
    .EUt(10485760)
    .fluidInputs([<liquid:naquadah> * 10000])
    .fluidInputs([<liquid:trinium> * 10000])
    .fluidOutputs([<liquid:anti_hydrogen> * 1])
    .buildAndRegister();