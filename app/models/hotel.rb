class Hotel < ApplicationRecord
	has_many :rooms ,dependent: :destroy


	name_REGEX = /\A[A-Za-z ]+\Z/
    validates :name, :presence => true,  :length => { :in => 3..10 },:format => name_REGEX
    validates :rating, :presence => false, :length => { :minimum =>0 ,:maximum =>2} 
    validates :location, :presence => true,  :length => { :in => 3..10 },:format => name_REGEX
end
