class TagsController < ApplicationController

	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.create(params[:tag])
	end

end