// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
class Item {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.price = attributes.price;
    this.inventory = attributes.inventory;
    this.description = attributes.description;
    this.category = attributes.category;
  }

  categoryName(){
    return this.category.name;
  }

  buildHtml(){
    return `<div class="panel panel-default"><div class="panel-body"><h4><a href="items/${this.id}">${this.name} | $${this.price.toLocaleString()} | Inventory: ${this.inventory} | Category: ${this.category.name}</a></h4></div></div>`
  }
}
