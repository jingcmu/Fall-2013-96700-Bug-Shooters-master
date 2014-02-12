require 'spec_helper'


describe "projects/show" do
  before(:each) do
    @project = assign(:project,
                      stub_model(Project,
                      :name => "Project1",
                      :description => "Test project",
                      :lifecycle_type => "Waterfall",
                      :project_phase => "Requirement"
                      ))
    @id = @project.id
    @edit_path = 'projects/#{@id}/edit'
  end
=begin

=begin
   it "should render attributes in <p>" do
     # render
     # rendered.should match(/Name/)
     # rendered.should match(/Description/)
     # rendered.should match(/Lifecycle type/)
     # rendered.should match(/Project phase/)
   end

  it "renders a selector to choose project phase for the project" do
    # render
    # rendered.should have_selector('select',
    #                               :id => "_project_project_phase"
    #                )
  end
=end

 end

