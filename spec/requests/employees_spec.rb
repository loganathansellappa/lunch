require 'rails_helper'

RSpec.describe "/employees", type: :request do

  let(:valid_attributes) {
    {
        first_name: 'test',
        last_name: 'test',
        email: "test@test.com",
        team_ids: []

    }
  }

  let(:invalid_attributes) {
    {
      first_name: 'test',
      last_name: 'test',
      team_ids: []

    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Employee.create! valid_attributes
      get employees_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      employee = Employee.create! valid_attributes
      get employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_employee_url
      expect(response).to be_successful
    end
  end


  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Employee" do
        expect {
          post employees_url, params: { employee: valid_attributes }
        }.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post employees_url, params: { employee: valid_attributes }
        expect(response).to redirect_to(employee_url(Employee.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Employee" do
        expect {
          post employees_url, params: { employee: invalid_attributes }
        }.to change(Employee, :count).by(0)
      end
    end
  end
end
