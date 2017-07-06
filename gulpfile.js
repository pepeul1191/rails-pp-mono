var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concatCss = require('gulp-concat-css');
var concatJs = require("gulp-concat");
var minifyCss = require("gulp-minify-css");
var replace = require('gulp-replace');
var plumber = require('gulp-plumber');
var watch = require('gulp-watch');
var livereload = require('gulp-livereload');
var BASE_URL = 'http://localhost:3100/';

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function errorLog(error){
    console.error.bind(error);
    this.emit('end');
}

gulp.task('watch', function(){
    var server = livereload();

    gulp.watch(['public/assets/login/css/index.css'], ['login']);
});

gulp.task('default', function(){
	console.log("HOLA!!!");
});

gulp.task('demo', function(){
  gulp.src('assets/*/*.js')
    .pipe(plumber())
    .pipe(uglify())
    .pipe(gulp.dest('public/dist/js'));
});

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

gulp.task('fonts', function() {
  	gulp.src(['public/bower_components/font-awesome/fonts/*', 'public/bower_components/bootstrap/fonts/*'])
    .pipe(plumber())
      .pipe(gulp.dest('public/dist/assets'));
});

gulp.task('layout-css', function() {
      gulp.src(['public/dist/assets/icons.min.css','public/bower_components/bootstrap/dist/css/bootstrap.min.css', 'public/bower_components/font-awesome/css/font-awesome.min.css', 'public/bower_components/unify-pp/css/styles.css'])
      .pipe(plumber())
      .pipe(concatCss('styles.min.css'))
      .pipe(minifyCss())
      .pipe(replace('../../../font-awesome/fonts/', BASE_URL + 'dist/assets/'))
      .pipe(gulp.dest('public/dist/assets'));
});

gulp.task('layout-js', function() {
    gulp.src(['public/bower_components/jquery/dist/jquery.min.js', 'public/bower_components/bootstrap/dist/js/bootstrap.min.js', 'public/bower_components/underscore/underscore-min.js', 'public/bower_components/handlebars/handlebars.min.js', 'public/bower_components/swp-plugins/assets/js/mootools-core.min.js', 'public/bower_components/swp-plugins/assets/js/mootools.min.js', 'public/bower_components/swp-plugins/assets/js/mootools-interfaces.min.js'])
    .pipe(plumber())
    .pipe(concatJs('app.min.js'))  // concat and name it "concat.js"
    .pipe(gulp.dest('public/dist/assets'));
});

gulp.task('layout', ['fonts', 'layout-css', 'layout-js']);

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

gulp.task('login', function(){
  gulp.src(['public/bower_components/jquery/dist/jquery.min.js', 'public/bower_components/handlebars/handlebars.min.js'])
    .pipe(plumber())
    .pipe(concatJs('app.min.js'))  // concat and name it "concat.js"
    .pipe(gulp.dest('public/dist/login'));

  gulp.src(['public/dist/assets/styles.min.css','public/assets/login/css/index.css'])
    .pipe(plumber())
    .pipe(concatCss('styles.min.css'))
    .pipe(minifyCss())
    .on('error', errorLog)
    .pipe(gulp.dest('public/dist/login'))
    .pipe(livereload());
});

