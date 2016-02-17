class CreateSandwichMakers < ActiveRecord::Migration
  def change
    create_table :sandwich_makers do |t|
      t.references :sandwich, index: true
      t.references :ingredient, index: true
      t.timestamps null: false
    end
  end
end
