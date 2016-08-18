class CreateWrestlers < ActiveRecord::Migration[5.0]
  def change
    create_table :wrestlers do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :gender
      t.integer :weight, null:false

      t.timestamps
    end
  end
end
