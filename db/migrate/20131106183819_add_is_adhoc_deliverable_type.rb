class AddIsAdhocDeliverableType < ActiveRecord::Migration
  def change
    add_column :deliverable_types, :is_adhoc, :integer
  end
end
