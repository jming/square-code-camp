class Pictures < ActiveRecord::Migration
  def change
  	add_column :events, :pictures, :file_path
  end
end
