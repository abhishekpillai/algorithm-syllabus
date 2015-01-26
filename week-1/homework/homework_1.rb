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
      p find_num_inversions(array)
    end

    def file_to_array(filename)
      File.read(filename).split("\r\n").map(&:to_i)
    end

    def find_num_inversions(array)
      array_length = array.size
      half_length_of_array = array_length / 2
      first_half = array[0...half_length_of_array]
      second_half = array[half_length_of_array...array.size]

      first_half.sort!
      second_half.sort!

      num_inversions = 0
      first_index = 0
      second_index = 0
      merged_array = []
      while merged_array.size < array_length do
        first_value = first_half[first_index]
        second_value = second_half[second_index]
        if first_value.nil?
          merged_array.concat(second_half[second_index...array_length])
          next
        elsif second_value.nil?
          merged_array.concat(first_half[first_index...half_length_of_array])
          next
        end

        if first_value > second_value
          num_inversions += 1 if first_index < second_index
          merged_array << second_value
          second_index += 1
        elsif second_value > first_value
          num_inversions += 1 if second_index < first_index
          merged_array << first_value
          first_index += 1
        end
      end
      p merged_array
      num_inversions
    end
  end
end
