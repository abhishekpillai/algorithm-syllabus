require './week-1/homework/homework_1'

describe Homework1 do
  describe '.sort_and_count_inversions' do
    it 'returns the sorted array and number of inversions required to sort an array' do
      array = [1,3,5,2,4,6]
      sorted_array = [1,2,3,4,5,6]
      expect(
        Homework1.sort_and_count_inversions(array, array.size)
      ).to eq(
        [sorted_array, 3]
      )
    end
  end
end
