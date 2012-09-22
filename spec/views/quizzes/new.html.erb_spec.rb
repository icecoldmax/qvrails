require 'spec_helper'

describe "quizzes/new" do
  before(:each) do
    assign(:quiz, stub_model(Quiz,
      :title => "MyString",
      :creator => "MyString",
      :question_count => 1
    ).as_new_record)
  end

  it "renders new quiz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quizzes_path, :method => "post" do
      assert_select "input#quiz_title", :name => "quiz[title]"
      assert_select "input#quiz_creator", :name => "quiz[creator]"
      assert_select "input#quiz_question_count", :name => "quiz[question_count]"
    end
  end
end
