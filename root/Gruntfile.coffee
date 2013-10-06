module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        options:
          bare: true
        files:
          'www/js/app.js':        'src/app/*.coffee'
          'www/spec/specs.js':    'src/spec/*.coffee'
          'www/spec/helpers.js':  'src/spec/helpers/*.coffee'
    sass:
      dist:
        files:
          'www/css/app.css':  'src/sass/*.sass'
    jasmine:
      coverage:
        src:        'www/js/app.js'
        options:
          specs:    'www/spec/specs.js'
          helpers:  'www/spec/helpers.js'
          template: require('grunt-template-jasmine-istanbul'),
          templateOptions:
            coverage: 'coverage/coverage.json'
            report: 'coverage'
            thresholds:
              lines: 75
              statements: 75
              branches: 75
              functions: 90
    concat:
      options:
        separator: ';'
      js:
        dest: 'www/js/lib.js'
        src: [
          'vendor/jquery/jquery.min.js',
          'vendor/jquery-mobile-bower/js/jquery.mobile-*.min.js'
        ]
      css:
        dest: 'www/css/lib.css'
        src: [
          'vendor/jquery-mobile-bower/css/jquery.mobile-*.min.css'
        ]
    sync:
      assets:
        files: [
          { cwd: 'src', src: 'img/**', dest: 'www' },
          { cwd: 'src', src: 'res/**', dest: 'www' }
          { cwd: 'vendor/jquery-mobile-bower/css', src: 'images/*', dest: 'www/css' }
        ]
      main:
        files: [
          { cwd: 'src', src: '*.xml',  dest: 'www/' },
          { cwd: 'src', src: '*.html',  dest: 'www/' },
        ]
    watch:
      coffee:
        files: ['src/app/*', 'src/spec/*', 'src/spec/helpers/*' ]
        tasks: 'coffee'
      sass:
        files: 'src/sass/*'
        tasks: 'sass'
      sync:
        files: ['src/img/**', 'src/res/**', 'src/*.xml', 'src/*.html']
        tasks: 'sync'

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-sync'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  # Default task(s).
  grunt.registerTask 'default', ['coffee', 'sass', 'concat', 'sync', 'jasmine', 'watch']
