module ItemsHelper
  def counter(recored = @item)
    c = 0
    recored.each do |item|
      c += item.amount
    end
    c
  end
end
