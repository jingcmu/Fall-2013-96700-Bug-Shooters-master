require 'spec_helper'

describe AdhocDeliverable do
  pending "add some examples to (or delete) #{__FILE__}"


  before do
    @adhoc_deliverable = AdhocDeliverable.new(description:"it is a adhoc deliverable",name: "adhoc_deliverabel.doc",
                                              complexity: "low",estimated_size: 2, estimated_production_rate: 12,
                                              estimated_effort: 24, project_phase_id: 1, unit_of_measure: "pages")
  end

  subject{@adhoc_deliverable}

  it {should respond_to(:name)}
  it {should respond_to(:description)}
  it {should respond_to(:complexity)}
  it {should respond_to(:estimated_size)}
  it {should respond_to(:estimated_production_rate)}
  it {should respond_to(:estimated_effort)}
  it {should respond_to(:project_phase_id)}
  it {should respond_to(:unit_of_measure)}

  it {should be_valid}

  its(:name) {should match('adhoc_deliverabel.doc') }
  its(:project_phase_id) { should == 1 }
  its(:description) { match('it is a adhoc deliverable') }
  its(:complexity) {should match('low') }
  its(:estimated_size) {should == 2 }
  its(:estimated_production_rate) { should == 12 }
  its(:estimated_effort) { should == 24 }
  its(:unit_of_measure) { should match('pages')}

end

describe AdhocDeliverable do
  before do
    @adhoc_deliverable_nil = AdhocDeliverable.new
  end

  subject{@adhoc_deliverable_nil}

  it {should_not be_valid}
  its(:name) { should be_nil }
  its(:project_phase_id) { should be_nil }
  its(:description) { should be_nil }
  its(:complexity) { should be_nil }
  its(:estimated_size) { should be_nil }
  its(:estimated_production_rate) { should be_nil }
  its(:estimated_effort) { should be_nil }
  its(:unit_of_measure) { should be_nil }

#for create adhoc deliverable page
  it 'raises an error if saved without a name' do
    adhoc_deliverable = AdhocDeliverable.new
    expect { adhoc_deliverable.save! }.to raise_error(
                                        ActiveRecord::RecordInvalid
                                    )
  end
end
