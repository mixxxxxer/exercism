class Acronym
  def self.abbreviate(str)
    str.upcase.gsub(/[^\w\s\d]/, " ").split.collect{|word| word[0] }.join
  end
end
