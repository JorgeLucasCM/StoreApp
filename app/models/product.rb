class Product < ApplicationRecord
  belongs_to :store
  has_one_attached :imagem   # suporte a imagem
  
  validates :nome, :variantes, presence: true
end