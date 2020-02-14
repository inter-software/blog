class Article < ApplicationRecord

    # dependent: :destroy, actual como una eliminacion en cascada,,
    # en donde a  eliminar el padre (Article) se elimina de igual forma el hijo (Comment)
    has_many :comments, dependent: :destroy

    has_and_belongs_to_many :categories #Relacion Many-to-Many a categorias
    
    #Upload Attachements 
    mount_uploaders :attachments, FileUploader
    
    # estamos validando un campo, para el title que sea de 5 caracteres (Tamaño)
    validates :title, presence: true, length: { minimum: 5 }

    validates :text, presence: true, length: { minimum: 100 }

    #File Content Type Validator
    #Arrays of String
    validates :attachments, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg', 'text/pdf'] }

    validates :attachments, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg', 'text/pdf'],
                                        message: 'Avatar only allows png, jpg, jpeg  and pdf' }

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
   
    

end
