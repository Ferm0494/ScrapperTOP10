class Game 
    attr_reader :title, :description, :price, :rating
    def initialize(link)
        @title = get_title(link.css('h2 a').text).tr("\n","").strip
        @description = get_description(link.css('div.field.field-name-field-best-list-description').text).tr("\n","").strip
        @price = get_price(link.css('div.price-field').text).tr("\n","").strip
        @rating = get_rating(link.css('div.integer-stars-5').to_s,link.css('div.integer-stars-4').to_s)
    end

    def get_title(title) 
        return false if title.empty?
        title
    end

    def get_description(description)
        
        return false if description.empty?
        description
    end

    def get_price(price)
        return false if price.empty?
        price
    end

    def get_img()
        full_elem = @link.css('source').attr('data-srcset').to_s
        return false if full_elem.empty?
        elems = full_elem.split(' ')
        elems[0]
    end

    def get_rating(star5,star4)
        if !star5.empty?
           return 5
        elsif !star4.empty?
            return 4
        else
            return false
        end
    end
end