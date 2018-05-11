// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

class Comment {
  constructor(attributes) {
    this.id = attributes.id;
    this.text = attributes.text;
    this.user = attributes.user;
  }

  userEmail(){
    return this.user.email;
  }

  buildHtml(){
    return `<div class="container"><div class="thumbnail"><h4>${this.user.email}</h4><p>${this.text}</p></div></div>`;
  }
}
