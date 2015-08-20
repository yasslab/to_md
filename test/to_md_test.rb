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

  def test_array_of_hash_to_md
    assert_equal([{name: 'a', age: 3}, {name: 'b', age: 4}].to_md, <<TABLE)
| name | age |
| --- | --- |
| a | 3 |
| b | 4 |
TABLE
  end

  def test_mixed_array_with_header_to_md
    array = [[:id, :name], {name: 'aaa', age: 3}, [2, 'bbb'], nil, 'ccc']
    assert_equal(array.to_md, <<TABLE)
| id | name |
| --- | --- |
|  | aaa |
| 2 | bbb |
|  |  |
| ccc |  |
TABLE
  end

  def test_to_md_table_escape
    assert_equal([['escape',"a|b\nc"]].to_md, <<TABLE)
| escape | a&#124;b&#10;c |
| --- | --- |
TABLE
  end

end
