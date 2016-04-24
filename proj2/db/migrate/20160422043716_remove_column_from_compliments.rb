class RemoveColumnFromCompliments < ActiveRecord::Migration
  def change
    remove_column :Compliments, :word
    remove_column :Compliments, :sentiment
  end
end
