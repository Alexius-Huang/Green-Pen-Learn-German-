class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :authenticate_admin!, except: [:index, :show]
	before_action :find_user, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def new
		@article = @user.articles.new
	end

	def create
		@article = @user.articles.create(article_params)

		if @article.save
			redirect_to articles_path, notice: "New Article Has Successfully Created!"
		else
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = @user.articles.find(params[:id])
	end

	def update
		@article = @user.article.find(params[:id])

		if @article.update(article_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def destroy
		@article = @user.article.find(params[:id])
		article_title = @article.title
		@article.destroy
		redirect_to articles_path, alert: "The Article : #{article_title} has been Deleted!"
	end	

	private

	def article_params
		params.require(:article).permit(:title, :content)

	def find_user
		@user = User.find(params[:user_id])
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
