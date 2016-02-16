class CommentsController < ApplicationController
	before_action :authenticate_user!
#	before_action :authenticate_admin!
	before_action :find_article

	def new
		@comment = current_user.comments.new
	end

	def create
		@comment = @article.comments.create(comment_params)
		if @comment.save
			@comment.update(:user_id => current_user.id)
			redirect_to article_path(@article)
		else
			render :new
		end
	end

	def edit
		@comment = @article.comments.find(params[:id])
	end

	def update
		@comment = @article.comments.find(params[:id])

		if @comment.update(comment_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def destroy
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_article
		@article = Article.find(params[:article_id])
	end

end
