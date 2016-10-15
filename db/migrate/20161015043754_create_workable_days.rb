class CreateWorkableDays < ActiveRecord::Migration
  def change
    create_table :workable_days do |t|
      t.string :day

      t.timestamps null: false
    end
  end
end
