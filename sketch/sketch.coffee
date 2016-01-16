p5 = require "p5"
_ = require "lodash"
Particle = require "./lib/Particle.coffee"
ParticleSystem = require "./lib/ParticleSystem.coffee"

new p5 (sketch) ->

	disp = (location, lifespan) ->
		sketch.noStroke()
		sketch.fill sketch.color(17, 102, 68, lifespan)
		sketch.ellipse location.x, location.y, 5, 5

	xoff = 0.0
	particleSystem = null
	sketch.setup = ->
		sketch.createCanvas 1000, 1000
		particleSystem = new ParticleSystem sketch.createVector(sketch.width / 2, 50), disp

	sketch.draw = ->
		sketch.background 255
		particleSystem.add()
		particleSystem.applyForce(new p5.Vector(0, 0.1))
		particleSystem.run()

