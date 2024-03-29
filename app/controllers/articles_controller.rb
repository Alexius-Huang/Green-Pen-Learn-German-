class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :authenticate_admin!, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def new
		@article = current_user.articles.new
	end

	def create
		@article = current_user.articles.create(article_params)

		if @article.save
			redirect_to articles_path, notice: "New Article Has Successfully Created!"
		else
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
		@user = @article.user
		@comments = @article.comments
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def destroy
		@article = Article.find(params[:id])
		article_title = @article.title
		@article.destroy
		redirect_to articles_path, alert: "The Article : #{article_title} has been Deleted!"
	end	

	private

	def article_params
		params.require(:article).permit(:title, :content)
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

	def authenticate_admin!
		unless current_user.administrator
			redirect_to verbs_path, alert: "You are not allowed to perform this action!"
		end
	end

	def is_admin?
		if !current_user.nil? && current_user.administrator
			@is_admin = true
		else
			@is_admin = false
		end
	end

end
