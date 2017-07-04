var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concatCss = require('gulp-concat-css');
var concatJs = require("gulp-concat");
var minifyCss = require("gulp-minify-css");
var replace = require('gulp-replace');
var plumber = require('gulp-plumber');
var watch = require('gulp-watch');
var livereload = require('gulp-livereload');
var BASE_URL = 'http://localhost:8888/static/';

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function errorLog(error){
    console.error.bind(error);
    this.emit('end');
}

gulp.task('watch', function(){
    var server = livereload();

    gulp.watch(['media/assets/login/css/index.css'], ['login']);
});

gulp.task('default', function(){
	console.log("HOLA!!!");
});

gulp.task('demo', function(){
  gulp.src('assets/*/*.js')
    .pipe(plumber())
    .pipe(uglify())
    .pipe(gulp.dest('media/dist/js'));
});

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

gulp.task('fonts', function() {
  	gulp.src(['media/bower_components/font-awesome/fonts/*', 'media/bower_components/bootstrap/fonts/*'])
    .pipe(plumber())
      .pipe(gulp.dest('media/dist/assets'));
});

gulp.task('layout-css', function() {
      gulp.src(['media/dist/assets/icons.min.css','media/bower_components/bootstrap/dist/css/bootstrap.min.css', 'media/bower_components/font-awesome/css/font-awesome.min.css', 'media/bower_components/unify-pp/css/styles.css'])
      .pipe(plumber())
      .pipe(concatCss('styles.min.css'))
      .pipe(minifyCss())
      .pipe(replace('../../../font-awesome/fonts/', BASE_URL + 'dist/assets/'))
      .pipe(gulp.dest('media/dist/assets'));
});

gulp.task('layout-js', function() {
    gulp.src(['media/bower_components/jquery/dist/jquery.min.js', 'media/bower_components/bootstrap/dist/js/bootstrap.min.js', 'media/bower_components/underscore/underscore-min.js', 'media/bower_components/handlebars/handlebars.min.js', 'media/bower_components/swp-plugins/assets/js/mootools-core.min.js', 'media/bower_components/swp-plugins/assets/js/mootools.min.js', 'media/bower_components/swp-plugins/assets/js/mootools-interfaces.min.js'])
    .pipe(plumber())
    .pipe(concatJs('app.min.js'))  // concat and name it "concat.js"
    .pipe(gulp.dest('media/dist/assets'));
});

gulp.task('layout', ['fonts', 'layout-css', 'layout-js']);

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

gulp.task('login', function(){
  gulp.src(['media/bower_components/jquery/dist/jquery.min.js', 'media/bower_components/handlebars/handlebars.min.js'])
    .pipe(plumber())
    .pipe(concatJs('app.min.js'))  // concat and name it "concat.js"
    .pipe(gulp.dest('media/dist/login'));

  gulp.src(['media/dist/assets/styles.min.css','media/assets/login/css/index.css'])
    .pipe(plumber())
    .pipe(concatCss('styles.min.css'))
    .pipe(minifyCss())
    .on('error', errorLog)
    .pipe(gulp.dest('media/dist/login'))
    .pipe(livereload());
});

