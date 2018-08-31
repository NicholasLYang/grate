require_relative "../models/post"

class PostsResolver
  def self.index
    Post.all
  end

  def self.show(id)
    Post[id]
  end
end
