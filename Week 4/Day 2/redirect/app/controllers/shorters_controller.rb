class ShortersController < ApplicationController

	def index
		@short_url = params[:short]

	end

	def create
		url = params[:url]
		make_short= Shorter.store(url,Shorter.shorten)
		short = Shorter.find_by("long_url == ?", url).short_url unless make_short
		redirect_to("/#{short}")
	end

	def redirect
		re = Shorter.find_by("short_url ==?", params[:shortlink])
		redirect_to(re.long_url)
	end
end
