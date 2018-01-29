ActiveAdmin.register Room do
permit_params :number_bedrooms,:price,:room_type,:status,:inactive_date,:hotel_id

filter :status, as: :select
