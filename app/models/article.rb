class Article < ApplicationRecord

    # dependent: :destroy, actual como una eliminacion en cascada,,
    # en donde a  eliminar el padre (Article) se elimina de igual forma el hijo (Comment)
    has_many :comments, dependent: :destroy
    
    # estamos validando un campo, para el title que sea de 5 caracteres (Tamaño)
    validates :title, presence: true, length: { minimum: 5 }

end
