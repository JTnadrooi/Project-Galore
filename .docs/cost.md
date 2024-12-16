# Item and fluid costs

These provide general guidelines when making recipes.

MW stands for **Mineral Water**. Vanilla galore originally an extension of the [Mineral Liquid mod](https://mods.factorio.com/mod/Liquid_Ore_Conversion) for _1.1_.

\*Note: YAFC to MW is 1:2.25 or 1:2 for simplicity, While YAFC was nice to verify my calculations, it is not suitable to be used as a baseline.

## Main

| ItemID                   | Cost(MW) |
| ------------------------ | -------- |
| iron-ore                 | 10       |
| water                    | 0.1      |
| iron-plate               | 10       |
| copper-ore               | 10       |
| copper-plate             | 10       |
| coal                     | 10       |
| stone                    | 10       |
| stone-brick              | 20       |
| steel-plate              | 50       |
| iron-stick               | 5        |
| iron-gear-wheel          | 20       |
| copper-cable             | 5        |
| big-electric-pole        | 310      |
| electronic-circuit       | 25       |
| advanced-circuit         | 100      |
| inserter                 | 55       |
| burner-inserter          | 30       |
| fast-inserter            | 125      |
| bulk-inserter            | 900      |
| long-handed-inserter     | 85       |
| assembling-machine-1     | 265      |
| assembling-machine-2     | 540      |
| assembling-machine-3     | 3580     |
| pipe                     | 10       |
| engine-unit              | 90       |
| car                      | 1170     |
| chemical-plant           | 525      |
| grenade                  | 150      |
| stone-wall               | 100      |
| firearm-magazine         | 40       |
| piercing-rounds-magazine | 140      |
| military-science-pack    | 210      |
| automation-science-pack  | 30       |
| logistic-science-pack    | 70       |
| chemical-science-pack    | 245      |
| production-science-pack  | 935      |
| utility-science-pack     | 990      |
| low-density-structure    | 375      |
| beacon                   | 3050     |
| rail                     | 32       |
| transport-belt           | 15       |
| fast-transport-belt      | 115      |
| express-transport-belt   | 365      |
| underground-belt         | 88       |
| fast-underground-belt    | 487      |
| express-underground-belt | 1330     |
| splitter                 | 235      |
| fast-splitter            | 685      |
| express-splitter         | 2045     |
| solar-panel              | 675      |
| concrete                 | 12       |
| refined-concrete         | 34       |
| radar                    | 325      |
| gate                     | 250      |
| train-stop               | 365      |
| medium-electric-pole     | 130      |
| cargo-wagon              | 1400     |
| locomotive               | 3550     |
| roboport                 | 7650     |
| nuclear-reactor          | 86000    |
| heat-pipe                | 700      |
| centrifuge               | 15700    |
| pipe-to-ground           | 75       |
| stone-furnace            | 50       |
| steel-furnace            | 500      |
| electric-furnace         | 1200     |
| module-t1                | 625      |
| module-t2                | 6550     |
| module-t3                | 30250    |
| rocket-fuel              | 200      |
| rocket-part              | 12800    |
| flying-robot              | 12800    |

## Oil producs

I have multiple options here, I could value them based on the fuel value of solid fuel and coal. I could value them based on how much space it takes for a belt of plastic-bar's in comparison to the ores or I could look at power cost. I have opted for a mix of the second option and just adding the worth of the raw materials. All these values come from the plastic-bar recipe.

1 crude-oil = 0.45 petroleum-gas (basic);
1 crude-oil = 0.975 petroleum-gas (adv)

So as a middle ground, I pick 1 crude-oil = 0.8 petroleum-gas; Its more toward the adv side bc no one uses the normal recipe for long.

However, this would make crude-oil worth more than petroleum-gas. I instead opt to make oil half as valuable, simply because of the production step.

YAFC seems to agree with me; one plastic bar is 15 mw.

| ItemID               | Cost(MW) |
| -------------------- | -------- |
| plastic-bar          | 15       |
| sulfur               | 15       |
| petroleum-gas        | 1        |
| solid-fuel           | 18       |
| crude-oil            | 0.5      |
| heavy-oil            | 2        |
| light-oil            | 1.5      |
| lubricant            | 2        |
| sulfuric-acid        | 1.5      |
| battery              | 50       |
| accumulator          | 270      |
| advanced-circuit     | 100      |
| processing-unit      | 710      |
| lubricant            | 2.5      |
| electric-engine-unit | 180      |
| flying-robot-frame   | 405      |
| logistic-robot       | 605      |
| construction-robot   | 455      |
| steam-turbine        | 1700     |
| pump                 | 150      |
| small-lamp           | 50       |

## Nuclear products

It should be simpler than oil but instead of going on a ramble, here are some notable things I used in my calculations.

-   Uranium is way more worth than normal ores. Both because of mining time and the sulfuric requirement. (21.5 rounded to 20)
-   1420 uranium-ore = 1 uranium-235 = 141 uranium-238
-   The normal uranium recipe will not be used for 235 calculations. When you are using 235 for recipes you are expected to have enrichment up and running.
-   235 would be worth 28400 mw without enrichment.
-   235 would be worth 600 mw with enrichment. (Buffed to 700 mw because of centrifuge costs, setup costs, setup time and 1 minute crafting cycle.)

| ItemID            | Cost(MW) |
| ----------------- | -------- |
| uranium-ore       | 20       |
| uranium-238       | 200      |
| uranium-235       | 700      |
| uranium-fuel-cell | 460      |
| nuclear-fuel      | 900      |
