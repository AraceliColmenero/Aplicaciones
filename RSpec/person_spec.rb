require './person'
require 'rspec'
RSpec.describe Person do
  describe '#new' do
    it 'return nil if name is empty' do
      person = Person.new('')
      expect(person).to be_nil
    end
  end
end