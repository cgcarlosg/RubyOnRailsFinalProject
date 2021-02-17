module TransHelper
  def sum_total(trans)
    sum = 0
    trans&.each { |amount| sum += amount.total }
    sum
  end
end
