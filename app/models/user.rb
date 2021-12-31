class User < ApplicationRecord
	has_secure_password
	has_many :microposts, dependent: :destroy

	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
	end

	def feed
		Micropost.where("user_id = ?",id)
	end
end
