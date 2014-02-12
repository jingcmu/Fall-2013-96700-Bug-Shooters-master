module ProjectsHelper

  #create project phases for a specific project according to the lifecycle type
  def create_project_phases
    if @lifecycle_type == 'Waterfall'
      project_phase.create(name: "Requirement", project_id: @project_id)
    end
  end
end
