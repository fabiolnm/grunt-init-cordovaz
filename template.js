'use strict';

// Basic template description.
exports.description = 'Create a Cordova scaffold, to write apps ' +
  'using Grunt, Bower, Sass, CoffeeScript, Jasmine and jquery-mobile';

// Template-specific notes to be displayed before question prompts.
exports.notes = exports.description;

// Template-specific notes to be displayed after question prompts.
exports.after = 'You should now install project dependencies with _npm ' +
  'install_. After that, you may execute project tasks with _grunt_. ';

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*';

// The actual init template.
exports.template = function(grunt, init, done) {
  init.process({}, [
    // Prompt for these values.
    init.prompt('name'),
    init.prompt('package', 'com.acme'),
    init.prompt('description',
      'This description will be placed as the first paragraph of generated README, ' +
      'to the package.json file and www/config.xml description value'
    ),
    init.prompt('repository'),
    init.prompt('version', '0.0.1'),
    init.prompt('licenses', 'MIT'),
    init.prompt('author_name'),
    init.prompt('author_email')
  ], function(err, props) {
    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Add properly-named license files.
    init.addLicenseFiles(files, props.licenses);

    // Actually copy (and process) files.
    // noprocess: tells to not process and corrupt image files
    // see http://stackoverflow.com/questions/18414150/grunt-init-copyandprocess-corrupting-png-files
    // and http://gruntjs.com/project-scaffolding#copying-files
    init.copyAndProcess(files, props, {noProcess: ['src/img/**', 'src/res/**'] });

    props['npm_install']     = 'bower install && grunt';
    props['scripts']         = {
      install:  "bower install && grunt",
      test:     "grunt jasmine"
    }
    props['dependencies']    = {
      "cordova": '~3.1.0'
    };
    props['devDependencies'] = {
      "bower": "~1.2.7",
      "grunt": "~0.4.1",
      "grunt-contrib-concat": "~0.3.0",
      "grunt-contrib-watch":  "~0.5.3",
      "grunt-sync":           "~0.0.4",
      "grunt-contrib-sass":   "~0.5.0",
      "grunt-contrib-coffee": "~0.7.0",
      "grunt-contrib-jshint": "~0.6.3",
      "grunt-contrib-uglify": "~0.2.2",
      "grunt-template-jasmine-istanbul": "~0.2.5"
    }

    // Generate package.json file, used by npm and grunt.
    init.writePackageJSON('package.json', props);
    done();
  });

};
