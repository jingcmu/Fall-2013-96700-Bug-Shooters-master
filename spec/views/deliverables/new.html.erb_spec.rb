require 'spec_helper'

describe "deliverables/new" do

  before {
    # lifecycle = Lifecycle.all[0]
    # project = Project.create!(:name => "Test", :description => "Test", :lifecycle_id => lifecycle.id)
    # lifecycle_phase = LifecyclePhase.find_by_id(lifecycle.id)
    # deliverable_type = DeliverableType.all[0]

    # url = "/deliverables/project_id/#{project.id}/lifecycle_phase_id/#{lifecycle_phase.id}/deliverable_type_id/#{deliverable_type.id}/new/"
    # visit url
  }

  it "displays the information need to be filled for the deliverable" do
    # page.should contain("New Deliverable")
  end

  it "displays the information of deliverable name" do
    # page.should contain("Name")    
  end

  it "displays the information of deliverable description" do
    # page.should contain("Description")
  end

  it "displays the information of deliverable complexity" do
    # page.should contain("Complexity")
  end

  it "displays the information of deliverable unit of measure" do
    # page.should contain("Unit of measure")
  end

  it "displays the information of deliverable estimated size" do
    # page.should contain("Estimated size")
  end

  it "displays the information of deliverable estimated production rate" do
    # page.should contain("Estimated production rate")
  end

  it "displays the button of back" do
    # page.should contain("Back")
  end

end
