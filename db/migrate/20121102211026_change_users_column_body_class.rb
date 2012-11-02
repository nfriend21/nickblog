class ChangeUsersColumnBodyClass < ActiveRecord::Migration
  def change
  	change_table :articles do |t|
  		t.change :body, :text
  	end
  end
end
