# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations tests' do
    it 'ensures the article is invalid withoy title and body' do
      article = Article.new
      expect(article.valid?).to eq(false)
    end
    it 'ensures the article is valid with title and body' do
      article = Article.new(title: 'Title', body: 'Content of the body')
      expect(article.valid?).to eq(true)
    end
    it 'ensures the title is present' do
      article = Article.new(body: 'Content of the body')
      expect(article.valid?).to eq(false)
    end

    it 'ensures the body is present' do
      article = Article.new(title: 'Title')
      expect(article.valid?).to eq(false)
    end

    it 'ensures the article is active by default' do
      article = Article.new(body: 'Content of the body', title: 'Title')
      expect(article.active?).to eq(true)
    end

    it 'should be able to save article' do
      article = Article.new(body: 'Content of the body', title: 'Title')
      expect(article.save).to eq(true)
      expect(article.valid?).to eq(true)
    end
  end
  context 'scopes tests' do
    let(:params) { { body: 'Content of the body', title: 'Title', active: true } }
    before(:each) do
      Article.create(params)
      Article.create(params)
      Article.create(params)
      Article.create(params.merge(active: false))
      Article.create(params.merge(active: false))
    end

    it 'should return all active articles' do
      expect(Article.where(active: true).count).to eq(3)
    end

    it 'should return all inactive articles' do
      expect(Article.where(active: false).count).to eq(2)
    end

    it 'should return all both type of articles' do
      expect(Article.count).to eq(5)
    end
  end
end
