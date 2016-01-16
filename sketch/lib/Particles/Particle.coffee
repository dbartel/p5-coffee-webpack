# Particle Class
## Based on Nature of Code http://natureofcode.com/

p = require "p5"

class Particle
	constructor: (location, displayFn) ->
		@location = location.copy()
		@velocity = p.Vector.random2D()
		@acceleration = new p.Vector(0, 0.05)
		@mass = 5
		@lifespan = 255
		@display = () -> displayFn @location, @lifespan

	applyForce: (force) ->
		force.div(@mass)
		@acceleration.add force
		return @acceleration

	update: () ->
		@velocity.add @acceleration
		@location.add @velocity
		@lifespan -= 0.39

	isDead: () -> @lifespan <= 0

	activate: () ->
		@update()
		@display()
		
module.exports = Particle

