class PastsController < ApplicationController
	before_action :find_verb

	def new  
		@past = @verb.pasts.new
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
		@past = @verb.pasts.build(past_params)

		if @past.save
			redirect_to verb_path(@verb), notice: "Verb : #{@verb.title} has Successfully Updated Information!"
		else
			render :new
		end
	end

	def edit
		@past = @verb.pasts.last
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
		@past = @verb.pasts.last

		if @past.update(past_params)
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
		params.require(:past).permit(
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
