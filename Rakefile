require File.expand_path('../config/application', __FILE__)

BaseApp::Application.load_tasks

MiniTest::Rails::Testing.default_tasks << 'lib'

task test_task: :environment do
  p 'test_task'
end
