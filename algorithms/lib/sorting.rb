# good for small sequences
# like sorting cards
# empty left hand, pick up one from the pile and insert into place


def insertion_sort ary_to_sort
  ary = ary_to_sort.dup
  (1...ary.length).each do |current_key_index|
    key = ary[current_key_index]
    comparison_key_index = current_key_index - 1
    while (comparison_key_index > -1) && (ary[comparison_key_index] > key)
      ary[comparison_key_index + 1] = ary[comparison_key_index]
      comparison_key_index -= 1
    end
    ary[comparison_key_index + 1] = key
  end
  ary
end


def merge_sort ary_to_sort
  return ary_to_sort if ary_to_sort.length < 2
  midpoint = ary_to_sort.length / 2
  left_half = ary_to_sort[0...midpoint]
  right_half = ary_to_sort[midpoint..-1]
  merge merge_sort(left_half), merge_sort(right_half)
end

def merge left, right
  sorted = []
  until left.empty? || right.empty?
    if left.first < right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

def bubble_sort ary_to_sort
  ary = ary_to_sort.dup
  return ary if ary.length < 2
  sorted = false
  until sorted
    sorted = true
    0.upto(ary_to_sort.length - 2) do |i|
      if ary[i] > ary[i + 1]
        ary[i], ary[i + 1] = ary[i + 1], ary[i]
        sorted = false
      end
    end
  end
  ary
end







