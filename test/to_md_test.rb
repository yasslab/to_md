require 'test_helper'

class ToMdTest < Minitest::Test
  using ToMd

  def test_that_it_has_a_version_number
    refute_nil ::ToMd::VERSION
  end

  def test_array_to_md
    assert_equal(['one', 'two'].to_md, "- one\n- two")
  end

  def test_nested_array_to_md
    assert_equal([['#', 'japanese'], [1, '一']].to_md, <<TABLE)
| # | japanese |
| --- | --- |
| 1 | 一 |
TABLE
  end
end
