# Download the text file here. (Right click and save link as)
# This file contains all of the 100,000 integers between 1 and 100,000 (inclusive) in some order, with no integer repeated.
# Your task is to compute the number of inversions in the file given, where the ith row of the file indicates the ith entry of an array.
# Because of the large size of this array, you should implement the fast divide-and-conquer algorithm covered in the video lectures.
# The numeric answer for the given input file should be typed in the space below.
# So if your answer is 1198233847, then just type 1198233847 in the space provided without any space / commas / any other punctuation marks.
# You can make up to 5 attempts, and we'll use the best one for grading.
# (We do not require you to submit your code, so feel free to use any programming language you want --- just type the final numeric answer in the following space.)
# [TIP: before submitting, first test the correctness of your program on some small test files or your own devising.
# Then post your best test cases to the discussion forums to help your fellow students!]

require 'byebug'

class Homework1
  class << self
    def run(filename)
      input_array = file_to_array(filename)
      _, count = sort_and_count_inversions(input_array, input_array.size)
      p count
    end

    def file_to_array(filename)
      File.read(filename).split("\r\n").map(&:to_i)
    end

    def sort_and_count_inversions(array, length)
      if length == 1
        return [array, 0]
      else
        first_half = array[0...length / 2]
        second_half = array[length / 2...length]
        sorted_x, count_x = sort_and_count_inversions(first_half, first_half.size)
        sorted_y, count_y = sort_and_count_inversions(second_half, second_half.size)
        sorted_z, count_z = merge_and_count_split(sorted_x, sorted_y, length)
        [sorted_z, (count_x + count_y + count_z)]
      end
    end

    def merge_and_count_split(first_half, second_half, length)
      merged_array = []
      half_length_of_array = length / 2
      first_index = 0
      second_index = 0
      num_split = 0
      length.times do
        first_value = first_half[first_index]
        second_value = second_half[second_index]

        if first_value.nil?
          merged_array << second_value
          second_index += 1
        elsif second_value.nil?
          merged_array << first_value
          first_index += 1
        elsif first_value > second_value
          merged_array << second_value
          second_index += 1
          num_split += half_length_of_array - first_index
        elsif first_value < second_value
          merged_array << first_value
          first_index += 1
        end
      end

      [merged_array, num_split]
    end
  end
end

Homework1.run("./week-1/homework/integer_array_homework_1.txt")
