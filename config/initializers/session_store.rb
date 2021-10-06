if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_htlradar", domain: "haiden.ch"
else
  Rails.application.config.session_store :cookie_store, key: "_htlradar"
end