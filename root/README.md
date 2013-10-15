# {%= name %}

{%= description %}

## Getting Started
### Development
Most of your work will be done on ```src``` directory. If you
 * change a coffee file,
 * change a sass file,
 * add images to ```src/img``` or ```src/res``` directories
 * change any XML or HTML file under ```src```directory

you'll have to run ```grunt coffee```, ```grunt sass``` and ```grunt sync```, respectivelly,
unless you started ```grunt watch``` to watch these changes automatically (the default
```grunt``` task starts ```watch``` task after build the app under ```www``` directory).

The generated JavaScript and Stylesheets files will be placed at ```www/js```, ```www/spec```
and ```www/css``` directories.

### Run Jasmine Tests
```
npm test
```

### Generate JavaScripts after editing coffe code
```
grunt coffee
```

### Generate Stylesheets after editing sass code
```
grunt sass
```

### Watch for coffee / sass changes
```
grunt watch
```

Note: you must restart grunt watch when Gruntfile is changed

### Local (in-browser) tests
```
open www/index.html
```

### Emulate application
Read carefully the

[Platform Guide](http://cordova.apache.org/docs/en/3.1.0/guide_platforms_index.md.html#Platform%20Guides)
to setup the device on which you want to deploy your app. Then execute

Before you can build the project, you need to specify a set of target platforms:
```
cordova platform add android
```
or
```
cordova platform add ios
```

Run on emulator:
```
cordova emulate android
```
or
```
cordova emulate ios
```

and so on...

Learn more cordova commands at
[Cordova-CLI docs](http://cordova.apache.org/docs/en/3.1.0/guide_cli_index.md.html#The%20Command-line%20Interface)

### Release application
#### Android
In order to release an Android APK, it must be [signed and zipaligned](http://developer.android.com/tools/publishing/app-signing.html).
First, a private key must be generated to the application and stored in a Keystore:
```
keytool -genkey -v -keystore /path/to/my/.keystore -alias {%= name %} -keyalg RSA -keysize 2048
```
and the environment variables must be configured:
```
export KEYSTORE_DIR=/path/to/my/.keystore
export KEYSTORE_PASS=my_keystore_password
```
then, execute
```
grunt exec:release_android
```
to sign and zipalign the apk, generating the release package ```platforms/android/bin/{%= name %}.apk```.

## License
Copyright (c) {%= grunt.template.today('yyyy') %} {%= author_name %}

Licensed under the {%= licenses.join(', ') %} license{%= licenses.length === 1 ? '' : 's' %}.
