class AnimationData
	@cache: []

	@load: (loader, file) ->
		animData = AnimationData.cache[file]
		unless animData
			animData = new AnimationData
			animData.load loader, file
			AnimationData.cache[file] = animData
		animData

	load: (loader, file) ->
		loader.loadJson file, (data) =>
			if data
				for key, value of data
					this[key] = value

getTime = ->
	new Date().getTime() / 1000

timingFunctions =
	linear: (time) ->
		time

	quad: (time) ->
		time * time

	circle: (time) ->
		1 - Math.sin Math.acos time

class Animation
	loop: true
	startTime: 0
	duration: 0
	deltaTime: 0
	scale: 1

	props: []
	propsUsed: []

	setAnim: (name, angle, data = @data) ->
		@anim = data?[name]
		@startTime = getTime()
		@deltaTime = 0
		if @anim
			@duration = if @anim then @anim.duration else 0
			@setAngle angle

	setAngle: (angle) ->
		@frame = null
		if @anim
			angle = angle % 360
			dirs = @anim.dirs
			if dirs
				n = dirs.lenght
				if n > 1
					dAngle = 360 / n
					angle += dAngle >> 1
					if angle < 0 then angle += 360
					@frame = dirs[Math.floor(angle / dAngle)]
				else
					@frame = dirs[0]

	play: (time) ->
		time = time || getTime()
		@deltaTime = delta = (time - @startTime) * @scale
		duration = @duration
		unless duration
			return false
		if delta > duration
			if @loop
				@deltaTime %= duration
			else
				return false
		true

	animate: (node) ->
		frame = @frame
		if frame
			timestops = frame[node.nodePath]
			if timestops
				delta = @deltaTime
				for point in timestops
					if delta >= point.start  && delta < point.end
						if point.func
							tFunc = timingFunctions[point.func]
						else
							tFunc = timingFunctions.linear
						#
						for name, prop of point.from
							@props[name] = node[name]
							@propsUsed[name] = true
							toVal = point.to[name]
							if toVal != null
								time = tFunc((delta - point.start) / (point.end - point.start))
								node[name] = (toVal - prop) * time + prop
							else
								node[name] = prop

	reciveProps: (node) ->
		for name, use of @propsUsed
			if use
				node[name] = @props[name]
				@propsUsed[name] = false

export { AnimationData, Animation }