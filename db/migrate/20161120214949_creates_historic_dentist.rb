class CreatesHistoricDentist < ActiveRecord::Migration
  def change
    create_table :historic_dentists do |t|
      t.integer :version
      t.datetime :modification_time
    end
  end
end
