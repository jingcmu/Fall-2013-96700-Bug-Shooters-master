class ProjectPhasesController < ApplicationController

  #get all info needed in show project phase page
  def show
    lifecycle_phase_id = params[:lifecycle_phase_id]
    project_id = params[:project_id]

    #get project and lifecycle(phase) by their id
    @project = Project.find(project_id)
    @lifecycle = Lifecycle.find(@project.lifecycle_id)
    @lifecycle_phase = LifecyclePhase.find(lifecycle_phase_id)

    #get all the deliverables belong to the project
    @deliverables = @project.deliverables

    #get the phase, type and type list of deliverable in a project phase
    @deliverables_phases = @deliverables.find_all_by_project_phase_id(@lifecycle_phase.id)
    @deliverable_types = DeliverableType.all
    @deliverable_type_list = getDeliverableTypeList(@lifecycle_phase)
  end

  #get deliverable type list belong to a project phase
  def getDeliverableTypeList(lifecycle_phase)
    return DeliverableType.find_all_by_lifecycle_phase_id(lifecycle_phase)
  end

end
