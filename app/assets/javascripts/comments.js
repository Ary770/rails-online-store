// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
class Comment {
  constructor(attributes) {
    this.id = attributes.id;
    this.text = attributes.text;
    this.createdAt = attributes.created_at;
    this.user = attributes.user;
  }

  userEmail(){
    return this.user.email;
  }

  buildHtml(){
    return `<div class="panel panel-default"><div class="panel-heading"><h6 class="panel-title">${this.user.email}<span class="text-muted" style="float: right"><small>${this.date()}</small></span></h6></div><div class="panel-body"><p>${this.text}</p></div></div>`;
  }

  date(){
    let date = new Date(this.createdAt);
    return date.toLocaleDateString();
  }
}

// function displayComments() {
//   $('#js-comments').click(function(e){
//     e.preventDefault();
//     var id = $(this).data("id")
//     $.getJSON(`/items/${id}`, function(itemData) {
//       var comments = itemData['comments']
//       var commentsList = "";
//       comments.forEach(function (commentData) {
//         var comment = new Comment(commentData);
//         commentsList += comment.buildHtml();
//       })
//       $('#js-view-comments').html(commentsList);
//     });
//   });
// }
