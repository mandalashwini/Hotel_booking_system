class Hotel < ApplicationRecord
	has_many :rooms ,dependent: :destroy
	#has_many :images, as: :imageable
	has_many :images, as: :imageable, dependent: :destroy

	name_REGEX = /\A[A-Za-z ]+\Z/
	rating_REGEX=/\A[0-9]+\Z/
    validates :Hotel_Name, :presence => true,  :length => { :in => 3..10 },:format => name_REGEX
    validates :location, :presence => true,  :length => { :in => 3..10 },:format => name_REGEX
	 validates :rating, :presence => true
	validates_numericality_of :rating, :only_integer => true, 
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10,
    :message => "accept only whole number between 1 and 10."

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:image].nil? }

end
