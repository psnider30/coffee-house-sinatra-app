class CoffeeHousesController < ApplicationController

  get '/coffee_houses' do
    erb :'coffee_houses/coffee_houses'
  end

end
