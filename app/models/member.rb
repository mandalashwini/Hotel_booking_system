class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
  name_REGEX = /\A[A-Za-z]+\Z/
  mb_REGEX=/\A[0-9]{10}+\Z/
 validates :firstName,:lastName,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 3..20, message:"max length is 20 characters"}
  validates :mobileNumber, :presence => true,:format => mb_REGEX
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  mount_uploader :image
 end
