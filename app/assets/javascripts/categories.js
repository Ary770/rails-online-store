// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  $(".btn.btn-link").on("click", function(){
    var id = $(this).data("id")
    $.getJSON(`/categories/${id}`, function(category_data){
      var items = category_data["items"]
      var itemsList = "";

      items.forEach(function(item) {
        itemsList+= `<li><a href="/items/${item.id}">${item.name} | $${item.price.toLocaleString()}</a></li>`;
      });
      $(`#category-item-${id}`).html(itemsList)
    });
  });
});
