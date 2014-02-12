#Each lifecycle has many projects and lifecycle phases that map to project phases(to be implemented)
class Lifecycle < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  belongs_to :project
  has_many :lifecycle_phases
end
