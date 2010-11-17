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
  
end