class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.string :title
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
