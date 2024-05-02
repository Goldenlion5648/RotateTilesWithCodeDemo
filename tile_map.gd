extends TileMap

const main_layer = 0
const main_source = 0

enum TileTransform {
	ROTATE_0 = 0,
	ROTATE_90 = TileSetAtlasSource.TRANSFORM_TRANSPOSE | TileSetAtlasSource.TRANSFORM_FLIP_H,
	ROTATE_180 = TileSetAtlasSource.TRANSFORM_FLIP_V | TileSetAtlasSource.TRANSFORM_FLIP_H,
	ROTATE_270 = TileSetAtlasSource.TRANSFORM_FLIP_V | TileSetAtlasSource.TRANSFORM_TRANSPOSE,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	place_rotated_tiles()

func get_tile_rotation(tile_position: Vector2i):
	for rot in TileTransform.values().slice(1):
		if get_cell_alternative_tile(main_layer, tile_position) & rot == rot:
			return rot
	return TileTransform.ROTATE_0

func place_rotated_tiles():
	#rotate 90 degrees
	set_cell(main_layer, Vector2i(1, 3), main_source, Vector2i(7, 2),
				TileTransform.ROTATE_90)
	print(get_tile_rotation(Vector2i(1, 3)) == TileTransform.ROTATE_90)
	#rotate 180 degrees
	set_cell(main_layer, Vector2i(2, 3), main_source, Vector2i(7, 2), 
				TileTransform.ROTATE_180)
	print(get_tile_rotation(Vector2i(2, 3)) == TileTransform.ROTATE_180)
	##just flipping
	#set_cell(main_layer, Vector2i(2, 4), main_source, Vector2i(7, 2), 
				#TileSetAtlasSource.TRANSFORM_FLIP_V)
	
	#rotate 270 degrees
	set_cell(main_layer, Vector2i(3, 3), main_source, Vector2i(7, 2), 
				TileTransform.ROTATE_270)
	print(get_tile_rotation(Vector2i(3, 3)) == TileTransform.ROTATE_270)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
