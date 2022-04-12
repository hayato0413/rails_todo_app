class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :startday
      t.date :endday
      t.boolean :everyday
      t.timestamps
    end
  end
end
