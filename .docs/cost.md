# Item and Fluid Costs

## Legend

| Icon | Meaning                                                 |
| ---- | ------------------------------------------------------- |
| (X)  | aq(aquilo), fu, sp, gb, ~(average of all environments), |
| null | null                                                    |
| \*   | see notes.                                              |
| i    | the value of the item as ingredient.                    |
| r    | the value of the recipe that makes the item.            |
| b    | byproduct, value reduced.                               |
| !!   | pending recalc.                                         |

> [!NOTE]
> The "-" is between the `icon` and the `value` to make the copies easier, it has no meaning.

## Basic Resources

| ItemID         | Cost  |
| -------------- | ----- |
| iron-ore       | 10    |
| copper-ore     | 10    |
| iron-ore(gb)   | 15    |
| copper-ore(gb) | 15    |
| tungsten-ore   | 20    |
| uranium-ore    | 20    |
| holmium-ore    | b-400 |
| scrap          | 5     |
| coal           | 10    |
| stone          | 10    |
| stone(vn)      | b-10  |
| water(na)      | 0.1   |
| water(aq)      | 0.2   |
| ice(fu)        | 100   |
| ice(sp)        | 50    |
| ice(aq)        | 2     |
| null           | null  |

## Intermediate Products

| ItemID                | Cost          |
| --------------------- | ------------- |
| iron-gear-wheel       | 20            |
| iron-plate            | 10            |
| iron-stick            | 5             |
| steel-plate           | 50            |
| copper-plate          | 10            |
| copper-cable          | 5             |
| engine-unit           | 90            |
| explosives            | 15            |
| electronic-circuit    | 25            |
| advanced-circuit      | 100           |
| processing-unit       | 710           |
| quantum-processor     | null          |
| low-density-structure | 375           |
| stone-brick           | 20            |
| sulfur                | 15            |
| sulfur(gb)            | i-18, r-25    |
| sulfur(fg)            | 20            |
| plastic-bar           | 15            |
| plastic-bar(gb)       | 40            |
| carbon                | 50            |
| carbon(gb)            | i-40, r-50    |
| carbon(vn)            | 30            |
| tungsten-carbide      | 75            |
| tungsten-plate        | i-60, r-90    |
| molten-iron           | 1             |
| molten-copper         | 1             |
| holmium-plate         | i=120, r=160  |
| holmium-solution      | 8             |
| electrolyte           | 10            |
| supercapacitor        | i-680, r-1000 |
| superconductor        | i-135, r-200  |
| rocket-part(base)     | 12800         |
| rocket-part(sa)       | 1280          |
| null                  | null          |
| null                  | null          |
| null                  | null          |

## Placeable

| ItemID                   | Cost           |
| ------------------------ | -------------- |
| big-electric-pole        | 310            |
| medium-electric-pole     | 130            |
| inserter                 | 55             |
| burner-inserter          | 30             |
| fast-inserter            | 125            |
| bulk-inserter            | 900            |
| stack-inserter           | 1910           |
| long-handed-inserter     | 85             |
| assembling-machine-1     | 265            |
| assembling-machine-2     | 540            |
| assembling-machine-3     | 3580           |
| boiler                   | 90             |
| stone-furnace            | 50             |
| steel-furnace            | 500            |
| electric-furnace         | 1200           |
| electric-engine-unit     | 170            |
| oil-refinery             | 1500           |
| solar-panel              | 675            |
| beacon                   | 3050           |
| radar                    | 325            |
| small-lamp               | 50             |
| chemical-plant           | 525            |
| cryogenic-plant          | 23000          |
| accumulator              | 270            |
| nuclear-reactor          | 86000          |
| heat-pipe                | 700            |
| heat-exchanger           | 1600           |
| burner-mining-drill      | 140            |
| electric-mining-drill    | 275            |
| big-mining-drill         | i-2730, r-4100 |
| foundry                  | i-5170, r-7760 |
| centrifuge               | 15700          |
| pipe                     | 10             |
| transport-belt           | 15             |
| fast-transport-belt      | 115            |
| express-transport-belt   | 365            |
| turbo-transport-belt     | 865            |
| underground-belt         | 88             |
| fast-underground-belt    | 490            |
| express-underground-belt | 1330           |
| turbo-underground-belt   | 3180           |
| splitter                 | 235            |
| fast-splitter            | 685            |
| express-splitter         | 2050           |
| turbo-splitter           | 5020           |
| concrete                 | 12             |
| refined-concrete         | 35             |
| train-stop               | 365            |
| rail                     | 32             |
| lab                      | 510            |

