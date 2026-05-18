# Item and Fluid Costs

## Legend

| Icon | Meaning                                      |
| ---- | -------------------------------------------- |
| (X)  | aq(aquilo), fu, sp, gb, nv,                  |
| null | null                                         |
| \*   | see notes.                                   |
| i    | the value of the item as ingredient.         |
| r    | the value of the recipe that makes the item. |
| b    | byproduct, value reduced.                    |
| !!   | pending recalc.                              |

> [!NOTE]
> The "-" is between the `icon` and the `value` to make the copying easier, it has no meaning.

## Metals/Ore/smelting

| ItemID                                 | Cost |
| -------------------------------------- | ---- |
| angels-\<ore_name\>                    | 6    |
| angels-\<ore_name\>-crushed            | 6    |
| angels-\<ore_name\>-chunk              | 7    |
| angels-\<ore_name\>-crystal            | 14   |
| angels-\<ore_name\>-pure               | 18   |
| angels-nugget-\<metal_name\>           | 15   |
| angels-pebbles-\<metal_name\>          | 5    |
| angels-slag-\<metal_name\>             | ?    |
| angels-liquid-molten-\<metal_name\>    | 1    |
| angels-processed-\<metal_name\>        | 20   |
| angels-pellet-\<metal_name\>           | ?    |
| angels-ingot-\<metal_name\>            | 10   |
| angels-roll-\<metal_name\>             | 40   |
| angels-slag-slurry                     | 1.5  |
| angels-mineral-sludge                  | 2    |
| angels-catalysator-brown               | 25   |
| angels-liquid-ferric-chloride-solution | 0.8  |
| angels-liquid-cupric-chloride-solution | 0.8  |

## Water

| ItemID                        | Cost |
| ----------------------------- | ---- |
| steam                         | 0.5  |
| angels-water-viscous-mud      | 0.2  |
| angels-water-heavy-mud        | 0.3  |
| angels-water-concentrated-mud | 0.4  |
| angels-water-light-mud        | 0.4  |
| angels-water-thin-mud         | 0.4  |
| angels-water-saline           | 0.5  |
| angels-water-mineralized      | 0.5  |
| angels-water-purified         | 0.1  |
| angels-water-yellow-waste(b)  | 0.3  |
| angels-thermal-water          | 0.3  |

## Sediments/Stone

| ItemID                  | Cost |
| ----------------------- | ---- |
| angels-solid-sand       | 2    |
| angels-solid-limestone  | 3    |
| angels-solid-lime       | 4    |
| angels-solid-clay       | 3    |
| angels-solid-mud(b)     | 6    |
| angels-stone-crushed(b) | 4    |
| angels-slag(b)          | 10   |
| angels-solid-cement     | 8    |
| angels-liquid-concrete  | 1    |
| angels-concrete-brick   | 30   |

## Coal/Non Petrochem Gas

| ItemID                      | Cost |
| --------------------------- | ---- |
| coal                        | 6    |
| angels-coal-crushed         | 4    |
| angels-solid-coke           | 5    |
| angels-pellet-coke          | 25   |
| angels-solid-carbon         | 5    |
| angels-gas-carbon-monoxide  | 0.3  |
| angels-gas-carbon-dioxide   | 0.2  |
| angels-gas-hydrogen         | 0.3  |
| angels-gas-chlorine         | 0.3  |
| angels-gas-oxygen           | 0.2  |
| angels-gas-nitrogen         | 0.2  |
| angels-gas-compressed-air   | 0.1  |
| angels-gas-ammonia          | 0.4  |
| angels-gas-nitrogen-dioxide | 0.3  |
| angels-gas-urea             | 0.4  |
| null                        | null |

## Coal/Petrochem Solid

| ItemID                         | Cost |
| ------------------------------ | ---- |
| angels-solid-sodium-sulfate    | 90   |
| angels-solid-calcium-carbonate | 6    |
| null                           | null |

## Salt/Chlor(..)

| ItemID                                 | Cost |
| -------------------------------------- | ---- |
| angels-solid-salt                      | 25   |
| angels-solid-sodium(b0.5)              | 20   |
| angels-solid-sodium-hydroxide(b0.5)    | 20   |
| angels-solid-sodium-hypochlorite       | 35   |
| angels-solid-sodium-chlorate           | 25   |
| angels-solid-sodium-carbonate          | 22   |
| angels-gas-hydrogen-chloride           | 0.4  |
| angels-gas-monochloramine              | 6    |
| angels-gas-hydrazine                   | 4    |
| angels-rocket-fuel-capsule             | 95   |
| angels-liquid-hydrochloric-acid        | 1    |
| angels-liquid-nitric-acid              | 1    |
| angels-liquid-aqueous-sodium-hydroxide | 2    |

## Sulfur

| ItemID                          | Cost  |
| ------------------------------- | ----- |
| angels-gas-hydrogen-sulfide     | 0.6   |
| angels-gas-sulfur-dioxide       | 0.5   |
| angels-gas-acid(b)              | 1     |
| angels-gas-hydrogen-fluoride(b) | 4     |
| angels-liquid-hydrofluoric-acid | 7     |
| angels-solid-calcium-sulfate    | 675!! |
| angels-fluorite-ore             | 180   |

## Petrochem

| ItemID                        | Cost |
| ----------------------------- | ---- |
| angels-liquid-multi-phase-oil | 0.5  |
| angels-gas-natural-1          | 0.3  |
| angels-gas-raw-1              | 0.4  |
| angels-liquid-condensates(b)  | 0.5  |
| angels-liquid-ngl             | 0.3  |
| angels-liquid-naphtha         | 1    |
| angels-liquid-mineral-oil     | 0.8  |
| angels-liquid-fuel-oil        | 0.8  |
| angels-gas-synthesis          | 0.5  |
| angels-gas-residual(b)        | 0.6  |
| angels-solid-oil-residual(b)  | 5    |
| angels-gas-methanol           | 0.6  |
| angels-gas-propene            | 1    |
| angels-gas-methane            | 0.5  |
| angels-gas-benzene            | 0.5  |
| angels-gas-acetone            | 0.8  |
| angels-gas-butane             | 0.3  |
| angels-gas-ethane             | 0.3  |
| angels-liquid-toluene         | 1.4  |
| angels-liquid-phenol          | 0.5  |
| angels-liquid-glycerol        | 0.4  |

## Bio

| ItemID                        | Cost |
| ----------------------------- | ---- |
| angels-algae-green            | 2    |
| angels-algae-brown            | 2    |
| angels-algae-red              | 3    |
| angels-algae-blue             | 2    |
| angels-algae-blue             | 2    |
| angels-cellulose-fiber        | 5    |
| angels-wood-pellets           | 20   |
| angels-wood-charcoal          | 15   |
| angels-gas-puffer-atmosphere  | 0.9  |
| angels-raw-meat(b)            | 180? |
| angels-liquid-fish-atmosphere | 0.4  |
