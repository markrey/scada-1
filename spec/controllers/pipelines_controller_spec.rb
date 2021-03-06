require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PipelinesController, type: :controller do
  before do
    sign_in
  end

  # This should return the minimal set of attributes required to create a valid
  # Pipeline. As you add validations to Pipeline, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: "Pipeline" }
  end

  let(:invalid_attributes) do
    { name: "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PipelinesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all pipelines as @pipelines" do
      pipeline = Pipeline.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:pipelines)).to eq([pipeline])
    end
  end

  describe "GET #show" do
    it "assigns the requested pipeline as @pipeline" do
      pipeline = Pipeline.create! valid_attributes
      get :show, { id: pipeline.to_param }, valid_session
      expect(assigns(:pipeline)).to eq(pipeline)
    end
  end

  describe "GET #new" do
    it "assigns a new pipeline as @pipeline" do
      get :new, {}, valid_session
      expect(assigns(:pipeline)).to be_a_new(Pipeline)
    end
  end

  describe "GET #edit" do
    it "assigns the requested pipeline as @pipeline" do
      pipeline = Pipeline.create! valid_attributes
      get :edit, { id: pipeline.to_param }, valid_session
      expect(assigns(:pipeline)).to eq(pipeline)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Pipeline" do
        expect do
          post :create, { pipeline: valid_attributes }, valid_session
        end.to change(Pipeline, :count).by(1)
      end

      it "assigns a newly created pipeline as @pipeline" do
        post :create, { pipeline: valid_attributes }, valid_session
        expect(assigns(:pipeline)).to be_a(Pipeline)
        expect(assigns(:pipeline)).to be_persisted
      end

      it "redirects to the created pipeline" do
        post :create, { pipeline: valid_attributes }, valid_session
        expect(response).to redirect_to(Pipeline.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved pipeline as @pipeline" do
        post :create, { pipeline: invalid_attributes }, valid_session
        expect(assigns(:pipeline)).to be_a_new(Pipeline)
      end

      it "re-renders the 'new' template" do
        post :create, { pipeline: invalid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: 'Renamed Pipeline' }
      end

      it "updates the requested pipeline" do
        pipeline = Pipeline.create! valid_attributes
        put :update, { id: pipeline.to_param, pipeline: new_attributes }, valid_session
        pipeline.reload
        expect(pipeline.name).to eq 'Renamed Pipeline'
      end

      it "assigns the requested pipeline as @pipeline" do
        pipeline = Pipeline.create! valid_attributes
        put :update, { id: pipeline.to_param, pipeline: valid_attributes }, valid_session
        expect(assigns(:pipeline)).to eq(pipeline)
      end

      it "redirects to the pipeline" do
        pipeline = Pipeline.create! valid_attributes
        put :update, { id: pipeline.to_param, pipeline: valid_attributes }, valid_session
        expect(response).to redirect_to(pipeline)
      end
    end

    context "with invalid params" do
      it "assigns the pipeline as @pipeline" do
        pipeline = Pipeline.create! valid_attributes
        put :update, { id: pipeline.to_param, pipeline: invalid_attributes }, valid_session
        expect(assigns(:pipeline)).to eq(pipeline)
      end

      it "re-renders the 'edit' template" do
        pipeline = Pipeline.create! valid_attributes
        put :update, { id: pipeline.to_param, pipeline: invalid_attributes }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pipeline" do
      pipeline = Pipeline.create! valid_attributes
      expect do
        delete :destroy, { id: pipeline.to_param }, valid_session
      end.to change(Pipeline, :count).by(-1)
    end

    it "redirects to the pipelines list" do
      pipeline = Pipeline.create! valid_attributes
      delete :destroy, { id: pipeline.to_param }, valid_session
      expect(response).to redirect_to(pipelines_url)
    end
  end
end
