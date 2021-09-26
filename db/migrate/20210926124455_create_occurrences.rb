class CreateOccurrences < ActiveRecord::Migration[6.1]
  def change
    create_table :occurrences do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
