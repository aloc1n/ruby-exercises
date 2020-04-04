require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class HashesTest < Minitest::Test

  def test_1
    empty = {}
    assert_equal ({}), empty
  end

  def test_2
    empty = Hash.new(0)
    assert_equal 0, empty[:not_found]
  end

  def test_3
    ages = {"ben"=>4, "kelly"=>6}
    assert_equal 2, ages.length
    assert_equal 4, ages["ben"]
    assert_equal 6, ages["kelly"]
  end

  def test_4
    ages = {:ben => 4, :kelly => 6}
    assert_equal 2, ages.length
    assert_equal 4, ages[:ben]
    assert_equal 6, ages[:kelly]

    ages = {ben: 4, kelly: 6}
    assert_equal 2, ages.length
    assert_equal 4, ages[:ben]
    assert_equal 6, ages[:kelly]
  end

  def test_5
    ingredients = Hash.new(0)
    assert_equal 0, ingredients["tomatoes"]
    assert_equal 0, ingredients[:carrots]
  end

  def test_6
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    grapes = books["John Steinbeck"]
    assert_equal "Grapes of Wrath", grapes
  end

  def test_7
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    books["Ernest Hemmingway"] = "For Whom the Bell Tolls"
    expected = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird",
      "Ernest Hemmingway" => "For Whom the Bell Tolls"
    }
    assert_equal expected, books
  end

  def test_8
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    books["John Steinbeck"] = "Of Mice and Men"
    expected = {
      "John Steinbeck" => "Of Mice and Men",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    assert_equal expected, books
  end

  def test_9
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    books.delete("Harper Lee")
    expected = {
      "John Steinbeck" => "Grapes of Wrath"
    }
    assert_equal expected, books
  end

  def test_10
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    grapes = books[:John_Steinbeck]
    assert_equal "Grapes of Wrath", grapes
  end

  def test_11
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    expected = books[:Ernest_Hemmingway] = "For Whom the Bell Tolls"
    expected = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird",
      Ernest_Hemmingway: "For Whom the Bell Tolls"
    }
    assert_equal expected, books
  end

  def test_12
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    expected = books[:John_Steinbeck] = "Of Mice and Men"
    expected =  {
      John_Steinbeck: "Of Mice and Men",
      Harper_Lee: "To Kill a Mockingbird"
    }
    assert_equal expected, books
  end

  def test_13
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    expected = books.delete(:Harper_Lee)
    expected = {
      John_Steinbeck: "Grapes of Wrath"
    }
    assert_equal expected, books
  end

  def test_14
    ages = {
      "Jimmy" => 4,
      "Julio" => 8,
      "Juliet" => 9
    }
    ages["Julio"] = 9
    assert_equal 9, ages["Julio"]
  end

  def test_15
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    ages[:Julio] = 9
    assert_equal 9, ages[:Julio]
  end

  def test_16
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    names = ages.keys
    assert_equal [:Jimmy, :Julio, :Juliet], names
  end

  def test_17
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    age_list = ages.values
    assert_equal [4, 8, 9], age_list
  end

  def test_18
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    num_pairs = ages.size
    assert_equal 3, num_pairs
  end

  def test_19
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    jimmy_in_hash = ages.has_key?(:Jimmy)
    assert_equal true, jimmy_in_hash

    jackie_in_hash = ages.has_key?(:Jackie)
    assert_equal false, jackie_in_hash
  end

  def test_20
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    opposite = ages.invert
    expected = {
      4 => :Jimmy,
      8 => :Julio,
      9 => :Juliet
    }
    assert_equal expected, opposite
  end
end
