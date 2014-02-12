# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deliverable do
    name "MyString"
    description "MyText"
    project_phase_id 1
    deliverable_type_id 1
  end
end
