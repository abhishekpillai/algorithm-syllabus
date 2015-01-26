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
    def run
      array = file_to_array("./week-1/homework/integer_array_homework_1.txt")
      p sort_and_count_inversions(array, array.size)
    end

    def file_to_array(filename)
      File.read(filename).split("\r\n").map(&:to_i)
    end

    def sort_and_count_inversions(array, length)
      if length == 1
        return [nil, 0]
      else
        first_half = array[0...length / 2]
        second_half = array[length / 2...length]
        _, count_x = sort_and_count_inversions(first_half, first_half.size)
        _, count_y = sort_and_count_inversions(second_half, second_half.size)
        sorted_z, count_z = merge_and_count_split(array, length)
        [sorted_z, (count_x + count_y + count_z)]
      end
    end

    def merge_and_count_split(array, length)
      merged_array = []
      half_length_of_array = length / 2
      first_half = array[0, half_length_of_array]
      second_half = array[half_length_of_array, half_length_of_array]
      first_index = 0
      second_index = 0
      num_split = 0
      length.times do
        p first_value = first_half[first_index]
        p second_value = second_half[second_index]
        if first_value.nil?
          merged_array.concat(second_half[second_index, half_length_of_array])
          num_split += half_length_of_array - first_index
          next
        elsif second_value.nil?
          merged_array.concat(first_half[first_index, half_length_of_array])
          next
        end

        if first_value > second_value
          merged_array << second_value
          second_index += 1
          num_split += half_length_of_array - first_index
        else # first_half[first_index] < second_half[second_index]
          merged_array << first_value
          first_index += 1
        end
      end

      [merged_array, num_split]
    end
  end
end

Homework1.run
