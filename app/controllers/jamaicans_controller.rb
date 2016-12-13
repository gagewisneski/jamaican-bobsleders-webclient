class JamaicansController < ApplicationController
  def show
    @jamaican = Unirest.get("http://localhost:3001/api/v1/jamaicans/#{params[:id]}.json").body
  end

  def new
  end
end
