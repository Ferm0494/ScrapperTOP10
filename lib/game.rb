class Game
  def initialize(link)
    @title = title(link.css('h2 a').text).tr("\n", '').strip
    @description = description(link.css('div.field.field-name-field-best-list-description').text).tr("\n", '').strip
    @price = price(link.css('div.price-field').text).tr("\n", '').strip
    @rating = rating(link.css('div.integer-stars-5').to_s, link.css('div.integer-stars-4').to_s)
    @img = img(link.css('source').attr('data-srcset').to_s)
  end

  def title(title)
    return false if title.empty?

    title
  end

  def description(description)
    return false if description.empty?

    description
  end

  def price(price)
    return false if price.empty?

    price
  end

  def img(full_elem)
    return false if full_elem.empty?

    elems = full_elem.split(' ')
    elems[0]
  end

  def rating(star5 = '', star4 = '')
    if !star5.empty?
      5
    elsif !star4.empty?
      4
    else
      false
    end
  end
end
