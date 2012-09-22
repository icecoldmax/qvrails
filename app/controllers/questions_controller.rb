class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    if params[:quiz_id]
      @quiz = Quiz.find(params[:quiz_id])
      @questions = @quiz.questions.all
    else
      @questions = Question.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @quiz = Quiz.find_by_id(@question.quiz_id)
    @answers = @question.answers
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new(quiz_id: params[:quiz_id])
    # @quiz = Quiz.find_by_id(@question.quiz_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    # @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create

    @question = Question.new(params[:question])
    @quiz = Quiz.find_by_id(@question.quiz_id)
    # @question = @quiz.questions.build(params[:question])


    respond_to do |format|
      if @question.save
        # @quiz.question_count += 1

        format.html { redirect_to questions_url(params[:quiz_id]), notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    
    @question = Question.find(params[:id])
    @quiz = Quiz.find_by_id(@question.quiz_id)

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to questions_path(quiz_id: @quiz.id), notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @quiz = Quiz.find_by_id(@question.quiz_id)
    @question.destroy


    respond_to do |format|
      format.html { redirect_to questions_path(quiz_id: @quiz.id) }
      format.json { head :no_content }
    end
  end
end
