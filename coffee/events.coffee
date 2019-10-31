class EventEmmiter
	handlers: []

	on: (event, callback) ->
		if callback
			handler = handlers[event]
			if handler == null
				handler = handlers[event] = []
			handlers.push callback

	off: (event, callback) ->
		if callback
			handler = handlers[event]
			if handler
				index = handler.indexOf callback
				if index >= 0
					handler.splice index, 1

	trigger: (event, args) ->
		handler = handlers[event]
		if handler
			for callback in handler
				callback.apply this, args

	removeEvent: (event) ->
		delete handlers[event]

export { EventEmmiter }