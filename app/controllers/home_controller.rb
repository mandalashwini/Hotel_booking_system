class HomeController < ApplicationController
  def index
  end
  def userview
  	render plain: params[:location].inspect
    puts params[:location].inspect
    
  end


  def create
  end
 
end
