headAngle = 10
handAngle = 20

obj =
	test:
		duration: 1
		dirs: [
			{
				"body<leg_r": [
					{
						start: 0
						end: 0.25
						to: angle: headAngle
					}, {
						start: 0.5
						end: 0.75
						to: angle: -headAngle
					}, {
						start: 0.5
						end: 1
						to: angle: 0
					}
				]
				"body<leg_l": [
					{
						start: 0
						end: 0.25
						to: angle: -headAngle
					}, {
						start: 0.5
						end: 0.75
						to: angle: headAngle
					}, {
						start: 0.5
						end: 1
						to: angle: 0
					}
				]
				"body<hand_l": [
					{
						start: 0
						end: 0.25
						to: angle: handAngle
					}, {
						start: 0.5
						end: 0.75
						to: angle: -handAngle
					}, {
						start: 0.5
						end: 1
						to: angle: 0
					}
				]
				"body>hand_r": [
					{
						start: 0
						end: 0.25
						to: angle: -handAngle
					}, {
						start: 0.5
						end: 0.75
						to: angle: handAngle
					}, {
						start: 0.5
						end: 1
						to: angle: 0
					}
				]
			}
		]