BaseApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  BetterErrors::Middleware.allow_ip! '10.0.2.2'

  # メール設定
  config.action_mailer.default_url_options = { host: 'localhost:3000' }

  config.action_mailer.delivery_method = :smtp
  # メールの設定を行う(notice_mailer.rbのデフォルトも変更が必要！！)
  config.action_mailer.smtp_settings = {
    address: 'localhost',
    port: '25',
    domain: 'mydomain.com',
    authentication: :plain,
    user_name: ENV['mailtest@mydomain.com'],
    password: ENV['mailtest'],
    enable_starttls_auto: true
  }

  APP_TITLE = 'BaseApp'

  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end

# 動作確認用にDate.todayの日を変更する場合
#  t = Time.local(2014, 4, 1, 10, 0, 0)
#  Timecop.freeze(t)

end
