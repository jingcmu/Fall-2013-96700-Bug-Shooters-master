require 'spec_helper'

describe "deliverables/show" do
  before(:each) do
    @deliverable = assign(:deliverable, stub_model(Deliverable,
      :name => "Name",
      :description => "MyText",
      :project_phase_id => 1,
      :deliverable_type_id => 2
    ))
  end

  xit "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end


 # @id = @deliverable.id
 # @show_path = 'deliverables/#{@id}'
=begin
  it "displays the information for the deliverable" do
    render
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Deliverable type/)
    rendered.should match(/Project phase/)
  end
=end



end
