ActiveAdmin.register Image do
actions :all, except: :new
controller do
	before_action :find_imageable
  
  def create
    @imageable.images.create image_params
    puts @imageable.class
    redirect_to @imageable
  end

    private
  
  def image_params
    params.require(:image).permit(:image)
  end
 
  def find_imageable
    params.each do |name, value|
      return @imageable = $1.classify.constantize.find(value) if name =~ /(.+)_id$/
    end
  end
 end

 ##
 

end 
