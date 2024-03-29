class VerbsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :authenticate_admin!, except: [:index, :show]
	before_action :is_admin?, only: [:index, :show]
	
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
			@personalpronomen_present = ['ich', 'du', 'er/es/sie', 'wir', 'ihr', 'Sie/sie']
			@grammer_present = [
				@present.first_person,
				@present.second_person,
				@present.third_person,
				@present.plural_first_person,
				@present.plural_second_person,
				@present.plural_third_person
			]
		else
			@present = @personalpronomen_present = @grammer_present = nil
		end

		if @verb.pasts.any?
			@past = @verb.pasts.last
			@personalpronomen_past = ['ich', 'du', 'er/es/sie', 'wir', 'ihr', 'Sie/sie']
			@grammer_past = [
				@past.first_person,
				@past.second_person,
				@past.third_person,
				@past.plural_first_person,
				@past.plural_second_person,
				@past.plural_third_person
			]
		else
			@past = @personalpronomen_past = @grammer_past = nil
		end

		if @verb.perfects.any?
			@perfect = @verb.perfects.last
			@personalpronomen_perfect = ['ich', 'du', 'er/es/sie', 'wir', 'ihr', 'Sie/sie']
			@grammer_perfect = [
				@perfect.first_person,
				@perfect.second_person,
				@perfect.third_person,
				@perfect.plural_first_person,
				@perfect.plural_second_person,
				@perfect.plural_third_person
			]
		else
			@perfect = @personalpronomen_perfect = @grammer_perfect = nil
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

	def verb_params
		params.require(:verb).permit(:title, :description)
	end

end
