module ItemsHelper
  def counter(arr)
    c = 0
    arr.each do |item|
      c += item.amount
    end
    c
  end
end
