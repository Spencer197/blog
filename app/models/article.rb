class Article < ApplicationRecord
    has_many :comments, dependent: :destroy#Tells ApplicationRecord that an article may have more than one (many) comments.
    validates :title, presence: true,
                        length: { minimum: 4 }#Ensures that all articles have a title that is at least four characters long.
end
#These two declarations(has_many in article.rb & belongs_to in comment.rb) enable a good bit of automatic behavior.
#For example, if you have an instance variable @article containing an article,
#you can retrieve all the comments belonging to that article as an array using @article.comments.
#We use a 'dependent option' in line 2 to remove comments associated with the comment we deleted(destroyed). (Added in Unit-8)
