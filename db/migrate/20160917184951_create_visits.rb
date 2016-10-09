class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :visit_date
      t.text :observations

      t.timestamps null: false
    end
  end
end
