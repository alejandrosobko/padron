class AddHistoricDentistToDentist < ActiveRecord::Migration
  def change
    add_reference :historic_dentists, :dentist, index: true, foreign_key: true
  end
end
