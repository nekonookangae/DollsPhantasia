module ApplicationHelper
  # truncate post.content
  def truncate_text(text)
    # if text = nil, then assignment empty string
    text = strip_tags(text) || ""
    text = text.truncate(25, omission: '...')
  end

  # colored tag
  def category_to_tag(id)
    if id == 1
      id = 'drawing'
    elsif id == 2
      id = 'technology'
    elsif id == 3
      id = 'baseball'
    elsif id == 4
      id = 'others'
    end
  end

  # monthly archive
  def ymconv(yyyymm, cnt)
    yyyy = yyyymm[0, 4]
    mm = yyyymm[4, 2]
    return yyyy + '年' + mm + '月 (' + cnt + ')'
  end

end
