class Store < ApplicationRecord
  belongs_to :user

  before_validation :generate_slug, on: :create

  validates :nome, :slug, :slogan, presence: true
  validates :slug, uniqueness: true

  has_many :products, dependent: :destroy

  def to_param
    slug
  end

   private

  def generate_slug
    self.slug = nome.parameterize if nome.present? && slug.blank?
  end
end
