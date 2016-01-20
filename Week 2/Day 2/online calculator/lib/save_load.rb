module SaveLoad
  def save(result)
    IO.write('./public/saved_result.txt', result)
  end

  def load
    IO.read('./public/saved_result.txt')
  end
end