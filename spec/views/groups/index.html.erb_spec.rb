require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    @employee = Employee.first
    @restaurant = Restaurant.first
    @blind_date = BlindDate.create(lunch_date: Date.today)
    assign(:groups, [
      Group.create!(employee_id: @employee.id, restaurant_id: @restaurant.id, blind_date_id: @blind_date.id)
    ])
  end

  it "renders a list of groups" do
    render
  end
end
