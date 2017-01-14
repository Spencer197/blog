class Comment < ApplicationRecord
  belongs_to :article#Sets up an Active Record association between comments and an article.
end
#These two declarations(has_many in article.rb & belongs_to in comment.rb) enable a good bit of automatic behavior.
#For example, if you have an instance variable @article containing an article,
#you can retrieve all the comments belonging to that article as an array using @article.comments.
