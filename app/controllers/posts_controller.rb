class PostsController < ApplicationController

	def index  
		#will have the template
		@posts=Post.all
		
	end

	def new  # display the new page

		#will have the template

		@post=Post.new

	end

	def create  #create the new post
		@post=Post.new(allowed_params)
		if @post.save
			redirect_to posts_path
		else 
			renderer 'new'
		end


	end

	def show  #display the particular post using the id

		#will have the template
		@post=Post.find(params[:id])
	end

	def edit  #display the particular post using the id
		#will have the template

		@post=Post.find(params[:id])

	end

	def update  #update the post


		#will save and redirect 

		@post=Post.find(params[:id])
		if @post.update_attributes(allowed_params)
			redirect_to posts_path
		else 
			renderer 'new'
		end
	end

	def destroy  #delete the post
		#Will destroy and redirect
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to posts_path

	end

	private 
		def allowed_params
			params.require(:post).permit(:name,:bio,:age)
		end


end
