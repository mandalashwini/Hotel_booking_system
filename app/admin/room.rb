ActiveAdmin.register Room do
permit_params :number_bedrooms,:room_price,:room_type,:inactive_date,:hotel_id


  filter:room_price
  filter:number_bedrooms
  filter:room_type
 form do |f|
    f.inputs do
    if f.object.new_record?
      f.input :hotel_id, as: :select, multiple: false, collection: Hotel.all
	 end
      f.input :room_price
      f.input :number_bedrooms, as: :select, multiple: false, collection: ['1','2','3']
      f.input :room_type, as: :select, multiple: false, collection: ['AC','Non AC']
      f.input :inactive_date
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
end
#########Controller######

controller do
 def new
    @room = Room.new
  end
  
  def create
    @room = Room.create(post1_params)
     if  @room.update_attributes(post2_params)
        redirect_to [:admin,@room]
  else
    render 'new'
  end
  end

 
  def update
      @room = Room.find(params[:id])  
   print "*******",@hotel       
      if @room.update_attributes(post2_params)
        redirect_to [:admin, @room]
      else
        render 'edit'
      end
    end
  
  private
  
  def post1_params
       params.require(:room).permit(:number_bedrooms,:room_price,:room_type,:inactive_date,:hotel_id,:description)
    end

    def post2_params
        params.require(:room).permit(:number_bedrooms,:room_price,:room_type,:inactive_date,:hotel_id,:description,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
 
end



end
