module.exports = {
	entry: "./sketch/sketch.coffee",
	output: {
		path: __dirname,
		filename: "bundle.js"
	},
	module: {
		loaders: [
			{ test: /\.coffee$/, loader: "coffee" }
		]
	}
};

