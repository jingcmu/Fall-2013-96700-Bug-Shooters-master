# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :adhoc_deliverable do
    name "MyString"
    description "MyText"
    project_phase_id 1
    complexity "MyString"
    unit_of_measure "MyString"
    estimated_size 1
    estimated_production_rate 1
    estimated_effort 1
  end
end
