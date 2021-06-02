# Author: Gwenaël Le Bodic
# Code snippet to be run against the Sketchup API
# Boiler plate for generation of a grid of block looking like a basic cityscape 
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

grid_size_x = 30
grid_size_y = 50
cell_size = 50
max_cell_height=100

# Location of roads
road_x = 12
road_y1 = 10
road_y2 = 35

(0..grid_size_x -1).each { |x|
  (0..grid_size_y-1).each { |y|
    
    group = ent.add_group
    face=group.entities.add_face [x*cell_size,y*cell_size,0],[x*cell_size,y*cell_size+cell_size,0],[x*cell_size+cell_size,y*cell_size+cell_size,0],[x*cell_size+cell_size,y*cell_size,0]
    #puts String(x) + "/" + String(y) 
    if (x == road_x or y == road_y1 or y == road_y2) then
    # This is a road cell
      cell_height = 1
      face.back_material = [0,0,0]
    else
    # This is a building cell
      cell_height = rand(1..max_cell_height)
    end
    face.pushpull -cell_height
    }
   }
