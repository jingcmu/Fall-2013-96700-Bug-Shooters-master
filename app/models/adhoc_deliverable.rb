class AdhocDeliverable < ActiveRecord::Base
  attr_accessible :complexity, :description, :estimated_effort,
                  :estimated_production_rate, :estimated_size,
                  :name, :project_phase_id, :unit_of_measure,
                  :project_id


  validates :name, presence: true
  # validates :deliverable_type_id, presence: true
  validates :description, presence: true

end
