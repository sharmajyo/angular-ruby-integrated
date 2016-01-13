module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    sass: {
      dev: {
        files: {
          'assets/styles/style.css' : 'assets/styles/sass/style.scss'
        }
      }
    },
    watch: {
      css: {
        files: 'assets/styles/sass/*.scss',
        tasks: ['sass:dev'],
        options: {
          livereload: true,
        }

      }
    },
    connect:{
      example: {
        port: 9000,
        hostname: 'localhost',
        base: '',
        options: {
          livereload: false,
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-connect');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default',['sass:dev','watch']);
  grunt.registerTask('serve', function (target) {
    grunt.task.run([
      'sass:dev','connect'
    ]);
  });

};