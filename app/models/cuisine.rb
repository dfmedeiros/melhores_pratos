class Cuisine < ActiveRecord::Base

  has_and_belongs_to_many :foods

  def self.tokens(query)
    cuisines = where("name like ?", "%#{query}%")
    if cuisines.empty?
      [{id: "<<<#{query}>>>", name: "Cadastrar: \"#{query}\""}]
    else
      cuisines
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end

end
