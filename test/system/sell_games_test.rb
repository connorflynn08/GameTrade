require "application_system_test_case"

class SellGamesTest < ApplicationSystemTestCase
  setup do
    @sell_game = sell_games(:one)
  end

  test "visiting the index" do
    visit sell_games_url
    assert_selector "h1", text: "Sell Games"
  end

  test "creating a Sell game" do
    visit sell_games_url
    click_on "New Sell Game"

    fill_in "Description", with: @sell_game.description
    fill_in "Price", with: @sell_game.price
    fill_in "String", with: @sell_game.string
    fill_in "Title", with: @sell_game.title
    fill_in "User", with: @sell_game.user_id
    click_on "Create Sell game"

    assert_text "Sell game was successfully created"
    click_on "Back"
  end

  test "updating a Sell game" do
    visit sell_games_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sell_game.description
    fill_in "Price", with: @sell_game.price
    fill_in "String", with: @sell_game.string
    fill_in "Title", with: @sell_game.title
    fill_in "User", with: @sell_game.user_id
    click_on "Update Sell game"

    assert_text "Sell game was successfully updated"
    click_on "Back"
  end

  test "destroying a Sell game" do
    visit sell_games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sell game was successfully destroyed"
  end
end
