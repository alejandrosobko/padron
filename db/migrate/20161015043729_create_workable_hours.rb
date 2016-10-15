class CreateWorkableHours < ActiveRecord::Migration
  def change
    create_table :workable_hours do |t|
      t.integer :from
      t.integer :to

      t.timestamps null: false
    end
  end
end
