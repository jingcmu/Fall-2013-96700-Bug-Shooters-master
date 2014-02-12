require 'spec_helper'

describe Deliverable do
  it {#should belong_to(:project)
  }

=begin
  before do
    @deliverable = Deliverable.new(deliverable_type_id:1,description:"it is a deliverable",name: "Arc.doc", project_id: 1,
                                   complexity: "low",estimated_size: 2, estimated_production_rate: 12,
                                   estimated_effort: 24, project_phase_id: 1, unit_of_measure: "pages")
  end

  subject{@deliverable}
=end

  it {
     # should respond_to(:name)
  }
  it {
     # should respond_to(:deliverable_type_id)
  }
  it {
     # should respond_to(:description)
  }
  it {
     # should respond_to(:complexity)
  }
  it {
     # should respond_to(:estimated_size)
  }
  it {
     # should respond_to(:estimated_production_rate)
  }
  it {
     # should respond_to(:estimated_effort)
  }
  it {
     # should respond_to(:project_phase_id)
  }
  it {
     # should respond_to(:unit_of_measure)
  }
  it {
     # should respond_to(:project_id)
  }

  it {
     # should be_valid
  }

=begin
  its(:name) {
     # should match('Arc.doc')
  }
  its(:deliverable_type_id) {
     # should == 1
  }
  its(:project_phase_id) {
     # should == 1
  }
  its(:project_id) {
     # should == 1
  }
  its(:description) {
     # match('it is a deliverable')
  }
  its(:complexity) {
     # should match('low')
  }
  its(:estimated_size) {
     # should == 2
  }
  its(:estimated_production_rate) {
     # should == 12
  }
  its(:estimated_effort) {
     # should == 24
  }
  its(:unit_of_measure) {
     # should match('pages')
  }
=end

end

=begin
describe Deliverable do
  before do
    @deliverable_nil = Deliverable.new
  end

  subject{@deliverable_nil}

  it {
     # should_not be_valid
  }
  its(:name) {
     # should be_nil
  }
  its(:deliverable_type_id) {
     # should be_nil
  }
  its(:description) {
     # should be_nil
  }
  its(:project_id) {
     # should be_nil
  }
  its(:project_phase_id) {
     # should be_nil
  }
  its(:complexity) {
     # should be_nil
  }
  its(:estimated_size) {
     # should be_nil
  }
  its(:estimated_production_rate) {
     # should be_nil
  }
  its(:estimated_effort) {
     # should be_nil
  }
  its(:unit_of_measure) {
     # should be_nil
  }


#for create deliverable page
  it 'raises an error if saved without a name' do
    deliverable = Deliverable.new
    expect { deliverable.save! }.to raise_error(
              ActiveRecord::RecordInvalid
          )
  end
end
=end
