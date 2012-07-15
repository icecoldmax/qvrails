class QuizController < ApplicationController
	def index
		if params[:commit]
			@quiz_options = {}
			@videos = params[:videos]

			@quiz_options[:add] = { start: params[:add][:start], end: params[:add][:end] } if params[:add][:on] == '1'
			@quiz_options[:sub] = { start: params[:sub][:start], end: params[:sub][:end] } if params[:sub][:on] == '1'
			
		end
	end
		
end
