# ParticleSystem class
Particle = require "./Particle.coffee"

class ParticleSystem

	constructor: (location, @displayFn) ->
		@particles = []
		@location = location.copy()

	add: () -> @particles.push(new Particle(@location, @displayFn))

	applyForce: (force) -> [ particle.applyForce force for particle in @particles ]

	run: () ->
		[ particle.activate() for particle in @particles ]
		@particles = ( particle for particle in @particles when not particle.isDead() )

module.exports = ParticleSystem
