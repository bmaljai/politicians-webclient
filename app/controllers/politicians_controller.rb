class PoliticiansController < ApplicationController
  def index
    @politicians = Unirest.get("#{ENV["DOMAIN"]}/politicians.json").body
  end

  def show
    @politician = Unirest.get("#{ENV['DOMAIN']}/politicians/#{params[:id]}.json").body
  end

end
