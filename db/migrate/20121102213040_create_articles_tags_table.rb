class CreateArticlesTagsTable < ActiveRecord::Migration
  def up
  	create_table :articles_tags, :id => false do |t|
  		t.references :article 
  		t.references :tag
  	end
  end

  def down
  end
end
