class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.timestamp :time
      t.integer :by
      t.integer :compliment
      t.string :reason

      t.timestamps null: false
    end
  end
end
