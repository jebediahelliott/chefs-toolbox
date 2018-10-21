//  Place all the behaviors and hooks related to the matching controller here.
//  All this logic will automatically be available in application.js.
$(function() {
  // populateInventory();

});
//function to populate table with ingredients
function populateInventory() {
  $.get("/ingredients", function(result) {
    result["data"].forEach(function(ingredient) {
      const name = ingredient["attributes"]["name"]
      const amount = ingredient["attributes"]["inventory-amount"]
      const unit = ingredient["attributes"]["unit"]
      if (amount > 0) {
        $('.inventory').append(
          `<tr>
            <td>${name}</td>
            <td>${amount} ${unit}</td>
          </tr>`
        );
      }
    })
  });
}

//generate form to add an ingredient to the inventory
function ingredientForm() {
  $('.inventory').html(
    `<h3>New Ingredient</h3>
    <form action="/ingredients" method="POST">
      Name: <input type="text" name="name"><br>
      Amount: <input type="text" name="inventory_amount">
      Unit: <input type="text" name="unit"><br>
      <input type="submit" value="Submit">
    </form>`
  );
}
