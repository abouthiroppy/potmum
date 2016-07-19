module ApplicationHelper
  def webpack_path(path)
    host = Rails.application.config.action_controller.asset_host
    manifest = Rails.application.config.assets.webpack_manifest
    if manifest && manifest[path]
      "#{host}/webpack/#{manifest[path]}"
    else
      "#{GlobalSetting.development_asset_server}/#{path}"
    end
  end

  def current_user
    @current_user
  end

  def global_alert
    GlobalSetting.use_global_alert? ? GlobalSetting.global_alert : nil
  end
end
