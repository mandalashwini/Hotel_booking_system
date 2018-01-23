class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

           attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
  name_REGEX = /\A[A-Za-z]+\Z/
  mb_REGEX = /\A\Z/
  validates :firstName, :presence => true,  :length => { :in => 3..20 },:format => name_REGEX
  validates :lastName, :presence => true,  :length => { :in => 3..20 },:format => name_REGEX
  validates :mobileNumber, :presence => true, :length => { :minimum =>10 ,:maximum =>12} 
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  mount_uploader :image
 end
