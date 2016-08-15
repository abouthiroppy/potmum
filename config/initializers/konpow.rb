Konpow.configure do |config|
  config.base_path = 'assets'
  config.manifest_path = Rails.root.join('public', 'assets', 'webpack-manifest.json')
  config.dev_host = GlobalSetting.development_asset_server
end
