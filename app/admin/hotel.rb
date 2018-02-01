ActiveAdmin.register Hotel do
permit_params :name,:rating,:location,:description,:images_attributes
 
 filter :name
 filter :rating
 filter :location

form do |f|
   ## 
    f.inputs do
    	f.input :name
    	f.input :rating
    	f.input :location
	    f.input :description
    	f.has_many :images  do |image|
   		image.inputs "Images" do
        		image.input :image,as: :file,multiple: true,:hint => image.object.image.present? \
   					? image_tag(image.object.image.url(),:width => "100",:height => "100")
    			: content_tag(:span, "image not found")
        		#image.input :image_cache, as: :hidden
        		#:hint => image_tag(image.object.image.url)
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

 
  def update
      @hotel = Hotel.find(params[:id])  
   print "*******",@hotel       
      if @hotel.update_attributes(post2_params)
        redirect_to [:admin, @hotel]
      else
        render 'edit'
      end
    end
  
  private
  
  def post1_params
       params.require(:hotel).permit(:name, :rating, :location, :description)
    end

    def post2_params
        params.require(:hotel).permit(:name, :rating, :location, :description,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
 
end

end
