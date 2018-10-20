//  Place all the behaviors and hooks related to the matching controller here.
//  All this logic will automatically be available in application.js.
$(function() {
  populateInventory();

});
//function to populate table with ingredients
function populateInventory() {
  $.get("/ingredients", function(result) {
    result["data"].forEach(function(ingredient) {
      const name = ingredient["attributes"]["name"]
      const amount = ingredient["attributes"]["inventory-amount"]
      const unit = ingredient["attributes"]["unit"]
      // debugger
      $('.inventory').append(
        `<tr>
          <td>${name}</td>
          <td>${amount} ${unit}</td>
        </tr>`
      );
    })
  });
}
