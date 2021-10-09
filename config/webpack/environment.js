const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)

environment.config.merge({
    output: {
        // Choose whatever you want for `library`, [name] is a placeholder
        library: ['Packs', 'Overview'],

        // Attach the library to the global scope in the browser
        libraryTarget: 'window'
    },
})

module.exports
