# Each project phase belongs to a project and has many deliverable types and deliverables.
class ProjectPhase < ActiveRecord::Base
  attr_accessible :description, :name, :project_id
  validates :name,:description, presence: true

  #sum up all estimated effort of deliverables belong to a project phase
  def getEstimatedEffortByProjectPhase(project_phase)

    deliverable_list = Deliverable.all
    estimated_effort = 0
    deliverable_list.each do |deliverable|
      if deliverable.project_phase_id == project_phase.id
        estimated_effort += deliverable.estimated_effort
      end
    end
    return estimated_effort
  end

  #sum up all actual effort of deliverables belong to a project phase
  def getActualEffortByProjectPhase(project_phase)

  	deliverable_list = Deliverable.all
  	actual_effort = 0
  	deliverable_list.each do |deliverable|
  		if deliverable.project_phase_id == project_phase.id
  			actual_effort += deliverable.actual_effort
  		end
  	end
    return actual_effort
  end


end
