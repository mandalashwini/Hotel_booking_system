ActiveAdmin.register Hotel do
permit_params :name,:rating,:location,:description


form do |f|
   ## 
    f.inputs do
    	f.input :name
    	f.input :rating
    	f.input :location
	    f.input :description
   	f.has_many :images do |image|
   		image.inputs "Images" do
        		image.input :image,as: :file

		end
	 end

   	f.actions
  end
####
end
controller do
 def new
    @hotel = Hotel.new
  end
  
  def create
    @hotel = Hotel.create(post1_params)
     if @hotel.update_attributes(post2_params)
    redirect_to [:admin,@hotel]
	else
		render 'new'
	end
  end
  
  private
  
  def post1_params
      puts "1111"
      params.require(:hotel).permit(:name, :rating, :location, :description)
    end

    def post2_params
      puts "222"
      params.require(:hotel).permit(:name, :rating, :location, :description,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
 
end

end
