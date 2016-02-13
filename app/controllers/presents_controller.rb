class PresentsController < ApplicationController
	before_action :find_verb

	def new  
		@present = @verb.presents.new
		@personalpronomen = [
			"first_person", 
			"second_person", 
			"third_person",
			"plural_first_person",
			"plural_second_person",
			"plural_third_person",
			"description"
		 ]
		@grammer = [ "ich", "du", "er/es/sie", "wir", "ihr", "Sie/sie", "Further Explaination"]
	end

	def create
		@present = @verb.presents.build(present_params)

		if @present.save
			redirect_to verb_path(@verb), notice: "Verb : #{@verb.title} has Successfully Updated Information!"
		else
			render :new
		end
	end

	def edit
		@present = @verb.presents.last
		@personalpronomen = [
			"first_person", 
			"second_person", 
			"third_person",
			"plural_first_person",
			"plural_second_person",
			"plural_third_person",
			"description"
		 ]
		@grammer = [ "ich", "du", "er/es/sie", "wir", "ihr", "Sie/sie", "Further Explaination"]
	end

	def update
		@present = @verb.presents.last

		if @present.update(present_params)
			redirect_to verb_path(@verb), notice: "Verb : #{@verb.title} has Successfully Updated Information!"
		else
			render :edit
		end
	end

	private

	def find_verb
		@verb = Verb.find(params[:verb_id])
	end

	def present_params
		params.require(:present).permit(
			:first_person,
			:second_person,
			:third_person,
			:plural_first_person,
			:plural_second_person,
			:plural_third_person,
			:description
		)
	end

end
