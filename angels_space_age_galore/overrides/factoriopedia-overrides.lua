data.raw["tree"]["angels-puffer-nest"].factoriopedia_simulation = {
    hide_factoriopedia_gradient = true,
    init = [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-brown-blubber"}}
      end
    end

    game.surfaces[1].create_entity{name = "angels-puffer-nest", position = {0, 1.5}}
  ]],
}
