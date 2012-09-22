require 'spec_helper'

describe "quizzes/index" do
  before(:each) do
    assign(:quizzes, [
      stub_model(Quiz,
        :title => "Title",
        :creator => "Creator",
        :question_count => 1
      ),
      stub_model(Quiz,
        :title => "Title",
        :creator => "Creator",
        :question_count => 1
      )
    ])
  end

  it "renders a list of quizzes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
