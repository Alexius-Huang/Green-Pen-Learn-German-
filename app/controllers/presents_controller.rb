class PresentsController < ApplicationController
	before_action :find_verb

	def new  
		@present = @verb.presents.new
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
			:plural_third_person
		)
	end

end
