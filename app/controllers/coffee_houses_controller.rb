class CoffeeHousesController < ApplicationController

  get '/coffee_houses' do
    if logged_in?
      @coffee_houses = CoffeeHouse.all
      erb :'coffee_houses/coffee_houses'
    else
      redirect '/login'
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
