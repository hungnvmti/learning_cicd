class PostsController < ApplicationController
  def index
  	total = sum 1,1 
    # Post.create(name: "David", description: "Code Artist")
    post = Post.first
  	@message = "Hello "+ post.name.to_s + ", how are you today? Could you help me check the results? it's correct or not: 1 + 1 = " + total.to_s
    #@message = "Hello, how are you today? Could you help me check the results? it's correct or not: 1 + 1 = " + total.to_s
  
  end

  # def post
  # 	@post ||= Post.create(name: "David", description: "Code Artist")
  # end

  def sum (a,b)
  	total = a + b
  	return total
  end
end