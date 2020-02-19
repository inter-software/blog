require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  context 'validation tests' do

    it 'ensures commenter presence' do
      comment = Comment.new(commenter: 'Ricardo', body: 'Very Cool!').save
      expect(comment).to eq(true)
    end

    it 'should save successfully' do
      comment = Comment.new(commenter: 'Samnuel', body: 'Very good').save
      expect(comment).to eq(true)
    end

  end


=begin 
context 'scope tests' do
  
    let(:params){ {commenter: 'Samuel', body: 'Very Cool'}}
  
    before(:each) do
     
      Comment.new(params).save
      Comment.new(params).save
      Comment.new(params.merge(active: true)).save
      Comment.new(params.merge(active: false)).save
      Comment.new(params.merge(active: false)).save
      
    end
  
    it 'should return active comments' do
      expect(Comment.active_comments.size).to eq(3)
    end
  
    it 'should return inactive comments' do
      expect(Comment.inactive_comments.size).to eq(2)
    end
  
  end

=end

end
