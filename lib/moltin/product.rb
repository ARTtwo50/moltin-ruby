module Moltin
  class Product
    class << self
      def create(options={})
        response = post("#{@version}/product", options)
      end
    end
  end
end