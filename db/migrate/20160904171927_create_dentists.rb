class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :surname
      t.integer :enrollment
      t.text :institutes, array: true, default: []
      t.text :telephones, array: true, default: []
      t.text :cellphones, array: true, default: []
      t.text :emails    , array: true, default: []
      t.string :specialty
      t.integer :version, default: 1

      t.timestamps null: false
    end
  end
end
