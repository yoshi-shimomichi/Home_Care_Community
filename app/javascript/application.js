// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Javascriptの設定
//= require jquery3
//= require popper
//= require bootstrap

import "@hotwired/turbo-rails"
import "controllers"

// Javascript確認用
$(function(){
    alert("jQuery 動いた！")
  })