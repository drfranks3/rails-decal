class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.string :word
      t.integer :sentiment

      t.timestamps null: false
    end
  end
end
