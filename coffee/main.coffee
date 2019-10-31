
$(document).ready ->
	canvas = document.getElementById 'canvas'
	context = canvas.getContext '2d', alpha: false

	resize = ->
		canvas.width = $(window).width()
		canvas.height = $(window).height() - $('#canvas').offset().top

	resize()

	$(window).on 'resize', resize

	render = (delta) ->
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
		# 
		window.requestAnimationFrame render

	render(0)