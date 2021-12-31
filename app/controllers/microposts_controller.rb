class MicropostsController < ApplicationController
	include SessionsHelper
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def new
		@micropost = Micropost.new
		 @feed_items = current_user.feed.paginate(page: params[:page])
	end
	def create
		# render plain:"success"
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "micropost created!"
			redirect_to micropost_url
		else
			flash[:danger] = "something went wrong"
		end
	end

	def destroy
		@micropost = Micropost.find_by(params[:id])
		@micropost.destroy
		flash[:danger] = "delete"
		redirect_to micropost_url
	end

	private
	def micropost_params
		params.require(:micropost).permit(:content)
	end

	def correct_user
		render plain:"success"
		# @micropost = current_user.microposts.find_by(id: params[:id])
		# redirect_to root_url if @micropost.nil?
	end
end
