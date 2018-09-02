require_relative "../models/post"

class PostsController < ApplicationController
  def index
    Post.all
  end

  def self.find(id)
    Post[id]
  end

  def self.find_by(field, field_name)
    return Post[field] if field_name == :id
    Post.where("#{field_name}": field)
  end
end
