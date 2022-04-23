# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    assert reports(:report_by_alice).editable?(users(:alice))
    assert_not reports(:report_by_alice).editable?(users(:bob))
  end

  test '#created_on' do
    assert_equal reports(:report_by_alice).created_at.to_date,
                 reports(:report_by_alice).created_on
  end
end
