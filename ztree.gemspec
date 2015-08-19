# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'ztree'
  s.version = '0.0.8'
  s.authors = ['Zhimeng Sun', 'happyming9527']
  s.email = ['happyming9527@gmail.com']
  s.homepage = 'https://github.com/happyming9527/ztree'
  s.summary = 'ztree for rails'
  s.description = 'ztree for rails, Extractive common action and helper'

  s.files = `git ls-files`.split("\n")

  s.add_dependency "jquery-rails"
end
