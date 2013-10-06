# grunt-init-cordovaz

A scaffold tool to create Cordova projects where you can:
 * write application code with CoffeeScript instead of JavaScript
 * write stylesheets with Sass instead of CSS
 * manage your external dependencies with Bower
 * test your application using a headless (phantomjs) Jasmine runner
 * measure code coverage with Istanbul
 * easily add more development tools (JSLint, Uglify, ...) using Grunt

The default scaffold also includes jquery-mobile.

## Getting Started

### Ensure grunt-init is installed
If you haven't already done so, install [grunt-init]( http://gruntjs.com/project-scaffolding).

### Clone CordovaZ to your grunt-init folder
```
git clone https://github.com/fabiolnm/grunt-init-cordovaz.git ~/.grunt-init/cordovaz
```

### Create your application folder
```
mkdir hello_world && cd hello_world
```

### Run grunt-init
```
grunt-init cordovaz
```

#### Note
Due to a unreleased grunt-init [issue](https://github.com/gruntjs/grunt-init/commit/2fc354c221a42729fa6a7fade784f4e757720a9e),
it's necessary to edit the generated ```package.json``` file, and add the following code:
```
"scripts": {
  "install": "bower install && grunt",
  "test": "grunt jasmine"
}
```

### Run installation script
```
npm install
```

### Read the README
The generated project's README contains detailed instructions about available
Cordova commands, Grunt tasks and development workflow.

## License
Copyright (c) 2013 Fábio Luiz Nery de Miranda

Licensed under the MIT license
