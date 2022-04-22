require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(first_name: 'test', last_name: 'lname', email: 'a@test.com'))
  end

  it "renders attributes in <p>" do
    render
  end
end
