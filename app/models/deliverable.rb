#Each deliverable has a deliverable type and belongs to a project phase(relationships to be implemented)
class Deliverable < ActiveRecord::Base
  attr_accessible :deliverable_type_id, :description, :name, :project_phase_id,
                  :project_id, :complexity, :estimated_effort,
                  :estimated_production_rate, :estimated_size, :unit_of_measure	

  has_one :deliverable_type
  belongs_to :project


  validates :name, presence: true
  # validates :deliverable_type_id, presence: true
  validates :description, presence: true


  def getProjectByDeliverable(deliverable)
    project = Project.find_by_id(deliverable.project_id)
    return project
  end

  def getProjectPhaseByDeliverable(deliverable)
    return LifecyclePhase.find_by_id(deliverable.project_phase_id).name
  end
end

