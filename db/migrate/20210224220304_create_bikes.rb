class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.string :address
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
