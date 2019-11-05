class ModelData
	@modelsCache: []

	@load: (loader, file) ->
		model = ModelData.modelsCache[file]
		if model == null
			model = new ModelData
			model.load loader, file
			ModelData.modelsCache[file] = model
		model

	load: (loader, file) ->
		loader.loadJson file, (data) =>
			if data
				for key, value of data
					this[key] = value

				if @images
					for key, image of @images
						@images[key] = loader.loadImage image

				if @models
					for key, model of @models
						@models[key] = ModelData.load loader, model

drawTypeObj =
	line: (g) ->
		g.moveTo @x1 || 0, @y1 || 0
		g.lineTo @x2 || 0, @y2 || 0

	rect: (g) ->
		g.rect @x || 0, @y || 0, @width || 1, @height || 1

	rectRound: (g) ->
		@noClose = false
		x = @x || 0
		y = @y || 0
		w = @width
		h = @height
		r = @radius
		if w < 2 * r then r = w / 2
		if h < 2 * r then r = h / 2

		g.moveTo x + r, y
		g.arcTo  x + w, y,     x + w, y + h, r
		g.arcTo  x + w, y + h, x,     y + h, r
		g.arcTo  x,     y + h, x,     y,     r
		g.arcTo  x,     y,     x + w, y,     r

	arc: (g) ->
		g.arc(
			@x || 0,
			@y || 0,
			@radius,
			(@startAngle || 0) * Math.PI / 180,
			(@endAngle || 360) * Math.PI / 180,
			if @clockwise then false else true)

	elipse: (g) ->
		g.ellipse(
			@x || 0,
			@y || 0,
			@rx,
			@ry,
			(@rotation || 0) * Math.PI / 180,
			(@startAngle || 0) * Math.PI / 180,
			(@endAngle || 360) * Math.PI / 180,
			if @clockwise then false else true)

	path: (g) ->
		x = @x || 0
		y = @y || 0
		if typeof @path == 'string'
			@path = new Path @path
		#
		@noClose = true
		draw = @draw || 'f&s'
		if draw == 'f' || draw == 'f&s'
			g.fill @path
		if draw == 's' || draw == 'f&s'
			g.stroke @path

	node: (g, model, opacity) ->
		@noClose = @draw = true
		node = @node
		if typeof node == 'string'
			node = model.model.root2D[node]
		else
			root = model.model.root2D
			for path in node
				root = root[path]
			node = root
		g.translate @x || 0, @y || 0
		drawNode.call node, g, model, opacity

	image: (g, model) ->
		@noClose = @draw = true
		image = model.data.images[@image]
		if @width || @height
			g.drawImage image, @x || 0, @y || 0, @width, @height
		else
			g.drawImage image, @x || 0, @y || 0


styleTypeFunc =
	linear: (g) ->
		gradient = g.createLinearGradient @x0 || 0, @y0 || 0, @x1 || 0, @y1 || 0
		for colorStop in @colorStops
			gradient.addColorStop colorStop.pos || 0, colorStop.color
		gradient

	radial: (g) ->
		gradient = g.createRadialGradient @x0 || 0, @y0 || 0, @r0 || 0, @x1 || 0, @y1 || 0, @r1 || 0
		for colorStop in @colorStops
			gradient.addColorStop colorStop.pos || 0, colorStop.color
		gradient

	pattern: (g, model) ->
		image = model.data.images[@image]
		g.createPattern image, @repetition || "repeat"

initStyle = (g, model, style) ->
	styleTypeFunc[style.type]?.call style, g, model


drawNode = (g, model, opacity) ->
	g.save()
	g.transform @scaleX || 1, @skewY || 0, @skewX || 0, @scaleY || 1, @origX || 0, @origY || 0
	if @angle then g.rotate @angle * Math.PI / 180
	stroke = @stroke
	if stroke
		if stroke.constructor == Object
			@stroke = initStyle g, model, stroke
		g.strokeStyle = @stroke
	fill = @fill
	if fill
		if fill.constructor == Object
			@fill = initStyle g, model, fill
		g.fillStyle = @fill
	if @lineWidth then g.lineWidth = @lineWidth
	if @lineCap then g.lineCap = @lineCap
	if @lineJoin then g.lineJoin = @lineJoin
	if @lineDashOffset then g.lineDashOffset = @lineDashOffset
	# Shadows
	if @shadowBlur then g.shadowBlur = @shadowBlur
	if @shadowColor then g.shadowColor = @shadowColor
	if @shadowOffsetX then g.shadowOffsetX = @shadowOffsetX
	if @shadowOffsetY then g.shadowOffsetY = @shadowOffsetY
	g.globalAlpha = opacity * (@opacity || 1)

	if @before
		for key, node of @before
			if !node.hide
				drawNode.call node, g, model, opacity

	g.beginPath()
	drawTypeObj[@type]?.call this, g, model, opacity
	if !@noClose then g.closePath()

	draw = @draw || 'f&s'
	if draw == 'f' || draw == 'f&s'
		g.fill()
	if draw == 's' || draw == 'f&s'
		g.stroke()

	if @after
		for key, node of @after
			if !node.hide
				drawNode.call node, g, model, opacity
	g.restore()


Z_TRANSFORM = 0.002

trsfObj =
	x: 0
	y: 0
	scale: 1
	apply: (g) ->
		g.transform @scale, 0, 0, @scale, @x, @y

class Model
	@transform: (x, y, z, camera) ->
		xc = camera.canvas.width / 2
		yc = camera.canvas.height / 2
		x -= xc - camera.x
		y -= yc - camera.y
		z = (500 + z + camera.z) * Z_TRANSFORM
		trsfObj.x = x * z + xc
		trsfObj.y = y * z + yc
		trsfObj.scale = z
		trsfObj

	direction: 0

	constructor: (@data) ->

	setData: (@data) ->
		@setDirection @direction

	setDirection: (@direction) ->
		if @data.dirs.lenght < @direction
			@direction = 0
		@model = @data.dirs[@direction]

	draw2D: (g, opacity = 1) ->
		if @model
			root = @model.root2D
			if root
				for key, node of root
					if !node.hide
						drawNode.call node, g, this, opacity

export { ModelData, Model }