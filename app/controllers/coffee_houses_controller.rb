class CoffeeHousesController < ApplicationController

  get '/coffee_houses' do
    if logged_in?
      @coffee_houses = CoffeeHouse.all.uniq {|coffee_house| coffee_house[:name]}
      erb :'coffee_houses/coffee_houses'
    else
      redirect '/login'
    end
  end

  get '/coffee_houses/new' do
    if logged_in?
      erb :'coffee_houses/create_coffee_house'
    else
      redirect '/login'
    end
  end

  post '/coffee_houses/new' do
    if params[:name] == '' || params[:location] == '' || params[:review] == ''
      redirect '/coffee_houses/new'
    else
      @coffee_house = CoffeeHouse.create(name: params[:name], location: params[:location], review: params[:review])
      @coffee_house.users << current_user
      @coffee_house.save

      redirect "/coffee_houses/#{@coffee_house.slug}"
    end
  end

  get '/coffee_houses/:slug' do
    if logged_in?
      @coffee_house = CoffeeHouse.find_by_slug(params[:slug])
      erb :'coffee_houses/show_coffee_house'
    else
      redirect '/login'
    end
  end

end
