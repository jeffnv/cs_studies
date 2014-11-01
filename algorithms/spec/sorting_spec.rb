require "sorting.rb"

RSpec.shared_examples "a sorting algorithm" do |algorithm_name|
  describe "sorting" do
    it "doesn't modify the original" do
      ary = [1,2,3]
      expect(send(algorithm_name, ary).object_id).to_not eq ary.object_id
    end
    it "can handle an empty array" do
      expect(send(algorithm_name, [])).to eq []
    end

    it "sorts one element" do
      expect(send(algorithm_name, [1])).to eq [1]
    end

    it "sorts a reversed array" do
      expect(send(algorithm_name, [5,4,3,2,1])).to eq [1,2,3,4,5]
    end

    it "sorts a shuffled array" do
      5.times do 
        expect(send(algorithm_name, (1..100).to_a.shuffle)).to eq (1..100).to_a
      end
    end
  end
end

include SortingAlgorithms
SortingAlgorithms.instance_methods.each do |algorithm_name|
  describe algorithm_name do
    it_behaves_like "a sorting algorithm", algorithm_name
  end
end
