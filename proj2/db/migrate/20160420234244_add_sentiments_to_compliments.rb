class AddSentimentsToCompliments < ActiveRecord::Migration
  def change
    add_column :compliments, :word, :string
    add_column :compliments, :sentiment, :integer
  end
end
