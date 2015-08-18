# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'ztree'
  s.version = '0.0.7'
  s.authors = ['Zhimeng Sun']
  s.email = ['zhimengSun@gmail.com']
  s.homepage = 'https://github.com/zhimengSun/ztree'
  s.summary = 'ztree for rails'
  s.description = 'ztree for rails, Extractive common action and helper'

  s.files = `git ls-files`.split("\n")

  s.add_dependency "jquery-rails"
end
