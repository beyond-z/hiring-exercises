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
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Admin::CohortsController, type: :controller do
  render_views
  
  let(:user) { create :admin_user }

  # This should return the minimal set of attributes required to create a valid
  # Cohort. As you add validations to Cohort, be sure to
  # adjust the attributes here as well.
  let(:course) { build :course, id: 1001 }
  
  let(:valid_attributes) { attributes_for :cohort, course_id: course.id }
  let(:invalid_attributes) { {name: ''} }
  
  before do
    sign_in user
    allow_any_instance_of(Cohort).to receive(:course).and_return(course)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CohortsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'when signed-in user is not admin' do
    let(:user) { create :fellow_user }

    it "redirects GET #index to home" do
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
    
    it "redirects GET #show to home" do
      get :show, params: {id: '1001'}, session: valid_session
      expect(response).to redirect_to(root_path)
    end

    it "redirects GET #new to home" do
      get :new, params: {}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
    
    it "redirects GET #edit to home" do
      get :edit, params: {id: '1001'}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
    
    it "redirects POST #create to home" do
      post :create, params: {cohort: valid_attributes}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
    
    it "redirects PUT #update to home" do
      put :update, params: {id: '1001', cohort: valid_attributes}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
    
    it "redirects DELETE #destroy to home" do
      delete :destroy, params: {id: '1001'}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      cohort = Cohort.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cohort = Cohort.create! valid_attributes
      get :show, params: {id: cohort.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      cohort = Cohort.create! valid_attributes
      get :edit, params: {id: cohort.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cohort" do
        expect {
          post :create, params: {cohort: valid_attributes}, session: valid_session
        }.to change(Cohort, :count).by(1)
      end

      it "redirects to the created cohort" do
        post :create, params: {cohort: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin_cohort_path(Cohort.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {cohort: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_name) { valid_attributes[:name] + ' 2' }
      let(:new_attributes) { {name: new_name} }

      it "updates the requested cohort" do
        cohort = Cohort.create! valid_attributes
        put :update, params: {id: cohort.to_param, cohort: new_attributes}, session: valid_session
        cohort.reload

        expect(cohort.name).to eq(new_name)
      end

      it "redirects to the cohort" do
        cohort = Cohort.create! valid_attributes
        put :update, params: {id: cohort.to_param, cohort: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin_cohort_path(cohort))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cohort = Cohort.create! valid_attributes
        put :update, params: {id: cohort.to_param, cohort: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cohort" do
      cohort = Cohort.create! valid_attributes
      expect {
        delete :destroy, params: {id: cohort.to_param}, session: valid_session
      }.to change(Cohort, :count).by(-1)
    end

    it "redirects to the cohorts list" do
      cohort = Cohort.create! valid_attributes
      delete :destroy, params: {id: cohort.to_param}, session: valid_session
      expect(response).to redirect_to(admin_cohorts_url)
    end
  end

end
