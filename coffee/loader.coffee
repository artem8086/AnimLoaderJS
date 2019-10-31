import { EventEmmiter } from './events'

# Events:
# 'changepercent' trigger when some resorces loaded
# 'load' trigger when all resorces loaded

class Loader extends EventEmmiter
	loadResNumber = 0
	allResLoader = 0

	useCache: true

	cache = []

	reset: () ->
		loadResNumber = allResLoader = 0

	getPercent: ->
		1 - if allResLoader != 0 then loadResNumber / allResLoader else 0

	updatePercent: () ->
		@trigger 'changepercent', [ @getPercent() ]

	load: (cacheName, file, callback) ->
		_this = this
		callbackFunc = (data) ->
			callback?(data)
			loadResNumber--
			if loadResNumber <= 0
				@reset()
				@trigger 'load'
			@updatePercent()
			if data && @useCache
				cache[cacheName][file] = data

		loadResNumber++
		allResLoader++
		# @updatePercent()
		if @useCache
			c = cache[cacheName]
			if c != null
				data = c[file]
				if data
					callbackFunc data 
					return null
			else
				cache[cacheName] = []
		callbackFunc

	loadJSON: (file, callback) ->
		callback = @load 'json', file, callback
		if callback
			$.getJSON file + '.json'
				.done callback
				.fail ->
					callback null

	loadImage: (file, callback) ->
		callback = @load 'image', file, callback
		if callback
			img = new Image
			img.onload ->
				callback img
			img.src = file

export { Loader }