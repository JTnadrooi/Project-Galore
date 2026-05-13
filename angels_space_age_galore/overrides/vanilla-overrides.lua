-- trim unsaveble vanilla recipes
-- bio stuff will be obtained through bioprocessing
vgal.data.trim("biolubricant")
vgal.data.trim("bioplastic")
vgal.data.trim("biosulfur")
vgal.data.trim("rocket-fuel-from-jelly")

-- might be saveble
vgal.data.trim("simple-coal-liquefaction")
vgal.data.trim("carbon")

-- other more angel-ish ways avalible
vgal.data.trim("solid-fuel-from-ammonia")
vgal.data.trim("ammonia-rocket-fuel")

-- not needed now there are alt methods for coal recipes that don't use coal.
vgal.data.trim("coal-synthesis")

-- add spoilage to fiber recipe instead
vgal.data.trim("burnt-spoilage")

-- angels already adds a fish breeding recipe
vgal.data.trim("fish-breeding")

-- remove solid fuel from scrap
vgal.recipe.remove_result("scrap-recycling", "solid-fuel", true)
