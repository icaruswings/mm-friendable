class User
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Friendable

  key :email, String
  
  def on_add_friend(friend)
    true
  end
  
end