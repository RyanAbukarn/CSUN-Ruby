require_relative "candy"
require_relative "shelf"
class Shop
    attr_accessor :shopName
    def initialize(shopName)
        @shelfs = {}
        @candies = {}
        @shopName = shopName
    end


    def randBarcode(whichHash)
        testRandBarcode = rand(1000).to_s
        while whichHash.has_key? testRandBarcode
            testRandBarcode = rand(1000).to_s
        end
        testRandBarcode
    end

    def addCandy(candy)
        @candies[randBarcode(@candies)] = candy
        return true
    end

    def addShelf(shelf)
        @shelfs[randBarcode(@shelfs)] = shelf
        return true
    end

    def destroyCandyFromShelf(barcodeShelf, barcodeCandy)
        temp = @shelfs[barcodeShelf].destroyCandy(barcodeCandy)
        temp.shelf = false
        @candies[barcodeCandy] = temp
        return true
    end

    def destroyShelf(barcode)
        @candies.merge!(@shelfs[barcode].candies())
        @shelfs.delete(barcode)
        return true
    end
    def totalCandies()
        sum = @candies.size()
        @shelfs.each do |barcode,shelf|
            sum += shelf.totalCandies()
        end
        sum
    end
    def addCandyToShelf(shelf,candyBarcode)
        @shelfs[shelf].addCandy(candyBarcode,@candies[candyBarcode])
        @candies.delete(candyBarcode)
        return true
    end
    def displayShelfs 
        @shelfs.each do |barcode,shelf|
            print "Barcode: #{barcode}, "
            shelf.displayCandies()
        end
    end

    def displayCandies 
        @candies.each do |barcode,candy|
            puts "Barcode: #{barcode}, Name: #{candy.candyName}"
            candy.displayCandy()
        end
    end
    def displayShop
        puts "-------------------Shelfs candies-----------------"
        puts ""
        displayShelfs()
        puts ""
        puts "-----------------Unshelfed candies----------------"
        puts ""
        displayCandies()
        puts "--------------Total candies in the store----------"
        puts "\t \t \t #{totalCandies()}"
    end
end