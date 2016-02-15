class PerfectsController < ApplicationController
	before_action :find_verb
	before_action :setup_verb_tense_parameter

	def new  
		@perfect = @verb.perfects.new
	end

	def create
		@perfect = @verb.perfects.build(perfect_params)

		if @perfect.save
			redirect_to verb_path(@verb), notice: "Verb : #{@verb.title} has Successfully Updated Information!"
		else
			render :new
		end
	end

	def edit
		@perfect = @verb.perfects.last
	end

	def update
		@perfect = @verb.perfects.last

		if @perfect.update(perfect_params)
			redirect_to verb_path(@verb), notice: "Verb : #{@verb.title} has Successfully Updated Information!"
		else
			render :edit
		end
	end

	private

	def find_verb
		@verb = Verb.find(params[:verb_id])
	end

	def perfect_params
		params.require(:perfect).permit(
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
		@personalpronomen_perfect = [
			"first_person", 
			"second_person", 
			"third_person",
			"plural_first_person",
			"plural_second_person",
			"plural_third_person",
			"description"
		 ]
		@grammer_perfect = [ "ich", "du", "er/es/sie", "wir", "ihr", "Sie/sie", "Further Explaination"]
	end

end
