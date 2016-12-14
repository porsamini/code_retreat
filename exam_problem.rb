require 'benchmark'

class Exam
  def initialize(no_of_q, compl)
    @no_of_q = no_of_q
    @compl = compl
    @max_skips = 0
  end

  def question_complexity(arr = [])
    raise ExamException if arr.size > @no_of_q
    @question_complexity = arr
  end

  def solve
    count = 0
    @question_complexity.each do |q|
      if q >= @compl
        @max_skips =  @max_skips + 1
        if @max_skips > 1
          return count
        end
      else
        count = count + 1
      end
    end
  end
end

class ExamException < Exception
end

time = Benchmark.measure do 
  ex = Exam.new(6, 4)
  ex.question_complexity([1,2,4,3,3,6])
  print 'Result: '
  puts ex.solve
end

puts time
