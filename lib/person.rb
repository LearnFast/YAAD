class Person
  include Math

  def initialize_from_user(user)
    @name = user.name
    @learning_curve = Proc.new { |x| user.A * exp(-x / user.b) }
    @concept_set = [
      [ user.concepts[0], 0.9   ]
      [ user.concepts[1], 0.025 ]
      [ user.concepts[2], 0.025 ]
      [ user.concepts[3], 0.025 ]
      [ user.concepts[4], 0.025 ]
    ]
  end
end
