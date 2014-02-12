require 'spec_helper'

describe "adhoc_deliverables/edit" do
  before(:each) do
    @adhoc_deliverable = assign(:adhoc_deliverable, stub_model(AdhocDeliverable,
                                                   :name => "MyString",
                                                   :description => "MyText",
                                                   :project_phase_id => 1,
                                                   :deliverable_type_id => 1,
                                                   :complexity => "low",
                                                   :estimated_effort => 2,
                                                   :estimated_production_rate => 12,
                                                   :estimated_size => 24,
                                                   :unit_of_measure =>"pages"
    ))
  end

  it "adhoc_deliverable :project_phase_id" do
    @adhoc_deliverable.project_phase_id.should eql(1)
  end

  it "adhoc_deliverable :deliverable_type_id" do
    @adhoc_deliverable.deliverable_type_id.should eql(1)
  end

  it "adhoc_deliverable :estimated_effort" do
    @adhoc_deliverable.estimated_effort.should eql(2)
  end

  it "adhoc_deliverable :estimated_production_rate" do
    @adhoc_deliverable.estimated_production_rate.should eql(12)
  end

  it "adhoc_deliverable :name" do
    @adhoc_deliverable.name.should eql("MyString")
  end

  it "adhoc_deliverable :description" do
    @adhoc_deliverable.description.should eql("MyText")
  end

  it "adhoc_deliverable :complexity" do
    @adhoc_deliverable.complexity.should eql("low")
  end

  it "adhoc_deliverable :unit_of_measure" do
    @adhoc_deliverable.unit_of_measure.should eql("pages")
  end




  it "renders the edit adhocdeliverable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "form[action=?][method=?]", deliverable_path(@deliverable), "post" do
    # assert_select "input#deliverable_name[name=?]", "deliverable[name]"
    # assert_select "textarea#deliverable_description[name=?]", "deliverable[description]"
    # assert_select "input#deliverable_project_phase_id[name=?]", "deliverable[project_phase_id]"
    # assert_select "input#deliverable_deliverable_type_id[name=?]", "deliverable[deliverable_type_id]"
    # end
    # rendered.should contain("Edit Deliverable")
    rendered.should match(/Name/)
    rendered.should match(/Description/)

  end

end
