class VerbController < ApplicationController

	def index
		@verb = Verb.all
	end

	def new
		@verb = Verb.new
	end

	def create
		@verb = Verb.create(verb_params)

		if @verb.save
			redirect_to verbs_path, notice: "New Verb Successfully Created!"
		else
			render :new
		end
	end

	def show
		@verb = Verb.find(params[:id])
	end

	def edit
		@verb = Verb.find(params[:id])
	end

	def update
		@verb = Verb.find(params[:id])

		if @verb.update(verb_params)
			redirect_to verb_path(@verb), notice: "Verb : #{@verb.title} has Successfully Updated!"
		else
			render :edit
		end
	end

	def destroy
		@verb = Verb.find(params[:id])
		verb_title = @verb.title
		@verb.destroy
		redirect_to verbs_path, alert: "Verb : #{verb_title} has Successfully Deleted!"
	end

	private

	def verb_params
		params.require(:verb).permit(:title, :description)
	end

end
