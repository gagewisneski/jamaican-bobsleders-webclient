class JamaicansController < ApplicationController

  def index
    @jamaicans = Unirest.get("#{ENV['API_URL']}/jamaicans").body
  end

  def show
    @jamaican = Unirest.get("#{ENV['API_URL']}/jamaicans/#{params[:id]}.json").body
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
    @jamaican = Unirest.delete("#{ENV['API_URL']}/jamaicans/#{params[:id]}")
    redirect_to "/jamaicans"
  end
end
