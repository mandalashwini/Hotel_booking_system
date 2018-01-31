ActiveAdmin.register Room do
permit_params :number_bedrooms,:room_price,:room_type,:inactive_date,:hotel_id

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
      f.file_field  :images
    end
    f.actions
  end



end
