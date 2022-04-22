require 'rails_helper'


RSpec.describe "/groups", type: :request do
  before(:all) do
    @employee = Employee.first
    @restaurant = Restaurant.first
    @blind_date = BlindDate.create(lunch_date: Date.today)
  end

  let(:valid_attributes) {
    {
      employee_id: @employee.id,
      blind_date_id: @blind_date.id,
      restaurant_id: @restaurant.id,
      leader_id: nil,
    }
  }

  let(:parameters) {
    {
      week: Date.today,
      employees: Employee.last(7).pluck(:id)
    }
  }

  let(:invalid_attributes) {
    {
      week: Date.today,
      employees: []
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Group.create! valid_attributes
      get groups_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      group = Group.create! valid_attributes
      get group_url(group)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_group_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Group" do
        expect {
          post groups_url, params: parameters
        }.to change(Group, :count).by(11)
      end

      it "redirects to the created group" do
        post groups_url, params: { group: parameters }
        expect(response).to redirect_to(employees_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Group" do
        expect {
          post groups_url, params: { group: invalid_attributes }
        }.to change(Group, :count).by(0)
      end
    end
  end

end
