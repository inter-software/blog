# frozen_string_literal: true

class Article < ApplicationRecord # rubocop:todo Style/Documentation
  # dependent: :destroy, actual como una eliminacion en cascada,,
  # en donde a  eliminar el padre (Article) se elimina de igual forma el hijo (Comment)
  has_many :comments, dependent: :destroy

  # has_and_belongs_to_many :categories #Relacion Many-to-Many a categorias

  has_many :verifieds
  has_many :users, through: :verifieds
  has_many :publications, as: :published

  # Upload Attachements
  mount_uploaders :attachments, ImageUploader

  mount_uploaders :attachments, PdfUploader

  # rubocop:todo Style/AsciiComments
  # estamos validando un campo, para el title que sea de 5 caracteres (Tamaño)
  # rubocop:enable Style/AsciiComments
  validates :title, presence: true, length: { minimum: 5 }

  validates :text, presence: true, length: { minimum: 10 }

  def self.category_with(name)
    Category.find_by!(name: name).articles
  end

  def self.category_counts
    Category.select('categories.*, count(categories.Category_id) as count').joins(:categories).group('categories.Category_id')
  end

  def category_list
    categories.map(&:name).join(', ')
  end

  def category_list=(names)
    self.categories = names.split(',').map do |c|
      Category.where(name: c.strip).first_or_create!
    end
  end

  def self.search(search, page)
    where(['upper(title) like ?',
           "%#{search}%".upcase]).paginate(page: page, per_page: 5).order('title')
  end
end
