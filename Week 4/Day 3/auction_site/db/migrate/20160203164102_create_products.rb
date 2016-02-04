class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id, index: true
      t.string :title
      t.text :description
      t.datetime :deadline
      t.integer :minimum_bid

      t.timestamps null: false
    end
  end
end
