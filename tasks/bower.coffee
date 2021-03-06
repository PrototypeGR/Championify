gulp = require 'gulp'
bower = require 'gulp-bower'
preen = require 'preen'
flatten = require 'gulp-flatten'

# BOWER
gulp.task 'bower', ->
  return bower()

gulp.task 'preen', (cb) ->
  preen.preen {}, cb

gulp.task 'bower_copy', ->
  gulp.src('./bower_components/**/*.js')
    .pipe(flatten())
    .pipe gulp.dest('./dev/vendor/js/')

  gulp.src('./bower_components/**/*.map')
    .pipe(flatten())
    .pipe gulp.dest('./dev/vendor/js/')

  gulp.src('./bower_components/**/*.css')
    .pipe(flatten())
    .pipe gulp.dest('./dev/vendor/css/')

  # Semantic UI
  gulp.src('./bower_components/semantic/dist/themes/default/assets/fonts/**')
    .pipe(flatten())
    .pipe gulp.dest('./dev/vendor/css/themes/default/assets/fonts/')

  gulp.src('./bower_components/semantic/dist/themes/default/assets/images/**')
    .pipe(flatten())
    .pipe gulp.dest('./dev/vendor/css/themes/default/assets/images/')
