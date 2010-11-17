class FriendList
  include MongoMapper::EmbeddedDocument

  key :followers_ids, Array, :typecast => 'ObjectId'
  key :following_ids, Array, :typecast => 'ObjectId'
end