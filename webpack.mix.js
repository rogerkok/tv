const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/assets/js/app.js', 'public/js')
mix
  .sass(
    'public/assets/scss/main.scss',
    'public/css'
  )
  .styles(
    [

      'public/assets/css/classy-nav.css',
      'public/assets/css/owl.carousel.min.css',
      'public/assets/css/magnific-popup.css',
    ],
    'public/css/vendors.css'
  )
  .styles(
    [

      'public/assets/css/style.css',
      'public/assets/css/custom.css'
    ],
    'public/css/style.css'
  )
  .styles(
    [

      'public/assets/css/profile.css',
    ],
    'public/css/profile.css'
  )
  .combine(
    ['public/assets/js/plugins/plugins.js'],
    'public/js/vendors.js'
  )
  .combine(
    [
      'public/assets/js/active.js',
      'public/assets/js/custom.js'
    ],
    'public/js/scripts.js'
  )
  .version()
mix.options({
  hmrOptions: {
    host: 'webtvgenioos.test',
    port: 8080
  }
})

mix.webpackConfig({
  resolve: {
    extensions: ['.js', '.json', '.vue'],
    alias: {
      '@': path.join(__dirname, './resources/assets/js')
    }
  },
  node: {
    fs: 'empty'
  }
})
Mix.listen('configReady', webpackConfig => {
  if (Mix.isUsing('hmr')) {
    // Remove leading '/' from entry keys
    webpackConfig.entry = Object.keys(webpackConfig.entry).reduce(
      (entries, entry) => {
        entries[entry.replace(/^\//, '')] = webpackConfig.entry[entry]

        return entries
      },
      {}
    )

    // Remove leading '/' from ExtractTextPlugin instances
    webpackConfig.plugins.forEach(plugin => {
      if (plugin.constructor.name === 'ExtractTextPlugin') {
        plugin.filename = plugin.filename.replace(/^\//, '')
      }
    })
  }
})
