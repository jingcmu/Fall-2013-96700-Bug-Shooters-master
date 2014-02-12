class CreateHistoricalData < ActiveRecord::Migration
  def change
    create_table :historical_data do |t|
      t.string :name
      t.string :description
      t.string :complexity
      t.string :unit_of_measure
      t.integer :estimated_size
      t.integer :estimated_production_rate
      t.integer :estimated_effort

      t.timestamps
    end
  end
end
