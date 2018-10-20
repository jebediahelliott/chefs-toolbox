//  Place all the behaviors and hooks related to the matching controller here.
//  All this logic will automatically be available in application.js.
$(function() {
  populateInventory();

});

function populateInventory() {
  $('body').append('hi')
  $.get("/ingredients", function(result) {
    debugger;
    console.log(result);
  });
}
