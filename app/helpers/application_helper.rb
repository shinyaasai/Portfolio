module ApplicationHelper
  def full_title(page_title = '')
    base_title = "SleepApp"
    if page_title.empty?
      base_title
    else
      page_title + "-" + base_title
    end
  end

  def bootstrap_alert(key)
    case key
    when "alert"
      "danger"
    when "notice"
      "info"
    when "error"
      "danger"
    end
  end
end
