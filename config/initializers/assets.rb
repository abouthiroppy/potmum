# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

begin
  path = Rails.root.join('public', 'webpack', 'webpack-manifest.json')
  if File.exist?(path)
    Rails.application.config.assets.webpack_manifest = JSON.parse(File.read(path))
  end
end

require 'rack/reverse_proxy'
::Rails.application.config.middleware.use Rack::ReverseProxy do
  reverse_proxy '/webpack', 'http://localhost:8080'
  #reverse_proxy /^\/webpack\/(.+)$/, 'http://localhost:8080/$1'
end

