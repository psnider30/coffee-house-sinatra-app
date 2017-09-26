class CoffeeHousesController < ApplicationController

  get '/coffee_houses' do
    authenticate_user
    @coffee_houses = CoffeeHouse.all
    erb :'coffee_houses/coffee_houses'
  end

  get '/coffee_houses/:slug' do
    authenticate_user
    @coffee_house = CoffeeHouse.find_by_slug(params[:slug])
    erb :'coffee_houses/show_coffee_house'
  end
  
end
