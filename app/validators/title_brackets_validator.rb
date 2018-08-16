class TitleBracketsValidator < ActiveModel::Validator

  def validate(record)
    unless title_brackets_closed?(record.title)
      record.errors.add(:title, 'has some open brackets.')
    end
  end

  private

  def title_brackets_closed?(title)
    return false if title != title.gsub('()', '').gsub('{}', '').gsub('()', '')

    brackets = title.gsub(/[^\[\]\{\}\(\)]/, '')
    return true if brackets.empty?
    return false if brackets.size.odd?
    loop do
      str = brackets.gsub('()', '').gsub('[]', '').gsub('{}', '')
      return true if str.empty?
      return false if str == brackets
      brackets = str
    end
  end

end
