class BaseGenerator < Thor::Group
  include Thor::Actions
  
  def self.to_relative(path)
    path.gsub(/.*templates\/new\//, '')
  end

  def self.snake_case(name)
    name.gsub('_', '-').underscore
  end
  def self.camel_case(name)
    name.gsub('-', '_').camelize
  end
end
