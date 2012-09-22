class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @quiz = Quiz.find_by_id(@question.quiz_id)
      @answers = @question.answers.all
    else
      @answers = Answer.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])
    # @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find_by_id(@answer.question_id)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new(question_id: params[:question_id])
    # @quiz = Quiz.find(params[:quiz_id])
    # @question = Question.find(params[:question_id])
    # @answer = @question.answers.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    # @quiz = Quiz.find(params[:quiz_id])
    @answer = Answer.find(params[:id])
    @question = Question.find_by_id(@answer.question_id)
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])
    @question = Question.find_by_id(@answer.question_id)
    # @quiz = Quiz.find(params[:quiz_id])
    
    respond_to do |format|
      if @answer.save
        format.html { redirect_to answers_path(question_id: @answer.question_id), notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])
    @question = Question.find_by_id(@answer.question_id)
    # @quiz = Quiz.find(params[:quiz_id])
       

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to answers_path(params[:question_id]), notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @question = Question.find_by_id(@answer.question_id)
    # @quiz = Quiz.find(params[:quiz_id])
        
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_path(question_id: @question.id) }
      format.json { head :no_content }
    end
  end
end
