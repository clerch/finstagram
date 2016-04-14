helpers do 
	def current_user
		User.find_by(id: session[:user_id])
	end
end


get '/' do 
	@posts = Post.order(created_at: :desc)

	erb(:index)
end

get '/signup' do 		#if a user navigates to the path "/signup"
	@user = User.new 	#setup empty @user object
	erb(:signup) 		#render "app/views/signup.erb"
end


post '/signup' do
	# grab user input values from params
	email		=	params[:email]
	avatar_url	=	params[:avatar_url]
	username	=	params[:username]
	password	=	params[:password]


# instantiate and save a User

@user = User.new({email: email, avatar_url: avatar_url, username: username, password: password})
# if user validations pass and user is saved

	if @user.save
		redirect(to('/login'))
		# redirect '/' - this would redirect to 

	else
		erb(:signup)
	end

end

get '/login' do
	erb :login
end

post '/login' do
	username = params[:username]
	password = params[:password]

#1. find user by username
	user = User.find_by_username(username)

#2. if that user exists
	if user && user.password == password
		session[:user_id] = user.id
		redirect(to('/'))
	else
		@error_message = "Login failed."
		erb :login
	end
	
end

get '/logout' do 
	session[:user_id] = nil
	redirect(to('/'))
end

get '/' do
	@posts = Post.order(created_at: desc)
	erb(:index)
end

get '/posts/new' do 
	@post = Post.new
	erb(:"posts/new")
end

post '/posts' do
	photo_url = params[:photo_url]

	#instantiate new Post
	@post = Post.new({photo_url: photo_url, user_id: current_user.id})

	#if @post validates, save
	if @post.save
		redirect(to('/'))
	else
		#if it doesn't validate, print error messages
	erb(:"posts/new")	
	end
end

get '/posts/:id' do 
	@post = Post.find(params[:id])
	erb(:"posts/show")
end

post '/comments' do
	# point value from params to variables
	text = params[:text]
	post_id = params[:post_id]

	# instantiate a comment with those values and assign the comment to the 'current user'
	comment = Comment.new({text: text, post_id: post_id, user_id: current_user.id})

	#save the comment
	comment.save

	# 'redirect' back to whatever we came from
	redirect(back)
end

post '/likes' do
	post_id = params[:post_id]

	like = Like.new({post_id: post_id, user_id: current_user.id})
	like.save

	redirect(back)
end

delete '/likes/:id' do
	like = Like.find(params[:id])
	like.destroy
	redirect(back)
end















