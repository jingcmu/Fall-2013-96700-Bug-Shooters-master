class AddUnitOfMeasureToDeliverableTypes < ActiveRecord::Migration
  def change
  	add_column :deliverable_types, :unit_of_measure, :string
  end
end
