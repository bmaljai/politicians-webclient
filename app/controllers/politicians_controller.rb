class PoliticiansController < ApplicationController
  def index
    @politicians = Unirest.get("localhost:3000/api/v1/politicians.json").body
  end

  def show
    @politician = Unirest.get("localhost:3000/api/v1/politicians/#{params[:id]}.json").body
  end

end
