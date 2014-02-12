class LifecyclePhase < ActiveRecord::Base
  attr_accessible :description, :name, :lifecycle_id
  belongs_to :lifecycle
  has_many :deliverable_types
  validates :name,:description, presence: true


 #sum up all estimated effort of deliverables belong to a project
 def getEstimatedEffortByProjectPhase(lifecycle_phase, project_id)

    deliverable_list = Deliverable.find_all_by_project_id(project_id)
    estimated_effort = 0
    deliverable_list.each do |deliverable|
      if deliverable.project_phase_id == lifecycle_phase.id
        estimated_effort += deliverable.estimated_effort
      end
    end
    return estimated_effort
  end

  #sum up all estimated effort of deliverables belong to a project phase
  def getActualEffortByProjectPhase(lifecycle_phase, project_id)
    deliverable_list = Deliverable.find_all_by_project_id(project_id)
  	actual_effort = 0
  	deliverable_list.each do |deliverable|
  		if deliverable.project_phase_id == lifecycle_phase.id
  		  if deliverable.actual_effort != nil
  			  actual_effort += deliverable.actual_effort
  		  end
  		end
  	end
    return actual_effort
  end
end
