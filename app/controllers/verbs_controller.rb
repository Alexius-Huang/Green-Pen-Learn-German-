class VerbsController < ApplicationController
	
	def index
		@verbs = Verb.all
	end

	def new
		@verb = Verb.new
	end

	def create
		@verb = Verb.create(verb_params)

		if @verb.save
			redirect_to verbs_path, notice: "New Verb Has Successfully Created!"
		else
			render :new
		end
	end

	def show
		@verb = Verb.find(params[:id])
		if @verb.presents.any?
			@present = @verb.presents.last
			@personalpronomen = ['ich', 'du', 'er/es/sie', 'wir', 'ihr', 'Sie/sie']
			@grammer = [
				@present.first_person,
				@present.second_person,
				@present.third_person,
				@present.plural_first_person,
				@present.plural_second_person,
				@present.plural_third_person
			]
		else
			@present = @personalpronomen = @grammer = nil
		end
	end

	def edit
		@verb = Verb.find(params[:id])
	end

	def update
		@verb = Verb.find(params[:id])

		if @verb.update(verb_params)
			redirect_to verb_path(@verb), notice: "The Verb : #{@verb.title} Has Successfully Updated!"
		else
			render :edit
		end
	end

	def destroy
		@verb = Verb.find(params[:id])
		verb_name = @verb.title
		@verb.destroy
		redirect_to verbs_path, danger: "The Verb : #{verb_name} Has Been Destroyed!"
	end

	private

	def verb_params
		params.require(:verb).permit(:title, :description)
	end

end