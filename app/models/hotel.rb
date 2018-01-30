class Hotel < ApplicationRecord
	has_many :rooms ,dependent: :destroy
	has_many :images, as: :imageable

	name_REGEX = /\A[A-Za-z ]+\Z/
	rating_REGEX=/\A[0-9]+\Z/
    validates :name, :presence => true,  :length => { :in => 3..10 },:format => name_REGEX
    validates :location, :presence => true,  :length => { :in => 3..10 },:format => name_REGEX
	 validates :rating, :presence => true
	validates_numericality_of :rating, :only_integer => true, 
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10,
    :message => "accept only whole number between 1 and 10."


end
