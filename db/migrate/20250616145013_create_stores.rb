class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.string :nome
      t.string :slug
      t.string :slogan
      t.text :descricao
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
