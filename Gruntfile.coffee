# http://gruntjs.com/configuring-tasks
# install node in ubuntu, maybe, https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
# running the process as a daemon wiht https://github.com/nodejitsu/forever
module.exports = (grunt) ->
  # Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        seperator: ';/*THIS IS A NEW FILE !!!!*/\n'
      css:
        src: ['css/normalize.css','css/main.css','css/solido.css','css/isotope.css','css/responsive.css','css/vegas/jquery.vegas.css','css/popup/magnific-popup.css','css/color/blue.css','css/aditional.css']
        dest: 'assets/style.css'
      js:
        src : ['js/jquery.carouFredSel-6.2.1-packed.js','js/jquery.smoothwheel.js','js/main.js','js/jquery.inview.js','js/jquery.sticky.js','js/caroussel/jquery.easing.1.3.js','js/portfolio.js','js/vegas/jquery.vegas.js','js/jquery.hoverdir.js','js/jquery.nav.js','js/popup/jquery.magnific-popup.js','js/caroussel/jquery.contentcarousel.js','js/jquery.isotope.min.js','js/plugins.js','js/jquery.validate.js :','js/jquery.form.js','js/test.js','js/video.js']
        dest : 'assets/app.js'
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      files:
        'assets/app.min.js': ['assets/app.js']
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











