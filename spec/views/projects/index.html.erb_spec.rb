require 'spec_helper'

describe "/projects" do
  before(:each) do
    @project = assign(:project,
                      stub_model(Project,
                                 :name => "Project1",
                                 :description => "Test project1",
                                 :lifecycle_type => "Waterfall",
                                 :project_phase => "Requirement"
                      ))
  end

  it "displays management info for the projects" do
    # visit '/projects'
    # expect(page).to have_content('Project Management')
  end

  it "renders a form to update a project" do
    # visit '/projects'
    # expect(page).to have_selector('a',
    #                               :href => "/projects/new")
  end

  it "should have button to new a project" do
    # visit '/projects'
    # page.should_not have_selector('button', :type => "button")
    # page.should contain("Projects List")
  end

end
