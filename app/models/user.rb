class User < ApplicationRecord
    
    has_one :address

    validates_with CustomValidator

    validates :lastname, presence: true, if: :first_name_present?

    validates :firstname,:lastname, format: { with: /\A[A-Z]+\Z/,
        message: "Capital Letters Only..!!" }, allow_blank: true
    
    validates :email, uniqueness: true, presence: true, format: {with: /\A[a-zA-Z]+[\.?\w]*@([a-zA-Z])+(\.[a-z]{2,3})+\Z/, message: "Invalid Format Of Email ID..!!"}

    validates :age, numericality: {greater_than_or_equal_to: 15, less_than_or_equal_to: 40, only_integer: true}, allow_blank: true

    validates :username, uniqueness: {scope: :email, message: "Should Have Unique Mail"}, exclusion: {in: %w(aashka zeel), message: "Don't use common Name..!!"}

    validates :password, length: {minimum: 8}, confirmation: true

    validates :password_confirmation, presence: true

    validates :website, format: { with: /\Ahttps?\:\/\/\www\.(\w+)(\.(\D\w{2,3})+)(\/\w|\s|\n|\W)*\Z/, message: "Enter Valid Website Name" }

    

    def first_name_present?
        firstname.present?
    end

end
