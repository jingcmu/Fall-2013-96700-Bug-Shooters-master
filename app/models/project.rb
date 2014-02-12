# Each project has a name, description, belongs to a particular lifecycle type and many project phases
class Project < ActiveRecord::Base
  validates :name,:description, presence: true
  attr_accessible :description, :lifecycle_id, :name, :project_phase, :lifecycle, :user_id
  has_many :deliverables
  has_and_belongs_to_many :users

  def createProjectPhasesByProject(project)
    project_phase_list = []
    lifecycle_phase_list = LifecyclePhase.all
    lifecycle_phase_list.each do |lifecycle_phase|
      if lifecycle_phase.lifecycle_id == project.lifecycle_id
          project_phase_list.append(lifecycle_phase)
      end
    end
    return project_phase_list
  end

  def getLifecycleByProject(project)
    return Lifecycle.find(project.lifecycle_id)
  end

  def getEstimatedEffortByProject(project)

    deliverable_list = Deliverable.all
    estimated_effort = 0
    deliverable_list.each do |deliverable|
      if deliverable.project_id == project.id
        estimated_effort += deliverable.estimated_effort
      end
    end
    return estimated_effort
  end

  def getActualEffortByProject(project)

    deliverable_list = Deliverable.all
    actual_effort = 0
    deliverable_list.each do |deliverable|
      if deliverable.project_id == project.id
        if deliverable.actual_effort != nil
          actual_effort += deliverable.actual_effort
        end
      end
    end
    return actual_effort
  end

end

