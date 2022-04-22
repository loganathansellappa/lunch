require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @employee = Employee.first
    @restaurant = Restaurant.first
    @blind_date = BlindDate.create(lunch_date: Date.today)

    @group = assign(:group, Group.create!(employee_id: @employee.id, restaurant_id: @restaurant.id, blind_date_id: @blind_date.id))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do
    end
  end
end
