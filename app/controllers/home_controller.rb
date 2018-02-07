class HomeController < ApplicationController
  def index
  end
  def userview
  #	render plain: params[:location].inspect
  	render plain: params.inspect
    puts params.inspect


  end


  def create
  end
 
end
