class CreateInstitute < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name
      t.string :location
      t.string :street
      t.integer :number
    end
  end
end
