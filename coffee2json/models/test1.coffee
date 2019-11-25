obj =
	verts:
		0:  {x: 0,   y: 0,   z: -30}
		1:  {x: 0,   y: 200, z: -10}
		2:  {x: 400, y: 200, z: -10}
		3:  {x: 400, y: 0,   z: -30}

		4:  {x: 0,   y: 0,   z: -80}
		5:  {x: 400, y: 0, z: -80}

		line0:  {x: -1200,y: -200,   z: 0}
		line1:  {x: -800, y: -200,   z: 0}
		line2:  {x: -400, y: -200,   z: 0}
		line3:  {x:    0, y: -200,   z: 0}
		line4:  {x:  400, y: -200,   z: 0}
		line5:  {x:  800, y: -200,   z: 0}

		10: {x: 192, y: 0,    z: -50}
		11: {x: 208, y: 0,    z: -50}
		12: {x: 208, y: -100, z: -50}
		13: {x: 192, y: -100, z: -50}

		b10: {x: 192, y: 0,    z: -70}
		b11: {x: 208, y: 0,    z: -70}
		b12: {x: 208, y: -100, z: -70}
		b13: {x: 192, y: -100, z: -70}

		up0: {x: 0,    y: -100, z: -40}
		up1: {x: 0,    y: -120, z: -40}
		up2: {x: 2400, y: -120, z: -40}
		up3: {x: 2400, y: -100, z: -40}

		bup0: {x: 0,    y: -100, z: -70}
		bup1: {x: 0,    y: -120, z: -70}
		bup2: {x: 2400, y: -120, z: -70}
		bup3: {x: 2400, y: -100, z: -70}

		pt: {x:  0,   y: -24,  z: 40}
		p0: {x:  24,  y:  20,  z: 10}
		p1: {x:  24,  y: -20,  z: 0}
		p2: {x: -24,  y: -20,  z: 0}
		p3: {x: -24,  y:  20,  z: 10}

		vt1: {x: 100,  y: 80,  z: -30}
		vt2: {x: 200,  y: 80,  z: -30}
		vt3: {x: 300,  y: 80,  z: -30}
	dirsParts: [
		{
			panelFront:
				hide: true
				faces: [
					{verts: [0, 4, 5, 3]},
					{lineWidth: 1, verts: [10, "b10", "b13", 13]},
					{lineWidth: 1, verts: [12, "b12", "b11", 11]},
					{lineWidth: 1, verts: [10, 11, 12, 13]},
					{verts: [0, 1, 2, 3]},
					{type: "part", part: "pir",	vert: "vt1"},
					{type: "part", part: "pir",	vert: "vt2"},
					{type: "part", part: "pir",	vert: "vt3"}
				]
			upRamp:
				hide: true
				faces: [
					{draw: "f", verts: ["up1", "up2", "bup2", "bup1"]},
					{draw: "s", verts: ["bup1", "bup2"]},
					{draw: "f", verts: ["up0", "up1", "up2", "up3"]},
					{draw: "s", verts: ["up0", "up3"]},
					{draw: "s", verts: ["up1", "up2"]}
				]
			pir:
				hide: true
				faces: [
					{lineWidth: 3, draw: "s", verts: ["p0", "p1", "p2", "p3"]},
					{draw: "f", verts: ["pt", "p0", "p1"]},
					{draw: "f", verts: ["pt", "p2", "p3"]},
					{draw: "f", verts: ["pt", "p3", "p0"]},
					{draw: "f", fill: "#bbb", verts: ["pt", "p1", "p2"]},
					{lineWidth: 1, draw: "s", verts: ["p0", "pt"]},
					{lineWidth: 1, draw: "s", verts: ["p1", "pt"]},
					{lineWidth: 1, draw: "s", verts: ["p2", "pt"]},
					{lineWidth: 1, draw: "s", verts: ["p3", "pt"]}
				]
			panel:
				faces: [{
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "panelFront"
					vert: "line0"
				}, {
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "panelFront"
					vert: "line1"
				}, {
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "panelFront"
					vert: "line2"
				}, {
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "panelFront"
					vert: "line3"
				}, {
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "panelFront"
					vert: "line4"
				}, {
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "panelFront"
					vert: "line5"
				}, {
					type: "part"
					lineWidth: 2
					stroke: "#000"
					fill: "#777"
					part: "upRamp"
					vert: "line0"
				}]
		}
	]