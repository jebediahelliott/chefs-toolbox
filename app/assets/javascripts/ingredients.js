// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
class Ingredient {
  constructor(id, name, unit, inventoryAmount) {
    this.id = id
    this.name = name;
    this.unit = unit;
    this.inventoryAmount = inventoryAmount;
  }
  // table structure for inentory
  static tableFormat() {
    return `<table class="inventory">
      <tr>
        <th>Ingredient Name</th>
        <th>Amount On Hand</th>
        <th>New Amount</th>
      </tr>
    </table>
    <button type="button" onclick="Ingredient.newIngredient()">Add Ingredient</button>`
  }

  // individual rows for inventory table with form to update amounts
  tableRow() {
    return `<tr>
      <td>${this.name}</td>
      <td>${this.inventoryAmount} ${this.unit}</td>
      <td>
        <form id="${this.id}">
          <input type="hidden" name="ingredient[name]" value="${this.name}">
          <input type="hidden" name="ingredient[unit]" value="${this.unit}">
          <input type="text" name="ingredient[inventoryAmount]">
          <input type="submit" value="Update Amount">
        </form>
      </td>
    </tr>`
  }
  // form to add new ingredients to inventory and listeners to process form submission
  static newIngredient() {
    document.getElementById('homePage').innerHTML = `
    <form id="newIngredientForm">
      <p>Name<br>
      <input type="text" name="ingredient[name]"></p>
      <p>Unit<br>
      <input type="text" name="ingredient[unit]"></p>
      <p>Amount<br>
      <input type="text" name="ingredient[inventoryAmount]"></p>
      <input type="submit" value="Create New Ingredient">
    </form>`
    document.getElementById('newIngredientForm').addEventListener("submit", function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      $.ajax({
        method: "POST",
        url: "/ingredients",
        data: values
      })
      .done(function(result) {
        Ingredient.inventoryTable()
      })
    })
  }


  // retrieve ingredients and display in a table
  static inventoryTable() {
    $.get("/ingredients.json", function(result) {
      let ingredients = result["data"];
      ingredients.sort(function(a, b) {
        const nameA = a["attributes"]["name"].toUpperCase()
        const nameB = b["attributes"]["name"].toUpperCase()
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }

        // names must be equal
        return 0;
      });
      $('#homePage').html(Ingredient.tableFormat());
      ingredients.forEach(function(ingredient) {
        const ing = new Ingredient(ingredient.id, ingredient["attributes"]["name"], ingredient["attributes"]["unit"], ingredient["attributes"]["inventory-amount"]);
        if (ing.inventoryAmount > 0) {
          $('.inventory').append(ing.tableRow());
          // Add listeners to update buttons, send request to update ingredient and display updated table
          document.getElementById(`${ing.id}`).addEventListener("submit", function(event) {
            event.preventDefault();
            var values = $(this).serialize();
            $.ajax({
              method: "PUT",
              url: `/ingredients/${this.id}`,
              data: values
            })
            .done(function() {
              Ingredient.inventoryTable();
            });
          });
        }
      });

    });
  }

}
