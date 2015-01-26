require './week-1/homework/homework_1'

describe Homework1 do
  describe '.find_num_inversions' do
    it 'returns number of inversions required to sort an array' do
      array = [1,3,5,2,4,6]
      expect(Homework1.find_num_inversions(array)).to eq(3)
    end
  end
end
