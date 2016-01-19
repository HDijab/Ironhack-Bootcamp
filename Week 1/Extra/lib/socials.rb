class Socials
  attr_reader :socials, :first
  def initialize(socials)
    @socials = socials
    @first = {}
    @second = {}
  end

  def connections(former, latter)
    former.each do |key, value|
      value.each do |value|
        if former[value]
          if former[value].include?(key) 
            if latter.has_key?(key)
              latter[key] << value
            else
              latter[key] = [value]
            end
          end
        else
        end
      end
    end
  end

  def first
    connections(@socials, @first)
  end
end