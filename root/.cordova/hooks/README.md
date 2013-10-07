# Cordova Hooks

Scripts located in one of the following directories will be executed when the correspondent
cordova commands are executed:

 * after_build
 * after_compile
 * after_docs
 * after_emulate
 * after_platform_add
 * after_platform_ls
 * after_platform_rm
 * after_plugin_add
 * after_plugin_ls
 * after_plugin_rm
 * after_prepare
 * after_run
 * before_build
 * before_compile
 * before_docs
 * before_emulate
 * before_platform_add
 * before_platform_ls
 * before_platform_rm
 * before_plugin_add
 * before_plugin_ls
 * before_plugin_rm
 * before_prepare
 * before_run

Here an example of hook script:
```
#!/bin/sh

echo 'Yay!' >> yay.txt
```

A [good idea](http://www.mooreds.com/wordpress/archives/1197) is to name each hook to make the order explict:
```
001_script
010_script
020_script
120_script
```
executes scripts in the order you would expect, where:
```
1_script
10_script
20_script
120_script
```
