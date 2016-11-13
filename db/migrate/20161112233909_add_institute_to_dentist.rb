class AddInstituteToDentist < ActiveRecord::Migration
  def change
    add_reference :institutes, :dentist, index: true, foreign_key: true
  end
end
