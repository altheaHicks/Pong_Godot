extends Node

var PlayerScore = 0
var OpponentScore = 0


func _on_Left_body_entered(body):
	$Ball.position = Vector2(640, 360)
	OpponentScore += 1
	get_tree().call_group('BallGroup', 'stop_ball')
	$'CountdownTimer'.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()

func _on_Right_body_entered(body):
	$Ball.position = Vector2(640, 360)
	PlayerScore += 1
	get_tree().call_group('BallGroup', 'stop_ball')
	$'CountdownTimer'.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)


func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
	$CountdownLabel.visible = false
