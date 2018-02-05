class Hotel < ApplicationRecord
	has_many :rooms ,dependent: :destroy
	#has_many :images, as: :imageable
	has_many :images, as: :imageable, dependent: :destroy

	
	rating_REGEX=/\A[0-9]{1}+\Z/
	location_REGEX = /\A[A-Za-z]+\Z/
    validates :name,presence: true,format: { with: /\A[A-Za-z0-9 ]+[A-Za-z ]+[a-zA-Z0-9]+\Z/, message: "only allows letters" }, length: { in: 3..20, message:"max length is 20 characters"}
    validates :location, :presence => true,  :length => { :in => 3..10 },:format => location_REGEX
    validates :rating, :presence => true
	validates_numericality_of :rating, :only_integer => true, 
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10,
    :message => "accept only whole number between 1 and 10."
 # validates :rating, :presence => true,format: { with: /\A[0-9]{1}+\z/, message: "only numbers allows" },length: { in: 1, message:"only one digit number is allowed"}


  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:image].nil? }


end
