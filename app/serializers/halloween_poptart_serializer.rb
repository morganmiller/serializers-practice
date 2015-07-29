class HalloweenPoptartSerializer < ActiveModel::Serializer
  attributes :flavor, :sprinkles

  def flavor
    "Spooky #{object.flavor}"
  end

  def sprinkles
    "Spooky #{object.sprinkles}"
  end
end
