ActiveAdmin.register Hotel do
permit_params :name,:rating,:location,:description

controller do
 def new
    @hotel = Hotel.new
  end
  
  def create
    @hotel = Hotel.create(post_params)
    redirect_to @hotel
  end
  
  private
  
  def post_params
    params.require(:hotel).permit(:name,:rating,:location,:description,images_attributes: [:id, :image, :image_cache, :_destroy])
  end
end

end