## Military Items

| ItemID                   | Cost  |
| ------------------------ | ----- |
| grenade                  | 150   |
| stone-wall               | 100   |
| gate                     | 250   |
| firearm-magazine         | 40    |
| piercing-rounds-magazine | 140   |
| gun-turret               | 500   |
| flamethrower-turret      | 2350  |
| artillery-turret(base)   | 6520  |
| artillery-turret(sa)     | 50240 |
| cannon-shell             | 145   |
| explosive-cannon-shell   | 160   |
| shotgun-shell            | 40    |
| piercing-shotgun-shell   | 230   |
| nuke                     | 40860 |

## Robotics

| ItemID             | Cost |
| ------------------ | ---- |
| flying-robot-frame | 405  |
| logistic-robot     | 605  |
| construction-robot | 455  |
| roboport           | 7650 |

## Nuclear

| ItemID            | Cost |
| ----------------- | ---- |
| uranium-238       | 200  |
| uranium-235       | 700  |
| uranium-fuel-cell | 460  |
| nuclear-fuel      | 900  |
| fusion-power-cell | 1200 |

## Science Packs

| ItemID                       | Cost           |
| ---------------------------- | -------------- |
| automation-science-pack      | 30             |
| logistic-science-pack        | 70             |
| military-science-pack        | 210            |
| chemical-science-pack        | 245            |
| production-science-pack      | 935            |
| utility-science-pack         | 990            |
| space-science-pack(sa)       | 25             |
| metallurgic-science-pack     | i-360, r-540   |
| electromagnetic-science-pack | i-null, r-null |
| agricultural-science-pack    | i-180, r-260   |
| cryogenic-science-pack       | 175            |
| promethium-science-pack      | null           |

## Vehicles and Transport

| ItemID      | Cost |
| ----------- | ---- |
| car         | 1170 |
| cargo-wagon | 1400 |
| locomotive  | 3550 |

## Oil Refining and Processing

| ItemID            | Cost |
| ----------------- | ---- |
| crude-oil         | 0.5  |
| heavy-oil         | 2    |
| heavy-oil(fg)     | 0.1  |
| light-oil         | 1.5  |
| petroleum-gas     | 1    |
| lubricant         | 2    |
| sulfuric-acid     | 1.5  |
| solid-fuel        | 18   |
| solid-fuel(aq)    | 10   |
| rocket-fuel       | 200  |
| rocket-fuel(aq)   | 360  |
| rocket-fuel(gb)   | 400  |
| thruster-fuel     | 1    |
| thruster-oxidizer | 0.5  |

## Organic

| ItemID          | Cost            |
| --------------- | --------------- |
| jelly-nut       | 30              |
| yumako          | 30              |
| jelly           | i-6, r-8        |
| yumako-mash     | i-10, r-15      |
| bioflux         | i-60, r-60      |
| nutrients       | 8               |
| raw-fish        | i-530, r-800    |
| pentapod-egg    | i-200, r-240    |
| spoilage        | b-5             |
| carbon-fiber    | i-120, r-140    |
| landfill        | 500             |
| biochamber      | i-690, r-1030   |
| yumako-seed     | bi-800, br-1200 |
| jellynut-seed   | bi-800, br-1200 |
| iron-bacteria   | i-12, r-16      |
| copper-bacteria | i-12, r-16      |
| biter-egg       | \*80            |
| null            | null            |

## Cryogenic

| ItemID              | Cost |
| ------------------- | ---- |
| ammoniacal-solution | 0.2  |
| ammonia             | 0.5  |
| lithium-brine       | 12   |
| lithium             | 150  |
| lithium-plate       | 150  |
| fluorine            | 4    |
| fluoroketone-hot    | 8    |
