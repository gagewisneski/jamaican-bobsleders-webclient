class JamaicansController < ApplicationController

  def index
    @jamaicans = Unirest.get("http://localhost:3001/api/v2/jamaicans").body
  end

  def show
    @jamaican = Unirest.get("http://localhost:3001/api/v2/jamaicans/#{params[:id]}.json").body
  end

  def new
  end

  def create
    @jamaican = Unirest.post("http://localhost:3001/api/v2/jamaicans", parameters: {first_name: params[:first_name], last_name: params[:last_name], position: params[:position]}, headers:{"Accept" => "application/json"}).body

    redirect_to "/jamaicans/#{@jamaican['id']}"
    # redirect_to jamaican_path(@jamaican["id"])
  end

  def edit
    @jamaican = Unirest.get("http://localhost:3001/api/v2/jamaicans/#{params[:id]}.json").body
  end

  def update
    @jamaican = Unirest.patch("http://localhost:3001/api/v2/jamaicans/#{params[:id]}", parameters: {first_name: params[:first_name], last_name: params[:last_name], position: params[:position]}, headers:{"Accept" => "application/json"}).body

    redirect_to "/jamaicans/#{@jamaican['id']}"
  end

  def destroy
    @jamaican = Unirest.delete("http://localhost:3001/api/v2/jamaicans/#{params[:id]}")
    redirect_to "/jamaicans/1"
  end
end
