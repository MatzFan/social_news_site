# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'bruce@me.com'
    password 'password'
  end
end
