class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.integer :win, null: false
      t.integer :loss, null: false
      t.integer :grade
      t.string :place
      t.belongs_to :wrestler

      t.timestamps
    end
  end
end
