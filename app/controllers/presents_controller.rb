class PresentsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!
	before_action :find_verb
	before_action :setup_verb_tense_parameter, only: [:new, :edit]

	def new  
		@present = @verb.presents.new
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

	def authenticate_admin!
		unless current_user.administrator
			redirect_to verbs_path, alert: "You are not allowed to perform this action!"
		end
	end

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

	def setup_verb_tense_parameter
		@personalpronomen_present = [
			"first_person", 
			"second_person", 
			"third_person",
			"plural_first_person",
			"plural_second_person",
			"plural_third_person",
			"description"
		 ]
		@grammer_present = [ "ich", "du", "er/es/sie", "wir", "ihr", "Sie/sie", "Further Explaination"]
	end
end
