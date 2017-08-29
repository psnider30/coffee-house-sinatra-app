class UsersController < ApplicationController

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


end
