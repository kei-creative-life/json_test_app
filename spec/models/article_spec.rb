require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルと内容が入力されている場合' do
    let!(:article) do
      Article.new({ title: 'RSpecテスト', content: 'RSpecテストの内容' })
    end
    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'タイトルの文字が1文字の場合' do
    let!(:article_without_title) do
      Article.create({ title: '1', content: 'RSpecテストの内容' })
    end
    it 'タイトルのエラーメッセージが出ること' do
      expect(article_without_title.errors.messages[:title][0]).to eq('is too short (minimum is 2 characters)')
    end
  end

  context 'タイトルと内容が無記入の場合' do
    let!(:article_without_title_and_content) do
      Article.create({ title: '', content: '' })
    end
    it 'タイトルのエラーメッセージが出ること' do
      expect(article_without_title_and_content.errors.messages[:title][0]).to eq("can't be blank")
    end
    it '内容のエラーメッセージが出ること' do
      expect(article_without_title_and_content.errors.messages[:content][0]).to eq("can't be blank")
    end
  end

  context 'タイトルの文字数が25文字を超えた場合' do
    let!(:article_title_over_25) do
      Article.create({title:'25文字以上のテストです。これはエラーの対象になりますよ。'})
    end

    it 'タイトルのエラーメッセージが出ること' do
      puts article_title_over_25.errors.messages[:title][0]
      expect(article_title_over_25.errors.messages[:title][0]).to eq("is too long (maximum is 25 characters)")
    end
  end
end
