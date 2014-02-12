class DeliverableType < ActiveRecord::Base
  attr_accessible :name, :lifecycle_phase_id, :is_adhoc, :unit_of_measure
  validates :name, presence: true
  belongs_to :lifecycle_phase
end
