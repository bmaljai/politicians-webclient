class PoliticiansController < ApplicationController
  def index
    @politicians = Unirest.get("#{ENV["DOMAIN"]}/politicians.json").body
  end

  def show
    @politician = Unirest.get("#{ENV['DOMAIN']}/politicians/#{params[:id]}.json").body
  end

  def new
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    birthdate = params[:birthdate]
    total_years_service = params[:total_years_service]
    party = params[:party]
    current_office = params[:current_office]

    @politician = Unirest.post("#{ENV['DOMAIN']}/politicians.json", headers:{"Accept"=>"application/json"}, parameters:{first_name: first_name, last_name: last_name, birthdate: birthdate, total_years_service: total_years_service, party: party, current_office: current_office}).body

    redirect_to "/politicians/#{@politician["id"]}"
  end

  def edit
    @politician = Unirest.get("#{ENV['DOMAIN']}/politicians/#{params[:id]}.json").body
  end

  def update
    first_name = params[:first_name]
    last_name = params[:last_name]
    birthdate = params[:birthdate]
    total_years_service = params[:total_years_service]
    party = params[:party]
    current_office = params[:current_office]

    @politician = Unirest.patch("#{ENV['DOMAIN']}/politicians/#{params[:id]}.json", headers:{"Accept"=>"application/json"}, parameters:{first_name: first_name, last_name: last_name, birthdate: birthdate, total_years_service: total_years_service, party: party, current_office: current_office}).body

    redirect_to "/politicians/#{@politician["id"]}"
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/politicians/#{params[:id]}")

    redirect_to "/politicians"
  end
end
