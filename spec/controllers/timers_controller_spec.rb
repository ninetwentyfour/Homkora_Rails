require 'spec_helper'

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

describe TimersController do
  login_user
  
  before(:each) do
    @project = Fabricate(:project, :user => subject.current_user)
    @timer = Fabricate(:timer, :project => @project)
  end

  describe "GET index" do
    it "assigns all timers as @timers" do
      get :index
      assigns(:timers).should eq([@timer])
    end
  end

  describe "GET show" do
    it "assigns the requested timer as @timer" do
      get :show, {:id => @timer.to_param}
      assigns(:timer).should eq(@timer)
    end
  end

  describe "GET new" do
    it "assigns a new timer as @timer" do
      get :new
      assigns(:timer).should be_a_new(Timer)
    end
  end

  describe "GET edit" do
    it "assigns the requested timer as @timer" do
      get :edit, {:id => @timer.to_param}
      assigns(:timer).should eq(@timer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Timer" do
        expect {
          post :create, {:timer => Fabricate.attributes_for(:timer)}
        }.to change(Timer, :count).by(1)
      end

      it "assigns a newly created timer as @timer" do
        post :create, {:timer =>  Fabricate.attributes_for(:timer)}
        assigns(:timer).should be_a(Timer)
        assigns(:timer).should be_persisted
      end

      it "redirects to the created timer" do
        post :create, {:timer =>  Fabricate.attributes_for(:timer)}
        response.should redirect_to(Timer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved timer as @timer" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:timer => { "title" => nil }}
        assigns(:timer).should be_a_new(Timer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:timer => { "title" => nil }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested timer as @timer" do
        put :update, id: @timer, timer: Fabricate.attributes_for(:timer)
        assigns(:timer).should eq(@timer) 
      end
      
      it "changes @timer attributes" do
        # @timer = Fabricate(:project, :user => subject.current_user)
        put :update, {:id => @timer.to_param, :timer => { "title" => "Edit" }}
        @timer.reload
        @timer.title.should eq("Edit")
      end

      it "redirects to the timer" do
        put :update, id: @timer, timer: Fabricate.attributes_for(:timer)
        response.should redirect_to(@timer)
      end
    end
    
    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        put :update, {:id => @timer.to_param, :timer => { "title" => nil }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested timer" do
      expect {
        delete :destroy, {:id => @timer.to_param}
      }.to change(Timer, :count).by(-1)
    end

    it "redirects to the timers list" do
      delete :destroy, {:id => @timer.to_param}
      response.should redirect_to(timers_url)
    end
  end

end
