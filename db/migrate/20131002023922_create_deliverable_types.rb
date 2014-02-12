class CreateDeliverableTypes < ActiveRecord::Migration
  def change
    create_table :deliverable_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
