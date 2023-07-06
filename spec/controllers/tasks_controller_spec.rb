require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  before do
    @task = Task.create(name: "Test task", description: "Test description", position: 1, category_id: 1)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @tasks" do
      get :index
      expect(assigns(:tasks)).to eq([@task])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @task.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the :show view" do
      get :show, params: { id: @task.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new task" do
        expect{
          post :create, params: { task: { name: "New task", description: "New description", position: 2, category_id: 2 } }
        }.to change(Task,:count).by(1)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: @task.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the requested task" do
        put :update, params: { id: @task.id, task: { name: "Updated task", description: "Updated description", position: 3, category_id: 3 } }
        @task.reload
        expect(@task.name).to eq("Updated task")
        expect(@task.description).to eq("Updated description")
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the task" do
      expect{
        delete :destroy, params: { id: @task.id }
      }.to change(Task,:count).by(-1)
    end
  end
end
