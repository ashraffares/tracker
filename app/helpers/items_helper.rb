module ItemsHelper
  def counter
      c = 0
      @items.each do |item|
        c += item.amount
      end
      c
  end
end
