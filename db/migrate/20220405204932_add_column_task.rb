class AddColumnTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :memo, :text
  end
end
