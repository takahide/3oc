Baseball::Application.configure do
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
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true


  ################ ここから追加した設定 ####################
  

  # trueにするとメール送信失敗時に例外発生させる。
  # 開発時はfalseだと問題に気づくことができないためtrueにする
  config.action_mailer.raise_delivery_errors = true

  # 送信プロトコルにSMTPを選択
  config.action_mailer.delivery_method = :smtp

  # SMTPの設定
  config.action_mailer.smtp_settings = {
    # smtpサーバのアドレス
    :address => 'smtp.example.com',
    :port => 587,
    # tmtpサーバにアクセスするためのユーザ名
    :user_name => 'nagahoge',
    # ユーザ名に対するパスワード
    :password => '******', 
    :authentication => :plain
  }

  # これを設定しないと
  # http://pgnote.net/?p=1320&preview=true&preview_id=1320&preview_nonce=a3837a0513
  # になる
  config.action_mailer.default_url_options = 
    { :host => 'localhost:3000' }
end
