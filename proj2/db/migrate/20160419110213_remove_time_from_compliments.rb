class RemoveTimeFromCompliments < ActiveRecord::Migration
  def change
    remove_column :compliments, :time
  end
end
