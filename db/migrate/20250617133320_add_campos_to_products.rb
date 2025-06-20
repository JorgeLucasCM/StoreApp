class AddCamposToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :descricao, :text
    add_column :products, :preco, :decimal
    add_column :products, :variantes, :string
  end
end
