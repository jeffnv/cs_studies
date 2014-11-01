require_relative "./sorting.rb"
require "benchmark"

include SortingAlgorithms
SortingAlgorithms.instance_methods.each do |algorithm_name|
  puts "#{algorithm_name}"
  [:reverse, :shuffle].each do |transformation|

    (1..4).each do |power|
      n = 10 ** power
      puts "\t#{n} elements #{transformation}d"
      puts "\t" + (Benchmark.measure() do
        send(algorithm_name, (1..n).to_a.send(transformation))
      end).to_s
    end
  end

end
