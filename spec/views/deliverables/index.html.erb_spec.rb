=begin
require 'spec_helper'

describe "deliverables/index" do
  before(:each) do
    assign(:deliverables, [
      stub_model(Deliverable,
        :name => "Name",
        :description => "MyText",
        :project_phase_id => 1,
        :deliverable_type_id => 2
      ),
      stub_model(Deliverable,
        :name => "Name",
        :description => "MyText",
        :project_phase_id => 1,
        :deliverable_type_id => 2
      )
    ])
  end


  it "renders a list of deliverables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end

  it "displays the information for the all deliverables" do
    visit "/deliverables/"
    page.should contain("List Deliverables")

    page.should contain("Name")
    page.should contain("Description")
    page.should contain("Deliverable type")
    page.should contain("Project phase")

    page.should contain("New Deliverable")
  end
end
=end
