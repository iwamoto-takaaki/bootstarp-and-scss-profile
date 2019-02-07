gulp = require 'gulp' 
sass = require 'gulp-sass'

src = './scss/*.scss'
dest = './css/'

gulp.task 'build:scss', ->
  gulp.src src, {base: './scss/'}
  .pipe(sass({includePaths:['node_modules/bootstrap/scss']}))
  .pipe sass { 
    outputStyle: 'expanded' }
  .pipe gulp.dest(dest)

gulp.task 'watch:scss', ->
  gulp.watch src, gulp.task('build:scss')

exports.default = gulp.series ['build:scss']

gulp.task 'watch', gulp.parallel('watch:scss')