class StaticPagesController < ApplicationController
	def home
		@events = Event.upcoming
	end
end
