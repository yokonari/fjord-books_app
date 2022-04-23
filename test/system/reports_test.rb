# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'show reports' do
    visit '/books'
    click_on '日報'
    assert_selector 'h1', text: '日報'
  end

  test 'create report' do
    visit '/reports'
    click_on '新規作成'

    fill_in 'タイトル', with: '初の日報'
    fill_in '内容', with: 'よろしくお願いします。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '初の日報'
    assert_text 'よろしくお願いします。'
    assert_text 'alice'
  end

  test 'update report' do
    visit "/reports/#{reports(:report_by_alice).id}/edit"
    fill_in 'タイトル', with: '初めての日報'
    fill_in '内容', with: 'よろしくお願いします！'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '初めての日報'
    assert_text 'よろしくお願いします！'
    assert_text 'alice'
  end

  test 'delete report' do
    visit '/reports'
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました。'
    assert_no_text '初めての日報です。'
    assert_no_selector 'a', text: '削除'
  end
end
