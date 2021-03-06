obj =
	models:
		"weapon": "models/hockey_stick"
	sprites:
		"banny": "sprites/banny"
	dirs: [
		{
			body:
				hide: true
				type: "rectRound"
				lineWidth: 5.5
				radius: 15
				width: 80
				height: 100
				origY: -66
				x: -40
				y: -53.5
				before:
					ear_r:
						type: "rectRound"
						lineWidth: 5
						radius: 7
						width: 24
						height: 84
						x: 4
						y: -124
					ear_l:
						type: "rectRound"
						lineWidth: 5
						radius: 7
						width: 21
						height: 68
						x: -38
						y: -108
					leg_r:
						type: "rectRound"
						lineWidth: 4
						radius: 4
						width: 18
						height: 30
						origX: 16
						origY: 45
						x: -9
						y: -8.5
					leg_l:
						type: "rectRound"
						lineWidth: 4
						radius: 4
						width: 18
						height: 30
						origX: -20
						origY: 45
						x: -9
						y: -8.5
					hand_l:
						type: "rectRound"
						lineWidth: 4
						radius: 4
						width: 18
						height: 30
						origX: 37
						origY: 7
						x: -8.5
						y: -5
				after:
					ear_l:
						type: "path"
						draw: "s"
						path: "m -24,-58 2,10"
						lineWidth: 8
						stroke: "#fff"
					ear_r:
						type: "path"
						draw: "s"
						path: "m 21.5,-57 -1,9"
						lineWidth: 8
						stroke: "#fff"
					face:
						after:
							glasses:
								type: "sprite"
								sprite: "banny"
								frame: "swagglasses"
								scaleX: 0.48
								scaleY: 0.48
								origX: 7
								origY: -15
							nose:
								type: "arc"
								draw: "f"
								x: 8.1826782
								y: -3.3474579
								radius: 3.5
								lineWidth: 0.5
								fill: "#ff0000"
							mouth:
								type: "path"
								draw: "s"
								path: "m -10,9.5 q 0,0 12,-2.5 14,-2.5 18,4"
								lineCap: "round"
								lineWidth: 3.5
								stroke: "#000"
								before:
									tooth1:
										type: "rect"
										width: 5
										height: 10
										stroke: "#000"
										fill: "#fff"
										lineWidth: 1.5
										x: 9
										y: 7
									tooth2:
										type: "rect"
										width: 5
										height: 7
										stroke: "#000"
										fill: "#fff"
										lineWidth: 1.5
										x: 4
										y: 7
					hand_r:
						type: "rectRound"
						lineWidth: 4
						radius: 5
						width: 20
						height: 35
						origX: -40
						origY: 6
						x: -10
						y: -10
						before:
							weapon_node:
								type: "node"
								scaleX: -1
								model: "weapon"
								direction: 0
								node: "weapon"
			banny:
				type: "node"
				node: "body"
				fill: "#fff"
				stroke: "#000"
		}
		{
			banny:
				type: "node"
				node: "body"
				scaleX: -1
				direction: 0
				fill: "#fff"
				stroke: "#000"
		}
		{
			body:
				hide: true
				type: "rectRound"
				lineWidth: 5.5
				radius: 15
				width: 80
				height: 100
				origY: -66
				x: -40
				y: -53.5
				before:
					ear_r:
						type: "rectRound"
						lineWidth: 5
						radius: 7
						width: 24
						height: 84
						x: 4
						y: -124
					ear_l:
						type: "rectRound"
						lineWidth: 5
						radius: 7
						width: 21
						height: 68
						x: -38
						y: -108
					hand_r:
						type: "rectRound"
						lineWidth: 4
						radius: 5
						width: 20
						height: 35
						origX: -40
						origY: 6
						x: -10
						y: -10
						after:
							weapon_node:
								type: "node"
								scaleX: -1
								model: "weapon"
								direction: 0
								node: "weapon"
					leg_r:
						type: "rectRound"
						lineWidth: 4
						radius: 4
						width: 18
						height: 30
						origX: 16
						origY: 45
						x: -9
						y: -8.5
					leg_l:
						type: "rectRound"
						lineWidth: 4
						radius: 4
						width: 18
						height: 30
						origX: -20
						origY: 45
						x: -9
						y: -8.5
				after:
					ear_l:
						type: "path"
						draw: "s"
						path: "m -24,-58 2,10"
						lineWidth: 8
						stroke: "#fff"
					ear_r:
						type: "path"
						draw: "s"
						path: "m 21.5,-57 -1,9"
						lineWidth: 8
						stroke: "#fff"
					tail:
						type: "path"
						path: "m -4.3225461,-14.681871 c 0.1322949,0.407069 -7.1099969,14.15340778 -5.8535369,18.0444414 1.3712184,4.2464226 4.4188589,6.2237359 6.8750502,7.1204116 C 4.3061399,12.69679 9.2427653,4.9809106 9.4361183,0.88851829 9.3015213,-2.1505756 8.4204063,-4.4845692 5.8641541,-8.1687678 3.3478279,-11.387211 1.7834204,-14.804139 0.70465811,-18.956096 c 0.2095004,4.202153 1.30475909,8.744987 -2.51360201,11.397932 -3.2476473,-1.3532472 -1.7278529,-4.505 -2.5136022,-7.123707 z"
						lineWidth: 3.5
						origX: -4
						origY: 16
					hand_l:
						type: "rectRound"
						lineWidth: 4
						radius: 4
						width: 18
						height: 30
						origX: 37
						origY: 7
						x: -8.5
						y: -5
			banny:
				type: "node"
				node: "body"
				scaleX: -1
				fill: "#fff"
				stroke: "#000"
		}
		{
			banny:
				type: "node"
				direction: 2
				node: "body"
				fill: "#fff"
				stroke: "#000"
		}
	]
