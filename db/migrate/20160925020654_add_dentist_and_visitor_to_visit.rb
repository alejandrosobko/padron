class AddDentistAndVisitorToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :dentist, index: true, foreign_key: true
    add_reference :visits, :visitor, index: true, foreign_key: true
  end
end
