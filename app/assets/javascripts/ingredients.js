// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
class Ingredient {
  constructor(name, unit, inventory_amount) {
    this.name = name;
    this.unit = unit;
    this.inventory_amount = inventory_amount;
  }

  static tableFormat() {
    return `<table class="inventory">
      <tr>
        <th>Ingredient Name</th>
        <th>Amount On Hand</th>
      </tr>
    </table>
    <button type="button" onclick="newIngredient()">Add Ingredient</button>`
  }

  tableRow() {
    return `<tr>
      <td>${this.name}</td>
      <td>${this.inventory_amount} ${this.unit}</td>
    </tr>`
  }
// retrieve ingredients and display in a table
  static inventoryTable() {
    $.get("/ingredients", function(result) {
      let ingredients = result["data"];
      $('#homePage').html(Ingredient.tableFormat());
      ingredients.forEach(function(ingredient) {
        let ing = new Ingredient(ingredient["attributes"]["name"], ingredient["attributes"]["unit"], ingredient["attributes"]["inventory-amount"])
        $('.inventory').append(ing.tableRow())
      });
    });
  }

}

// $(function() {
//   $('#homePage').
// });

// function inventoryTable() {
//   $.get("/ingredients", function(result) {
//     let ingredients = result["data"];
//     ingredients.forEach(function(ingredient) {
//       let ing = new Ingredient
//       ing.name = ingredient["attributes"]["name"]
//       ing.inventory_amount = ingredient["attributes"]["inventory-amount"]
//       ing.unit = ingredient["attributes"]["unit"]
//       $('.inventory').append(ing.tableFormat())
//       // debugger
//     });
//   });
// }


//function to populate table with ingredients
// function populateInventory() {
//   $.get("/ingredients", function(result) {
//       ingredients = result["data"]
//     // populate table
//     ingredients.forEach(function(ingredient) {
//       const name = ingredient["attributes"]["name"]
//       const amount = ingredient["attributes"]["inventory-amount"]
//       const unit = ingredient["attributes"]["unit"]
//       // debugger
//       $('.inventory').append(
//         `<tr>
//           <td>${name}</td>
//           <td>${amount} ${unit}</td>
//         </tr>`
//       );
//     })
//   });
// }
//
// //Serialize info from new ingredientn form, create new ingredient, display inventory with new ingredient
// function newIngredient() {
//   $.get('/ingredients/new', function(result) {
//     ingredientForm();
//   })
//   $('#ingForm').submit(function(event) {
//     event.preventDefault();
//     const values = $(this).serialize();
//     $.post('/ingredients', values).done(function() {
//       populateInventory();
//     })
//   });
// }
//
// //generate form to add an ingredient to the inventory
// function ingredientForm() {
//   $('#invPage').html(
//     `<form id="ingForm" action="/ingredients" method="post">
//       Name: <input name="ingredient[name]" type="text"><br>
//       Amount: <input name="ingredient[inventory_amount]" type="text">
//       Unit: <input name="ingredient[unit]" type="text"><br>
//       <input type="submit" value="Create Ingredient">
//     </form>`
//   );
// }
