class AddDentistToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :dentist, index: true, foreign_key: true
  end
end
