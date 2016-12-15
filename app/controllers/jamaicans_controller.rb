class JamaicansController < ApplicationController

  def index
    # unirest_jamaicans = Unirest.get("#{ENV['API_URL']}/jamaicans").body
    # @jamaicans = []
    # unirest_jamaicans.each do |unirest_jamaican|
    #   jamaican = Jamaican.new(unirest_jamaican)
    #   @jamaicans << jamaican
    # end

    @jamaicans = Jamaican.all
  end

  def show
    # unirest_jamaican = Unirest.get("#{ENV['API_URL']}/jamaicans/#{params[:id]}.json").body
    # @jamaican = Jamaican.new(unirest_jamaican)

    @jamaican = Jamaican.find(params[:id])
  end

  def new
  end

  def create
    @jamaican = Unirest.post("#{ENV['API_URL']}/jamaicans", parameters: {first_name: params[:first_name], last_name: params[:last_name], position: params[:position]}, headers:{"Accept" => "application/json"}).body

    redirect_to "/jamaicans/#{@jamaican['id']}"
    # redirect_to jamaican_path(@jamaican["id"])
  end

  def edit
    @jamaican = Unirest.get("#{ENV['API_URL']}/jamaicans/#{params[:id]}.json").body
  end

  def update
    @jamaican = Unirest.patch("#{ENV['API_URL']}/jamaicans/#{params[:id]}", parameters: {first_name: params[:first_name], last_name: params[:last_name], position: params[:position]}, headers:{"Accept" => "application/json"}).body

    redirect_to "/jamaicans/#{@jamaican['id']}"
  end

  def destroy
    @jamaican = Jamaican.find(params[:id])
    @jamaican.destroy
    redirect_to "/jamaicans"
  end
end




