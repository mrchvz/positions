class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :parent_position_id
      t.timestamps
    end
  end
end
