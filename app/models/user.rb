class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Took this out of the next line while I decide if people can sign up:
  #:registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invoices
  has_and_belongs_to_many :companies

end
