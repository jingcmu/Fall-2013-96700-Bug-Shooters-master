class HistoricalData < ActiveRecord::Base
  attr_accessible :complexity, :description, :estimated_effort, :estimated_production_rate, :estimated_size, :name, :unit_of_measure
end
