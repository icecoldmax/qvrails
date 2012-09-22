class StaticPagesController < ApplicationController
  def home
  	@quizzes = Quiz.all
  end

  def doquiz
  end
end
