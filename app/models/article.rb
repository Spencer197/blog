class Article < ApplicationRecord

    validates :title, presence: true,
                        length: { minimum: 4 }#ensure that all articles have a title that is at least four characters long.

end
