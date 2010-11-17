require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MongoMapper::Plugins::Friendable" do
  
  before(:each) do
    @friendable = User.create(:email => 'lukec@icaruswings.com')
    @friend = User.create(:email => 'luke@icaruswings.com')
  end

  it "should be commentable" do
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

  describe "add_vote!" do
  
    it "should increment the following_count attribute" do
      lambda {
        @friendable.add_friend!(@friend)
        @friendable.reload
      }.should change(@friendable, :following_count).by(1) 
    end
    
    it "should increment the followers_count attribute" do
      lambda {
        @friendable.add_friend!(@friend)
        @friend.reload
      }.should change(@friend, :followers_count).by(1) 
    end
    
    it "should add the following" do
      @friendable.add_friend!(@friend)
      @friendable.reload
      
      @friendable.following.should include(@friend)
    end
    
    it "should add the follower" do
      @friendable.add_friend!(@friend)
      @friend.reload
      
      @friend.followers.should include(@friendable)
    end

  end
  
end

# describe "Comment" do
#   
#   before(:each) do
#     @comment = Comment.new
#   end
#   
#   it "should be embeddable?" do
#     Comment.embeddable?.should be_true
#   end
#   
#   it "should be embeddable?" do
#     Comment.embeddable?.should be_true
#   end
#   
#   it "should have a created_at key" do
#     @comment.should respond_to(:created_at=)
#     @comment.should respond_to(:created_at)
#   end
#   
#   it "should have a commentor association" do
#     @comment.should respond_to(:commentor_id=)
#     @comment.should respond_to(:commentor_id)
#     @comment.should respond_to(:commentor_type=)
#     @comment.should respond_to(:commentor_type)
#     
#     @comment.commentor.association.should be_belongs_to
#   end
#   
# end