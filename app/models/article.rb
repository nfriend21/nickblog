class Article < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :tags_attributes

  belongs_to :user
  has_many :comments

  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :tags

end
