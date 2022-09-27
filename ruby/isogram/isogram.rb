class Isogram
  def self.isogram?(str)
    no_space = str.upcase.gsub(/[^[:alpha:]]/, "")
    no_space.split("").uniq.length == no_space.length
  end
end
