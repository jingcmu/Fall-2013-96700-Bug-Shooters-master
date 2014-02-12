# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Mridula"
    email "mridula@gmail.com"
    password "foobarar"
    password_confirmation "foobarar"
  end
end
