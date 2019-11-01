import { ModelData, Model } from './model'
import { Loader } from './loader'

$(document).ready ->
	canvas = document.getElementById 'canvas'
	context = canvas.getContext '2d', alpha: false

	resize = ->
		canvas.width = $(window).width()
		canvas.height = $(window).height() - $('#canvas').offset().top

	resize()

	$(window).on 'resize', resize

	modelFile = 'anims/test'
	loader = new Loader
	model = new Model
	modelData = null
	camera =
		canvas: canvas
		g: context
		x: 0
		y: 0
		z: 0

	modelRefresh = ->
		modelData = new ModelData
		modelData.load loader, modelFile
	
	loader.on 'load', ->
		model.setData modelData

	console.log model

	setInterval modelRefresh, 500

	render = (delta) ->
		context.save()
		w = canvas.width
		h = canvas.height
		context.fillStyle = '#fff'
		context.fillRect 0, 0, w, h
		context.beginPath()
		context.lineWidth = 2
		context.strokeStyle = '#f00'
		context.moveTo w / 2, 0
		context.lineTo w / 2, h
		context.moveTo 0, h / 2
		context.lineTo w, h / 2
		context.stroke()

		context.translate w / 2, h / 2

		Model.transform(0, 0, 0, camera)
			.apply context

		model.draw2D context

		context.restore()
		# 
		window.requestAnimationFrame render

	render(0)
