extends Resource
class_name SaveData

@export var saved_score: int
@export var saved_highscore: int

func update_score(player_score):
	saved_score = player_score

func update_highscore(player_highscore):
	saved_highscore = player_highscore
