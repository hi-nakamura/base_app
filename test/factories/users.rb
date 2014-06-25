FactoryGirl.define do
  factory :test_user, class: User do
    user_id 'test_user'
    password 'password'
  end
end
