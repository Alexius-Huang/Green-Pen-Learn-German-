class Verb < ActiveRecord::Base
	[:presents, :pasts, :perfects].each do |verb_tense|
		has_many verb_tense, dependent: :destroy
	end
end
