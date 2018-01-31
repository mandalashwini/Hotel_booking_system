ActiveAdmin.register Image do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
controller do
	before_action :find_imageable
  
  def create
    @imageable.images.create image_params
    redirect_to @imageable
  end
  private
  
  def image_params
    params.require(:images).permit(:image)
  end
 
  def find_imageable
    params.each do |name, value|
      return @imageable = $1.classify.constantize.find(value) if name =~ /(.+)_id$/
    end
  end

###
 end

end
