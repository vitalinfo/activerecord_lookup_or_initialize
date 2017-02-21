require "spec_helper"

RSpec.describe ActiverecordLookupOrInitialize do
  it 'has a version number' do
    expect(ActiverecordLookupOrInitialize::VERSION).not_to be nil
  end


  context do
    before do
      @user = User.create(email: 'test@example.com')
      @comment = @user.comments.create(message: 'first')
      @user.comments.create(message: 'second')
    end

    it 'should not return collection object' do
      expect(@user.comments.find_or_initialize_by(message: 'first').object_id).not_to eq @comment.object_id
    end

    it 'should return collection object' do
      expect(@user.comments.lookup_or_initialize_by(message: 'first').object_id).to eq @comment.object_id
    end

    it 'should build new collection object' do
      comment = @user.comments.lookup_or_initialize_by(message: 'third')
      expect(comment.new_record?).to be_truthy
      expect(@user.comments).to include(comment)
      @user.save
      expect(comment.persisted?).to be_truthy
    end
  end
end
