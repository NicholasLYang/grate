require_relative "../models/post"

class PostsResolver
  def self.index
    Post.all
  end

  def self.find(id)
    Post[id]
  end

  def self.find_by(field, field_name)
    Post.where("#{field_name}": field)
  end
end
