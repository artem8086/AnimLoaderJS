gulp = require 'gulp'
jade = require 'gulp-jade'
connect = require 'gulp-connect'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
uglify = require('gulp-uglify-es').default
clean = require 'gulp-clean'
rollup = require 'gulp-rollup'
copy = require 'gulp-copy'
sourcemaps = require 'gulp-sourcemaps'


assetsT = (cb) ->
	gulp.src 'assets/**/*.*'
		.pipe copy 'dist/', prefix: 1
	cb()

connectT = (cb) ->
	connect.server
		port: 3000
		livereload: on
		root: './dist'
	cb()

jadeT = (cb) ->
	gulp.src 'jade/*.jade'
		.pipe jade()
			.on 'error', console.log
		.pipe gulp.dest 'dist'
		.pipe do connect.reload
	cb()

stylusT = (cb) ->
	gulp.src 'stylus/*.styl'
		.pipe stylus(compress: on)
			.on 'error', console.log
		.pipe gulp.dest 'dist/css'
		.pipe do connect.reload

buildT = (cb) ->
	gulp.src 'coffee/**/*.coffee'
		.pipe do sourcemaps.init
		.pipe coffee()
			.on 'error', console.log
		.pipe rollup(
			input: 'coffee/main.js'
			output:
				format: 'cjs'
				intro: '(function(){'
				outro: '})();'
			).on 'error', console.log
		.pipe uglify()
			.on 'error', console.log
		.pipe do sourcemaps.write
		.pipe gulp.dest 'dist/js'
		.pipe do connect.reload

	gulp.src 'coffee/**/*.js', read: no
		.pipe do clean
	cb()

watchT = (cb) ->
	gulp.watch 'jade/**/*.jade', jadeT
	gulp.watch 'stylus/**/*.styl', stylusT
	gulp.watch 'coffee/**/*.coffee', buildT
	gulp.watch 'assets/**/*.*', assetsT
	cb()

exports.default = gulp.series assetsT, jadeT, stylusT, buildT, connectT, watchT
