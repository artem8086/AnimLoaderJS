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

Z_TRANSFORM = 0.002

trsfObj =
	x: 0
	y: 0
	scale: 1
	apply: (g) ->
		g.transform @scale, 0, @sacle, 0, @x, @y

drawTypeObj =
	rect: (g) ->
		g.rect @x || 0, @y || 0, @width, @height

drawBone = (g) ->
	@visible = @visible || true
	if @visible
		g.save()
		g.transform @scaleX || 1, @skewX || 0, @scaleY || 1, @skewY || 0, @origX || 0, @origY || 0
		if @angle then g.rotate @angle
		if @stroke then g.strokeStyle = @stroke
		if @fill then g.fillStyle = @fill
		if @lineWidth then g.lineWidth = @lineWidth
		if @lineCap then g.lineCap = @lineCap
		if @lineJoin then g.lineJoin = @lineJoin
		if @lineDashOffset then g.lineDashOffset = @lineDashOffset

		if @type then drawTypeObj[@type].call this, g

		if @childs
			for key, bone of @childs
				drawBone.call bone, g
		g.restore()

class Model
	@transform: (x, y, z, camera) ->
		xL = camera.x + camera.canvas.width / 2
		yL = camera.y + camera.canvas.height / 2
		x -= xL
		y -= yL
		z = (500 + z + camera.z) * Z_TRANSFORM
		trsfObj.x = x * z + xL
		trsfObj.y = y * z + yL
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

	draw2D: (g) ->
		if @model
			root = @model.root2D
			if root
				for key, bone of root
					drawBone.call bone, g

export { ModelData, Model }