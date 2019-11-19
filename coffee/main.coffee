import { ModelData, Model } from './model'
import { Loader } from './loader'

$(document).ready ->
	$canvas = $ '#canvas'
	canvas = $canvas.get 0
	context = canvas.getContext '2d', alpha: false

	$(window).on 'resize', resize

	modelFile = 'anims/test1'
	loader = new Loader
	model = new Model
	modelData = new ModelData
	camera =
		canvas: canvas
		g: context
		x: 0
		y: 0
		z: 0

	resize = ->
		canvas.width = $(window).width()
		canvas.height = $(window).height() - $('#canvas').offset().top

	resize()

	modelRefresh = ->
#		for key, _ of modelData
#			delete modelData[key]
		modelData.load loader, modelFile
	
	loader.on 'load', ->
		model.setData modelData

	console.log model

	setInterval modelRefresh, 500

	render = (delta) ->
		context.save()
		w = canvas.width
		h = canvas.height
		cx = w / 2
		cy = 0
		context.fillStyle = '#fff'
		context.fillRect 0, 0, w, h
		context.beginPath()
		context.lineWidth = 2
		context.strokeStyle = '#f00'
		context.moveTo cx, 0
		context.lineTo cx, h
		context.moveTo 0, cy
		context.lineTo w, cy
		context.stroke()

		context.translate cx, cy

		model.drawParts context, camera

		Model.transform(0, 0, 0, camera)
			.apply context

		model.draw2D context

		context.restore()
		# 
		window.requestAnimationFrame render

	render(0)

	oldMouseX = oldMouseY =0
	moveCamera = (e) ->
		camera.x += e.clientX - oldMouseX
		camera.y += e.clientY - oldMouseY
		oldMouseX = e.clientX
		oldMouseY = e.clientY

	$canvas.on 'mousedown', (e) ->
		oldMouseX = e.clientX
		oldMouseY = e.clientY
		$canvas.on 'mousemove', moveCamera

	$canvas.on 'touchstart', (e) ->
		oldMouseX = e.touches[0].clientX
		oldMouseY = e.touches[0].clientY

	$canvas.on 'touchmove', (e) ->
		moveCamera e.touches[0]

	$canvas.on 'mouseup', ->
		$canvas.off 'mousemove', moveCamera

	$('.js-z-number')
		.val camera.z
		.on 'input change', ->
			camera.z = + $(this).val()

	$('.js-anim-select').click ->
		modelData = new ModelData
		modelFile = $(this).data 'file'

	Model.drawOrigin = true
	$('.js-draw-origin').change ->
		Model.drawOrigin = $(this).prop('checked')

	$('.js-reset-pos').click ->
		camera.x = camera.y = camera.z = 0
		$('.js-z-number').val '0'
