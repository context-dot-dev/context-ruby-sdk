# frozen_string_literal: true

require_relative "test_helper"

class ContextDev::Test::FilePartTest < Minitest::Test
  def test_to_json
    text = "gray"
    filepart = ContextDev::FilePart.new(StringIO.new(text))

    assert_equal(text.to_json, filepart.to_json)
    assert_equal(text.to_yaml, filepart.to_yaml)
  end

  def test_filename_basename_for_io
    file = File.open(__FILE__)
    filepart = ContextDev::FilePart.new(file)
    assert_equal(File.basename(__FILE__), filepart.filename)
    file.close
  end

  def test_pathless_io
    r, w = IO.pipe
    filepart = ContextDev::FilePart.new(r)
    assert_nil(filepart.filename)
    r.close
    w.close
  end
end
