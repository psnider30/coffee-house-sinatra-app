class CoffeeHousesController < ApplicationController

  get '/coffee_houses' do
    if logged_in?
      @coffee_houses = CoffeeHouse.all
      erb :'coffee_houses/coffee_houses'
    else
      redirect '/login'
    end
  end

end
