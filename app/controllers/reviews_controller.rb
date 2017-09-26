require 'rack-flash'

class ReviewsController < ApplicationController

  use Rack::Flash

  get '/reviews' do
    authenticate_user
    redirect '/coffee_houses/coffee_houses'
  end

  get '/reviews/new' do
    authenticate_user
    erb :'reviews/create_review'
  end

  post '/reviews/new' do
    if params[:review_content] == '' || params[:coffee_house_name] == '' || params[:coffee_house_location] == ''
      flash[:message] = 'Please fill out all fields.'
      redirect '/reviews/new'
    else
      @review = Review.new(content: params[:review_content])
      @review.coffee_house = CoffeeHouse.find_or_create_by(name: params[:coffee_house_name], location: params[:coffee_house_location])
      @review.user = current_user

      if @review.save
        redirect "/reviews/#{@review.slug}"
      else
        flash[:message] = 'You have already created that review.'
        redirect '/reviews/new'
      end
    end
  end

  get '/reviews/:slug' do
    authenticate_user
    @review = Review.find_by_slug(params[:slug])
    erb :'reviews/show_review'
  end

  get '/reviews/:slug/edit' do
    authenticate_user
    @review = Review.find_by_slug(params[:slug])
    is_owner(@review)
    erb :'reviews/edit_review'
  end

  patch '/reviews/:slug' do
    authenticate_user
    @review = Review.find_by_slug(params[:slug])
    is_owner(@review)

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
    authenticate_user

    @review = Review.find_by_slug(params[:slug])

    is_owner(@review)
    @review.delete
    @review.coffee_house.delete if @review.coffee_house.reviews.empty?
    redirect "/users/#{current_user.slug}"
  end

end
