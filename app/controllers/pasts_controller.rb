class PastsController < ApplicationController
	before_action :find_verb
	before_action :setup_verb_tense_parameter, only: [:new, :edit]

	def new  
		@past = @verb.pasts.new	
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

	def past_params
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

	def setup_verb_tense_parameter
		@personalpronomen_past = [
			"first_person", 
			"second_person", 
			"third_person",
			"plural_first_person",
			"plural_second_person",
			"plural_third_person",
			"description"
		 ]
		@grammer_past = [ "ich", "du", "er/es/sie", "wir", "ihr", "Sie/sie", "Further Explaination"]
	end

end
