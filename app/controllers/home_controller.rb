class HomeController < ApplicationController
  def index
  end
  def userview
  #	render plain: params[:location].inspect
  	render plain: params.inspect
    puts params[:location].class
    @param=params[:location]
    so=Search_operations.new(@param)
    so.hotel_search
  end


  def create
  end
 
end
