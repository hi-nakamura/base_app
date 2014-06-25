set :path, '/var/www/base_app'
set :output, 'log/cron.log'

every 1.day, at: '9:00 pm' do
  runner 'SessionCleaner.remove_stale_sessions'
end
