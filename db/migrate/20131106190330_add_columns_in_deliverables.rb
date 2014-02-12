class AddColumnsInDeliverables < ActiveRecord::Migration
    def change
        add_column :deliverables, :complexity, :string
        add_column :deliverables, :unit_of_measure, :string
        add_column :deliverables, :estimated_size, :integer
        add_column :deliverables, :estimated_production_rate, :integer
        add_column :deliverables, :estimated_effort, :integer
    end
end
