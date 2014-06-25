# Be sure to restart your server when you modify this file.

# BaseApp::Application.config.session_store :cookie_store, key: '_base_app_session'
BaseApp::Application.config.session_store :active_record_store, key: '_base_app_session'
