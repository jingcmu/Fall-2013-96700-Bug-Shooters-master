require 'spec_helper'

 describe "projects/edit" do
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
     #@edit_path = 'projects/1003'
  end

  it "renders the edit project form" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", project_path(@project), "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_description[name=?]", "project[description]"
      # assert_select "input#project_project_phase[name=?]", "project[project_phase]"
    end
  end

  it "displays the edit information for the project" do
    render
    rendered.should contain("Editing project")
    rendered.should contain("Name")
    rendered.should contain("Description")
    rendered.should contain("Lifecycle type")
    # rendered.should contain("Project phase")
  end

   it "renders a form to update a project" do
     render
     rendered.should have_selector('form',
                                   :method => "post"
                     )
   end

   it "should have input button to commit change" do
     render
     rendered.should have_selector('input',
                                   :name => "commit",
                                   :value => "Update Project",
                                   :type => "submit")
   end

=begin
   it "should have option to select lifecycle type" do
     render
     # rendered.should have_selector('select',
     #                 :id => "_project_lifecycle_type")
   end
=end

end
