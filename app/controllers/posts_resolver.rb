class PostsController < ApplicationController
  def index
    Post.all
  end

  def find(id)
    Post[id]
  end

  def find_by(field, field_name)
    Post.where("#{field_name}": field)
  end
end
