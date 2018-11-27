class User

  # This is a class method
  def self.all_users
    "All users method"
  end

  # This is a instance method
  def profile
    "profile method"
  end

  # This is a instance method
  def posts
    "posts method"
  end

  # This is a instance method
  def account
    ["balance", "name"]
  end

end

# p User.account
user = User.new
p user.account.size
p user.account.first
p user.account.last
# p user.posts
# p user.profile