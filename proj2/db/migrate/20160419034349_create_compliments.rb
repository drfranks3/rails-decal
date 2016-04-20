class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.timestamp :time
      t.integer :ip
      t.integer :from
      t.integer :to
      t.string :text

      t.timestamps null: false
    end
  end
end
