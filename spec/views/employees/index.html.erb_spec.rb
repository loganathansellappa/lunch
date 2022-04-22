require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(first_name: 'test', last_name: 'lname', email: 'a@test.com'),
      Employee.create!(first_name: 'test', last_name: 'lname', email: 'aa@test.com')
    ])
  end

  it "renders a list of employees" do
    render
  end
end
