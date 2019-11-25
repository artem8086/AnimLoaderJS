obj =
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
					face:
						type: "empty"
						after:
							glasses:
								type: "sprite"
								sprite: "banny"
								frame: "swagglasses"
								scaleX: 0.07
								scaleY: 0.07
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
			banny:
				type: "node"
				node: "body"
				fill: "#fff"
				stroke: "#000"
		}
	]
