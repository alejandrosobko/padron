class CreateWorkableHours < ActiveRecord::Migration
  def change
    create_table :workable_hours do |t|
      t.string :from
      t.string :to

      t.timestamps null: false
    end
  end
end
