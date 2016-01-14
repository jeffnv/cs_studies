module SortingAlgorithms

  # good for small sequences
  # like sorting cards
  # empty left hand, pick up one from the pile and insert into place
  def ruby_sort ary_to_sort
    ary_to_sort.sort
  end

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

  private
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

  public

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

  def quick_sort ary_to_sort
    ary = ary_to_sort.dup
    return ary if ary.length < 2
    #choose a random pivot point
    pivot = ary.sample
    left, right = ary.partition { |el| el < pivot }
    quick_sort(left) + quick_sort(right)
  end

  def heap_sort ary_to_sort
    ary = ary_to_sort.dup
    return ary if ary.empty?
    heapify(ary)
    (ary.length - 1).downto(0) do |end_idx|
      ary[0], ary[end_idx] = ary[end_idx], ary[0]
      siftDown(ary, 0, end_idx - 1)
    end
    ary
  end

  private
  def heapify(a)
    #start is index of last parent
    start = (a.length  - 2) / 2
    while start >= 0 
      siftDown(a, start, a.count - 1)
      start -= 1
    end
  end
  def siftDown(a, start, end_idx)
    root = start
    while (root * 2 + 1) <= end_idx do #while the root has at least one child
      child = root * 2 + 1 #child's index
      if child + 1 <= end_idx && a[child] < a[child + 1] #if there is a right child
                                                         #and it's larger
        child = child + 1#use the right child instead
      end
      if a[root] < a[child] #if the element at the root is less than the child,
        a[root], a[child] = a[child], a[root]#swap the elements
        root = child#and process the child
      else
        return
      end
    end
  end

end






