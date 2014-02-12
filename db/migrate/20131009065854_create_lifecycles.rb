class CreateLifecycles < ActiveRecord::Migration
  def change
    create_table :lifecycles do |t|
      t.string :name

      t.timestamps
    end
  end
end
