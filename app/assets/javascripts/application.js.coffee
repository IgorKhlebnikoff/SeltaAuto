## jQuery
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery.turbolinks
#= require dataTables/jquery.dataTables

## AngularJS
#= require angular
#= require_tree ./angularjs/
#= require angularjs/modules

## All files
#= require tinymce_config
#= require_tree ./plugins
#= require_tree ./pages
#= require_tree .

$ ->
  $('#slider').slidesjs
    width: 1132
    height: 528
    navigation:
      effect: "fade"
    pagination:
      active: false
    effect:
      fade:
        speed: 300
    play:
      active: false
      effect: "fade"
      interval: 5000
      auto: true
      swap: true
      pauseOnHover: false

  # Show maintenance aside form
  $('#show_maintenance_form').on 'click', ->
    $('#maintenance_form').fadeIn 150
    false

  # Close maintenance aside form
  $('#close_maintenance_form').on 'click', ->
    $('#maintenance_form').fadeOut 100
    false

  $('#autoparts_table').dataTable()
  $('#oils_table').dataTable()
