require 'spec_helper'

describe "deliverables/edit" do
  before(:each) do
    @deliverable = assign(:deliverable, stub_model(Deliverable,
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

  it "deliverable :project_phase_id" do
    @deliverable.project_phase_id.should eql(1)
  end

  it "deliverable :deliverable_type_id" do
    @deliverable.deliverable_type_id.should eql(1)
  end

  it "deliverable :estimated_effort" do
    @deliverable.estimated_effort.should eql(2)
  end

  it "deliverable :estimated_production_rate" do
    @deliverable.estimated_production_rate.should eql(12)
  end

  it "deliverable :name" do
    @deliverable.name.should eql("MyString")
  end

  it "deliverable :description" do
    @deliverable.description.should eql("MyText")
  end

  it "deliverable :complexity" do
    @deliverable.complexity.should eql("low")
  end

  it "adhoc_deliverable :unit_of_measure" do
    @deliverable.unit_of_measure.should eql("pages")
  end



  it "renders the edit deliverable form" do
    # render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "form[action=?][method=?]", deliverable_path(@deliverable), "post" do
      # assert_select "input#deliverable_name[name=?]", "deliverable[name]"
      # assert_select "textarea#deliverable_description[name=?]", "deliverable[description]"
      # assert_select "input#deliverable_project_phase_id[name=?]", "deliverable[project_phase_id]"
      # assert_select "input#deliverable_deliverable_type_id[name=?]", "deliverable[deliverable_type_id]"
    # end
    # rendered.should contain("Edit Deliverable")
    # rendered.should contain("Name")
    # rendered.should contain("Description")

  end

end
