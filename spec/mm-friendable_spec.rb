require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MongoMapper::Plugins::Friendable" do
  
  before(:each) do
    @friendable = User.create(:email => 'lukec@icaruswings.com')
    @friend = User.create(:email => 'luke@icaruswings.com')
  end

  it "should be friendable" do
    @friendable.should be_friendable
  end

  it "should have followers_count and following_count attributes that default to 0" do
     @friendable.followers_count.should equal 0
     @friendable.following_count.should equal 0
  end
  
  it "should have a method for retrieving followers" do
     @friendable.should respond_to(:followers)
  end
  
  it "should have a method for retrieving friends" do
    @friendable.should respond_to(:following)
  end
  
  it "should provide the User with a friend_list" do
    @friendable.should respond_to(:friend_list)
    @friendable.friend_list.should be_a(FriendList)
  end

  describe "add_friend!" do
  
    it "should error if on_add_friend callback is not implemented" do
      @friendable = UserNoCallbacks.create

      lambda { @friendable.add_friend!(@friend) }.should raise_error(NotImplementedError)
    end
    
    it "should increment the following_count attribute" do
      lambda {
        @friendable.add_friend!(@friend)

      }.should change(@friendable, :following_count).by(1) 
    end
    
    it "should increment the followers_count attribute" do
      lambda {
        @friendable.add_friend!(@friend)

      }.should change(@friend, :followers_count).by(1) 
    end
    
    it "should add the friend to following list" do
      @friendable.add_friend!(@friend)

      @friendable.friend_list.following_ids.should include(@friend.id)
      @friendable.following.should include(@friend)
    end
    
    it "should add the follower" do
      @friendable.add_friend!(@friend)

      @friend.friend_list.followers_ids.should include(@friendable.id)
      @friend.followers.should include(@friendable)
    end

  end
  
  describe "remove_friend!" do
    
    before(:each) do
      @friendable.add_friend!(@friend)
    end
    
    it "should error if on_add_friend callback is not implemented" do
      @friendable = UserNoCallbacks.create
      @friendable.class_eval {
        def on_add_friend(friend)
          reload
          friend.reload
        end
      }
      @friendable.add_friend!(@friend)

      lambda { @friendable.remove_friend!(@friend) }.should raise_error(NotImplementedError)
    end
    
  
    it "should decrement the following_count attribute" do
      lambda {
        @friendable.remove_friend!(@friend)

      }.should change(@friendable, :following_count).by(-1) 
    end
    
    it "should decrement the followers_count attribute" do
      lambda {
        @friendable.remove_friend!(@friend)

      }.should change(@friend, :followers_count).by(-1) 
    end
    
    it "should remove the friend" do
      @friendable.remove_friend!(@friend)

      @friendable.friend_list.following_ids.should_not include(@friend.id)
      @friendable.following.should_not include(@friend)
    end
    
    it "should remove the follower" do
      @friendable.remove_friend!(@friend)

      @friend.friend_list.followers_ids.should_not include(@friendable.id)
      @friend.followers.should_not include(@friendable)
    end

  end
  
  describe "following?" do
    
    before(:each) do
      @friendable.add_friend!(@friend)
    end
  
    it "should return true if following" do
      @friendable.following?(@friend).should be_true 
    end
    
    it "should return false if not following" do
      @friend.following?(@friendable).should be_false 
    end

  end
  
end