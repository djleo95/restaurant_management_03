class Admin
  class AnalyticsController < ApplicationController
    def index
      top_dish = ActiveRecord::Base.connection.exec_query(
        Settings.valuable_dish).rows
      dish_name1 = top_dish.map {|d| d.first}
      dish_count = top_dish.map {|d| d.second}
      dish_name = Hash[dish_name1.zip dish_name1]
      @dish = Hash[dish_name.zip dish_count]


      top_combo = ActiveRecord::Base.connection.exec_query(
        Settings.valuable_combo).rows
      combo_name1 = top_combo.map {|d| d.first}
      combo_count = top_combo.map {|d| d.second}
      combo_name = Hash[combo_name1.zip combo_name1]
      @combo = Hash[combo_name.zip combo_count]

      top_dish1 = ActiveRecord::Base.connection.exec_query(
        Settings.valuable_dish_by_price).rows
      dish_name11 = top_dish1.map {|d| d.first}
      dish_count1 = top_dish1.map {|d| d.second}
      dish_name1 = Hash[dish_name11.zip dish_name11]
      @dish1 = Hash[dish_name1.zip dish_count1]


      top_combo1 = ActiveRecord::Base.connection.exec_query(
        Settings.valuable_combo_by_price).rows
      combo_name11 = top_combo1.map {|d| d.first}
      combo_count1 = top_combo1.map {|d| d.second}
      combo_name1 = Hash[combo_name11.zip combo_name11]
      @combo1 = Hash[combo_name1.zip combo_count1]

      top_guest = ActiveRecord::Base.connection.exec_query(
        Settings.best_customer).rows
      guest_name1 = top_guest.map {|d| d.first}
      guest_count = top_guest.map {|d| d.second}
      guest_name = Hash[guest_name1.zip guest_name1]
      @guest = Hash[guest_name.zip guest_count]
    end
  end
end
