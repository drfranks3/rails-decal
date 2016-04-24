class ChangeColumnToSentiments < ActiveRecord::Migration
  def change
     change_column :Sentiments, :sentiment, :float
  end
end
