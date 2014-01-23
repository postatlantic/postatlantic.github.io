# http://gruntjs.com/configuring-tasks
# install node in ubuntu, maybe, https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
# running the process as a daemon wiht https://github.com/nodejitsu/forever
module.exports = (grunt) ->
  # Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat: {
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      css:
        src: 'css/*.css'
        dest: 'assets/style.css'
    }
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        mangle: false
      },
    }
    cssmin:
      files:
        'assets/style.min.css' : ['assets/style.css']
      add_banner:
        options:
          banner: '/* My minified css file */'
  })

  #load the plugin that provides the 'concat' task.
  grunt.loadNpmTasks('grunt-contrib-concat')

  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify')

  # https://github.com/gruntjs/grunt-contrib-cssmin
  grunt.loadNpmTasks('grunt-contrib-cssmin')



  grunt.registerTask 'styles', ['concat', 'cssmin']



