obj =
	stand:
		duration: 1
		dirs: [
			{
				"@body": [
					{
						start: 0
						end: 0.4
						func: "quad"
						to: origY: -62
					}, {
						start: 0.4
						end: 0.8
						func: "quadEaseOut"
						to: origY: -66
					}
				]
				"@leg_l": [
					{
						start: 0
						end: 0.4
						func: "quad"
						to: origY: 41
					}, {
						start: 0.4
						end: 0.8
						func: "quadEaseOut"
						to: origY: 45
					}
				]
				"@leg_r": [
					{
						start: 0
						end: 0.4
						func: "quad"
						to: origY: 41
					}, {
						start: 0.4
						end: 0.8
						func: "quadEaseOut"
						to: origY: 45
					}
				]
			}
		]
	run:
		duration: 1
		dirs: [
			{
				"@body": [
					{
						start: 0
						end: 0.5
						func: "quadEaseOut"
						to:
							angle: 2
							origY: -70
					}, {
						start: 0.5
						end: 1
						func: "quad"
						to:
							angle: 0
							origY: -66
					}
				]
				"@tail": [
					{
						start: 0
						end: 0.5
						func: "quadEaseOut"
						to:	angle: -16
					}, {
						start: 0.5
						end: 1
						func: "quad"
						to: angle: 0
					}
				]
				"@hand_l": [
					{
						start: 0
						end: 0.25
						func: "quad"
						to: angle: -30
					}, {
						start: 0.25
						end: 0.75
						func: "quad"
						to: angle: 30
					}, {
						start: 0.75
						end: 1
						func: "quad"
						to: angle: 0
					}
				]
				"@hand_r": [
					{
						start: 0
						end: 0.25
						func: "quad"
						to: angle: 26
					}, {
						start: 0.25
						end: 0.75
						func: "quad"
						to: angle: -26
					}, {
						start: 0.75
						end: 1
						func: "quad"
						to: angle: 0
					}
				]
				"@leg_l": [
					{
						start: 0
						end: 0.25
						to: angle: 20
					}, {
						start: 0.25
						end: 0.75
						to: angle: -20
					}, {
						start: 0.75
						end: 1
						to: angle: 0
					}
				]
				"@leg_r": [
					{
						start: 0
						end: 0.25
						to: angle: 20
					}, {
						start: 0.25
						end: 0.75
						to: angle: -20
					}, {
						start: 0.75
						end: 1
						to: angle: 0
					}
				]
			}
		]