class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :email, :name, :user_id

  belongs_to :user
  belongs_to :article
end
