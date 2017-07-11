module LoadAnalytic
  def load_support
    @support = Supports::Analytic.new dish_order: top_dish_by_order, dish_price:
      top_dish_by_price, combo_order: top_combo_by_order, combo_price:
      top_combo_by_price, guest: top_guest
  end

  def top_dish_by_order
    d = ActiveRecord::Base.connection.exec_query(Settings.v_dish).rows
    d_name1 = d.map(&:first)
    d_count = d.map(&:second)
    d_name = Hash[d_name1.zip d_name1]
    Hash[d_name.zip d_count]
  end

  def top_combo_by_order
    c = ActiveRecord::Base.connection.exec_query(Settings.v_combo).rows
    c_name1 = c.map(&:first)
    c_count = c.map(&:second)
    c_name = Hash[c_name1.zip c_name1]
    Hash[c_name.zip c_count]
  end

  def top_dish_by_price
    d = ActiveRecord::Base.connection.exec_query(Settings.v_dish_by_price).rows
    d_name11 = d.map(&:first)
    d_count1 = d.map(&:second)
    d_name1 = Hash[d_name11.zip d_name11]
    Hash[d_name1.zip d_count1]
  end

  def top_combo_by_price
    c = ActiveRecord::Base.connection.exec_query(Settings.v_combo_by_price).rows
    c_name11 = c.map(&:first)
    c_count1 = c.map(&:second)
    c_name1 = Hash[c_name11.zip c_name11]
    Hash[c_name1.zip c_count1]
  end

  def top_guest
    g = ActiveRecord::Base.connection.exec_query(Settings.best_customer).rows
    g_name1 = g.map(&:first)
    g_count = g.map(&:second)
    g_name = Hash[g_name1.zip g_name1]
    Hash[g_name.zip g_count]
  end
end
