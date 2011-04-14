require File.join(File.dirname(__FILE__), 'friendable', 'friend_list')

module MongoMapper
  module Plugins
    module Friendable
      extend ActiveSupport::Concern

      included do
        key :friend_list, FriendList

        key :followers_count, Integer, :default => 0
        key :following_count, Integer, :default => 0

        before_create :create_friend_list       
      end

      module InstanceMethods

        def friendable?; true; end

        def add_friend!(friend)
          return false if friend == self

          User.push_uniq(self.id, 'friend_list.following_ids' => friend.id)
          User.push_uniq(friend.id, 'friend_list.followers_ids' => self.id)
          User.increment(self.id, 'following_count' => 1)
          User.increment(friend.id, 'followers_count' => 1)

          on_add_friend(friend)
        end

        def on_add_friend(friend)
          raise NotImplementedError
        end

        def remove_friend!(friend)
          return false if friend == self
          
          User.pull(self.id, 'friend_list.following_ids' => friend.id)
          User.pull(friend.id, 'friend_list.followers_ids' => self.id)
          User.decrement(self.id, 'following_count' => 1)
          User.decrement(friend.id, 'followers_count' => 1)

          on_remove_friend(friend)
        end

        def on_remove_friend(friend)
          raise NotImplementedError
        end

        def followers
          User.find(self.friend_list.followers_ids)
        end

        def following
          User.find(self.friend_list.following_ids)
        end

        def following?(user)
          self.friend_list.following_ids.include?(user.id)
        end

        protected
        def create_friend_list
          self.friend_list = FriendList.new unless self.friend_list.present?
        end

     end

     module ClassMethods
     end

    end
  end
end