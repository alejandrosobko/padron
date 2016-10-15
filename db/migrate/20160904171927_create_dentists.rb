class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :surname
      t.integer :enrollment
      t.string :location
      t.string :institution
      t.string :street
      t.integer :number
      t.integer :telephone
      t.integer :cellphone
      t.string :email
      t.string :specialty

      t.timestamps null: false
    end
  end
end
