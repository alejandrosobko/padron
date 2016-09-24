class AddObservationsToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :observations, :text
  end
end
