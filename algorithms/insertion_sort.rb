# good for small sequences
# like sorting cards
# empty left hand, pick up one from the pile and insert into place


def insertion_sort ary_to_sort
  ary = ary_to_sort.dup
  (1...ary.length).each do |j|
    key = ary[j]
    i = j - 1
    while (i > -1) && (ary[i] > key)
      ary[i + 1] = ary[i]
      i -= 1
    end
    ary[i + 1] = key
  end
  ary
end

p insertion_sort [5,3,4,2,1]
