require "test_helper"

describe User do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe "validations" do
    it "has a username" do
      user = User.new
      expect(user.valid?).must_equal false
      expect(user.errors.messages).must_include :username
    end

    it "has unique username" do
      username = "username_1"
      user1 = User.new(username: username)
      user1.save

      user2 = User.new(username: username)
      save_result = user2.save

      expect(save_result).must_equal false
      expect(user2.errors.messages).must_include :username

    end
  end
end
