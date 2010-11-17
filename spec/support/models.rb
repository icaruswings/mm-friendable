class User
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Friendable

  key :email, String
  
  def on_add_friend(friend)
    reload
    friend.reload
  end
  
  def on_remove_friend(friend)
    reload
    friend.reload
  end
end