class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show_user'
  end
  
   get '/signup' do

     if !logged_in?
       erb :'users/signup', locals: {message: 'Please sign up before you sign in'}
     else
       redirect '/coffee_houses'
     end
   end

   post '/signup' do

     if params[:username] == '' || params[:password] == ''
       redirect '/signup'
     else
       @user = User.create(username: params[:username], password: params[:password])
       session[:user_id] = @user.id
       redirect '/coffee_houses'
     end
   end

   get '/login' do
     if !logged_in?
       erb :'users/login'
     else
       redirect '/coffee_houses'
     end
   end

   post '/login' do
     @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/coffee_houses'
    else
      redirect '/login'
    end
   end

   get '/logout' do
     if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
   end


end
