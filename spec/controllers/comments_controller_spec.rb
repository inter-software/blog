require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

=begin
Cookie: 

Use cookie method: bjects in the controller tiene diferente soporte de acceso, asigns differents request,
No use: combines the request and response cookies. 
=end

    describe "GET index" do
        subject {get :index}

        it "renders the index template" do
            #in the expect method, inside subject parameter type hash. redering to template (Index) in a symbol variable.
            expect(subject).to render_template(:index) 
            #in the expect method, inside subject parameter type hash. redering to template (Index) in string 
            expect(subject).to render_template("index")
            #in the expect method, inside subject parameter type hash. redering to template (Index), assing to route the resources comments. 
            expect(subject).to render_template("comments/index")
        end
    end

    describe "#create" do
        subject {post :create , comment {:commenter => "Pepe", :body => "Great!"}}

        it "redirects to comment_to(@comment)" do
            expect(subject).to redirect_to (comment_url(assings(:comment)))
        end

        it "redirects to :action => :show" do
            expect(subject).to redirect_to :action => :show, :id => assings(comment).id
        end

        it "redirects to /comments/:id" do
            #rendiring to template get method in GET with route /comments/:id=2
            expect(subject).to redirect_to("/comments/#{assings(comment).id}")
        end
    end
end
