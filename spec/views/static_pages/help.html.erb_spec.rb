require 'spec_helper'

describe 'static_pages/help.html.erb' do

  it 'should contain PET help in help page' do
    render
    rendered.should contain('PET help')
  end

  it 'checks for content in help page' do
    render
    rendered.should contain('This app is used for tracking and estimating projects. The name of the app is "Process Enactment Tool". Currently, this is a single user app. We allow the user to create a Project by clicking on the New Projects link in /projects page. The user has to provide name, description and the lifecycle type of the project. We have added validation tests in our model which prevents the user from creating a project without a name and a description. We are yet to implement the choose lifecycle type logic.')
  end

  it 'checks for content in help page' do
    render
    rendered.should contain('Once the user creates a project, it takes him/her to the /projects/id page when id the id of the project to be displayed. Here, the name, description and lifecycle of the project is displayed. The user is allowed to choose a project phase depending on the chosen lifecycle type (to be implemented). Currently we have displayed phases for Waterfall lifecycle. When you click on any of the links{Combobox is yet to be implemented} it takes the user to the view project phases page (/project_phases/show) where user can create a deliverable and view existing deliverables for that particular project phase.')
  end

  it 'checks for content in help page' do
    render
    rendered.should contain('Clicking on create typical deliverable will take the user to /deliverables/new page. User can enter the name and description of the deliverable and choose a deliverable type to create the deliverable. To estimate the effort, user has to enter the complexity, Unit of Measure, the Estimated size and the estimated production rate. Based on the entered size and production rate, PET calculates the effort for realizing this deliverable(logic to be implemented). ')
  end

end