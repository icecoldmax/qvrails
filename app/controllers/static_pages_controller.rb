class StaticPagesController < ApplicationController
  def home
  	@quizzes = Quiz.all
  end

  def doquiz
    @quiz_data = {}
    
  	if params[:uq] == 'on'
  		uqids = params[:uqIds].split(',')
  		
  		uqids.each do |uqid|
  			@quiz = Quiz.find_by_id(uqid)
  			@questions = @quiz.questions.all
        @quiz_data[uqid] = []
  			question_count = @questions.length

        for i in 0...question_count
          
          @incorrect_answers = []
  				@answers = @questions[i].answers.all

          @answers.each do |answer|
            if answer.is_correct
              @correct_answer = answer.content
            else
              @incorrect_answers << answer.content
            end

            @quiz_data[uqid][i] = {'q' => @questions[i].content, 'ansY' => @correct_answer, 'ansN' => @incorrect_answers, 'qzTitle' => @quiz.title, 'creator' => @quiz.creator, 'qzid' => @quiz.id, 'lastTimeCorrect' => true }
          end

        end

      end

    end
    @quiz_data_json = @quiz_data.to_json

  end
end

