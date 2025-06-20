class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :nome
      t.string :variante
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
