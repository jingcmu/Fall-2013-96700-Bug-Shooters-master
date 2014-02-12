# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_phase do
    name "MyString"
    description "MyText"
    project_id 1
    deliverable_type "MyString"
  end
end
