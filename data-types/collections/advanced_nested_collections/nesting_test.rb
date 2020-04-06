require './nesting'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class NestedTest < MiniTest::Test

  def test_list_of_olive_garden_employees
    employees = stores[:olive_garden][:employees]
    assert_equal ["Jeff", "Zach", "Samantha"], employees
  end

  def test_pancake_ingredients
    pancake_ingredients = stores[:dennys][:dishes].first[:ingredients]
    assert_equal ["Flour", "Eggs", "Milk", "Syrup"], pancake_ingredients
  end

  def test_risotto_price
    risotto_price = stores[:olive_garden][:dishes].first[:price]
    assert_equal 12, risotto_price
  end

  def test_big_mac_ingredients
    big_mac_ingredients = stores[:macdonalds][:dishes].find(name: "Big Mac").first[:ingredients]
    assert_equal ['Bun','Hamburger','Ketchup','pickles'], big_mac_ingredients
  end

  def test_list_of_restaurants
    store_names = stores.keys
    assert_equal [:olive_garden, :dennys, :macdonalds], store_names
  end

  def test_list_of_dishes_names_for_olive_garden
    dishes_names = stores[:olive_garden][:dishes].map { |dish| dish[:name] }
    assert_equal ['Risotto', 'Steak'], dishes_names
  end

  def test_list_of_employees_across_all_restaurants
    employee_names = stores.map do |key, value|
      value[:employees]
    end.flatten
    # employee_names.flatten!
    assert_equal ["Jeff","Zach","Samantha","Bob","Sue","James","Alvin","Simon","Theodore"], employee_names
  end

  def test_list_of_all_ingredients_across_all_restaurants
    ingredients = stores.map do |key, value|
      value[:dishes].map do |dish|
        dish[:ingredients]
      end
    end.flatten
    assert_equal ["Rice",
                  "Cheese",
                  "Butter",
                  "Beef",
                  "Garlic",
                  "Flour",
                  "Eggs",
                  "Milk",
                  "Syrup",
                  "Flour",
                  "Eggs",
                  "Syrup",
                  "Bun",
                  "Hamburger",
                  "Ketchup",
                  "pickles",
                  "Potatoes",
                  "Salt"], ingredients
  end

  def test_full_menu_price_for_olive_garden
    full_menu_price = stores[:olive_garden][:dishes].map { |dish| dish[:price]}.sum
    assert_equal 27, full_menu_price
  end

  def test_full_menu_for_olive_garden
    olive_garden_menu = {}
    stores[:olive_garden][:dishes].each {|dish| olive_garden_menu[dish[:name]] = dish}
    expected = ({"Risotto"=>{:name=>"Risotto", :ingredients=>["Rice", "Cheese", "Butter"], :price=>12},
                  "Steak"=>{:name=>"Steak", :ingredients=>["Beef", "Garlic"], :price=>15}})
    assert_equal expected, olive_garden_menu
  end

  def test_menu_accross_all_restaurants
    full_menu = {}
    stores.each do |store, data|
      data[:dishes].each do |dish|
        full_menu[dish[:name]] = dish
      end
    end
    expected = ({"Risotto"=>
                      {:name=>"Risotto", :ingredients=>["Rice", "Cheese", "Butter"], :price=>12},
                "Steak"=>
                    {:name=>"Steak", :ingredients=>["Beef", "Garlic"], :price=>15},
                "Pancakes"=>
                     {:name=>"Pancakes",
                      :ingredients=>["Flour", "Eggs", "Milk", "Syrup"],
                      :price=>10},
                "Waffles"=>
                      {:name=>"Waffles", :ingredients=>["Flour", "Eggs", "Syrup"], :price=>7},
                "Big Mac"=>
                    {:name=>"Big Mac",
                    :ingredients=>["Bun", "Hamburger", "Ketchup", "pickles"],
                    :price=>5},
                "Fries"=>
                    {:name=>"Fries", :ingredients=>["Potatoes", "Salt"], :price=>2}
                  })
    assert_equal expected, full_menu
  end

end
