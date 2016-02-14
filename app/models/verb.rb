class Verb < ActiveRecord::Base
	has_many :presents
	has_many :pasts
	has_many :prefects
end
