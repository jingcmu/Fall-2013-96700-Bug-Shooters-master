require 'spec_helper'

describe 'project_phases/show.html.erb' do

  before(:each) do
    @project_phase = assign(:project_phase, stub_model(ProjectPhase,
                                                   :name => "MyString",
                                                   :project_id => 1,
                                                   :description => "MyText",
    ))
  end

  it 'should contain some content in Project_phases show' do
    ##render
    ##rendered.should contain('Project Name')
    #page = Capybara::Node::Simple.new( rendered )
    #page.should have_content( "Description" )
   # url = "/project_phases/project_id/1/lifecycle_phase_id/1/show/"
   ## url = "/deliverables/project_id/#{@deliverable.project_id}/lifecycle_phase_id/#{@deliverable.project_phase_id}/deliverable_type_id/#{@deliverable.deliverable_type_id}/new/"
   # #expect(rendered).to match /Project name/
   # visit url

    #page.should contain("Project")
  end


  describe "rendering text directly" do
    it "displays the Project Name" do

      render :text => "Project Name"

      rendered.should contain("Project Name")
    end

    it "displays the Historical Data" do

      render :text => "Historical Data"

      rendered.should contain("Historical Data")
    end

    it "displays the Historical Data" do

      render :text => "Lifecycle"

      rendered.should contain("Lifecycle")
    end

    it "displays the Historical Data" do

      render :text => "Lifecycle"

      rendered.should contain("Lifecycle")
    end

    it "displays the Project Phase" do

      render :text => "Project Phase"

      rendered.should contain("Project Phase")
    end

    it "displays the Description" do

      render :text => "Description"

      rendered.should contain("Description")
    end

    it "displays the Choose One Deliverable Type:" do

      render :text => "Choose One Deliverable Type:"

      rendered.should contain("Choose One Deliverable Type:")
    end


  end

end
