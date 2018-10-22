// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {


});
//function to populate table with ingredients
function populateInventory() {
  $.get("/ingredients", function(result) {
    //set up page layout
    $('#invPage').html(
      `<table class="inventory">
        <tr>
          <th>Ingredient Name</th>
          <th>Amount On Hand</th>
        </tr>
      </table>
      <button type="button" onclick="newIngredient()">Add Ingredient</button>`
    );
    //populate table
    result["data"].forEach(function(ingredient) {
      const name = ingredient["attributes"]["name"]
      const amount = ingredient["attributes"]["inventory-amount"]
      const unit = ingredient["attributes"]["unit"]
      $('.inventory').append(
        `<tr>
          <td>${name}</td>
          <td>${amount} ${unit}</td>
        </tr>`
      );
    })
  });
}

//Serialize info from new ingredientn form, create new ingredient, display inventory with new ingredient
function newIngredient() {
  $.get('/ingredients/new', function(result) {
    ingredientForm();
  })
  $('#ingForm').submit(function(event) {
    event.preventDefault();
    const values = $(this).serialize();
    $.post('/ingredients', values).done(function() {
      populateInventory();
    })
  });
}

//generate form to add an ingredient to the inventory
function ingredientForm() {
  $('#invPage').html(
    `<form id="ingForm" action="/ingredients" method="post">
      Name: <input name="ingredient[name]" type="text"><br>
      Amount: <input name="ingredient[inventory_amount]" type="text">
      Unit: <input name="ingredient[unit]" type="text"><br>
      <input type="submit" value="Create Ingredient">
    </form>`
  );
}
