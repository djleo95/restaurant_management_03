module Admin::AnalyticsHelper
  def top_by(data)
    bar_chart data,
      height: '200px',
      width: '450px',
      library: {
        yAxis: {
          allowDecimals: false
        },
        xAxis: {
          allowDecimals: false
        }
        },
      legend: false,
      stacked: true
  end

  def top_guest(data)
    column_chart data,
      height: '200px',
      width: '950px',
      library: {
        yAxis: {
          allowDecimals: false
        },
        xAxis: {
          allowDecimals: false
        }
      },
      legend: false,
      stacked: true
  end
end
