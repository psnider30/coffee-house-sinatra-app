require 'rack-flash'

class ReviewsController < ApplicationController

  use Rack::Flash

  get '/reviews' do
    if logged_in?
      redirect '/coffee_houses/coffee_houses'
    else
      redirect '/login'
    end
  end

  get '/reviews/new' do
    if logged_in?
      erb :'reviews/create_review'
    else
      redirect '/login'
    end
  end

  post '/reviews/new' do
    if params[:review_content] == '' || params[:coffee_house_name] == '' || params[:coffee_house_location] == ''
      flash[:message] = 'Please fill out all fields.'
      redirect '/reviews/new'
    else
      @review = Review.new(content: params[:review_content])
      @review.coffee_house = CoffeeHouse.find_or_create_by(name: params[:coffee_house_name], location: params[:coffee_house_location] )
      @review.user = current_user
      @review.save

      redirect "/reviews/#{@review.slug}"
    end
  end

  get '/reviews/:slug' do
    if logged_in?
      @review = Review.find_by_slug(params[:slug])
      erb :'reviews/show_review'
    else
      redirect '/login'
    end
  end

  get '/reviews/:slug/edit' do
    if logged_in?
      @review = Review.find_by_slug(params[:slug])
      erb :'reviews/edit_review'
    else
      redirect '/login'
    end
  end

  patch '/reviews/:slug' do
    @review = Review.find_by_slug(params[:slug])
    if params[:review_content] == '' || params[:coffee_house_name] == '' || params[:coffee_house_location] == ''
        flash[:message] = 'Please fill out all fields.'
        redirect "/reviews/#{@review.slug}/edit"
    else
      @review.update(content: params[:review_content])
      @review.coffee_house.update(name: params[:coffee_house_name], location: params[:coffee_house_location])
      redirect "/reviews/#{@review.slug}"
    end
  end

  delete '/reviews/:slug' do
    @review = Review.find_by_slug(params[:slug])
    if logged_in? && current_user.id == session[:user_id]
      @review.delete
      @review.coffee_house.delete if @review.coffee_house.reviews.empty?
      redirect "/users/#{current_user.slug}"
    else
      redirect '/login'
    end

  end
end
