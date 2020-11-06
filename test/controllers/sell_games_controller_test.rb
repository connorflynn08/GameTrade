require 'test_helper'

class SellGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sell_game = sell_games(:one)
  end

  test "should get index" do
    get sell_games_url
    assert_response :success
  end

  test "should get new" do
    get new_sell_game_url
    assert_response :success
  end

  test "should create sell_game" do
    assert_difference('SellGame.count') do
      post sell_games_url, params: { sell_game: { description: @sell_game.description, price: @sell_game.price, string: @sell_game.string, title: @sell_game.title, user_id: @sell_game.user_id } }
    end

    assert_redirected_to sell_game_url(SellGame.last)
  end

  test "should show sell_game" do
    get sell_game_url(@sell_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_sell_game_url(@sell_game)
    assert_response :success
  end

  test "should update sell_game" do
    patch sell_game_url(@sell_game), params: { sell_game: { description: @sell_game.description, price: @sell_game.price, string: @sell_game.string, title: @sell_game.title, user_id: @sell_game.user_id } }
    assert_redirected_to sell_game_url(@sell_game)
  end

  test "should destroy sell_game" do
    assert_difference('SellGame.count', -1) do
      delete sell_game_url(@sell_game)
    end

    assert_redirected_to sell_games_url
  end
end
