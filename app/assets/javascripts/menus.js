class Menu {
  constructor(id, menu_date, monday_lunch, monday_dinner, tuesday_lunch, tuesday_dinner, wednesday_lunch, wednesday_dinner, thursday_lunch, thursday_dinner, friday_lunch, friday_dinner, saturday_lunch, saturday_dinner, sunday_lunch, sunday_dinner, recipes) {
    this.monday_lunch = monday_lunch
    this.monday_dinner = monday_dinner
    this.tuesday_lunch = tuesday_lunch
    this.tuesday_dinner = tuesday_dinner
    this.wednesday_lunch = wednesday_lunch
    this.wednesday_dinner = wednesday_dinner
    this.thursday_lunch = thursday_lunch
    this.thursday_dinner = thursday_dinner
    this.friday_lunch = friday_lunch
    this.friday_dinner = friday_dinner
    this.saturday_lunch = saturday_lunch
    this.saturday_dinner = saturday_dinner
    this.sunday_lunch = sunday_lunch
    this.sunday_dinner = sunday_dinner
    this.menu_date = menu_date
    this.id = id
    if (recipes) {
      this.recipes = recipes
    }else {
      this.recipes = []
    }
  }

  // List links to all recipes associated to menu
  recipeCall() {
    document.getElementById('homePage').innerHTML = '';
    this.recipes.forEach(function(recipe){
      document.getElementById('homePage').innerHTML += `<p><a href="/recipes/${recipe.id}">${recipe.name}</a></p>`
    })
  }

  static menuRecipes(path) {
    fetch(path)
    .then(response => response.json())
    .then(function(json) {
      const meals = json.data.attributes;
      const recipes = json.data.relationships.recipes.data
      const menu = new Menu(json.data.id, meals["menu-date"], meals["monday-lunch"], meals["monday-dinner"], meals["tuesday-lunch"], meals["tuesday-dinner"], meals["wednesday-lunch"], meals["wednesday-dinner"], meals["thursday-lunch"], meals["thursday-dinner"], meals["friday-lunch"], meals["friday-dinner"], meals["saturday-lunch"], meals["saturday-dinner"], meals["sunday-lunch"], meals["sunday-dinner"], recipes)
      menu.recipeCall();
    });
  }

  // Create menu object and display with listener on button to display recipes
  static getMenu(path) {
    fetch(path)
    .then(response => response.json())
    .then(function(json) {
      const meals = json.data.attributes;
      const recipes = json.data.relationships.recipes.data
      const menu = new Menu(json.data.id, meals["menu-date"], meals["monday-lunch"], meals["monday-dinner"], meals["tuesday-lunch"], meals["tuesday-dinner"], meals["wednesday-lunch"], meals["wednesday-dinner"], meals["thursday-lunch"], meals["thursday-dinner"], meals["friday-lunch"], meals["friday-dinner"], meals["saturday-lunch"], meals["saturday-dinner"], meals["sunday-lunch"], meals["sunday-dinner"], recipes)
      document.getElementById('homePage').innerHTML = menu.display()
      document.getElementById('recipes').addEventListener('click', function() {
        menu.recipeCall()
      });
    });
  }

// generate html to display menu content
  display() {
    return `<h1>Week of ${this.menu_date}</h1>
    <button id="recipes">This Week's Recipes</button>
    <h3>Monday</h3>
    <h4>Lunch</h4>
    <p>${this.monday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.monday_dinner}</p>
    <h3>Tuesday</h3>
    <h4>Lunch</h4>
    <p>${this.tuesday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.tuesday_dinner}</p>
    <h3>Wednesday</h3>
    <h4>Lunch</h4>
    <p>${this.wednesday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.wednesday_dinner}</p>
    <h3>Thursday</h3>
    <h4>Lunch</h4>
    <p>${this.thursday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.thursday_dinner}</p>
    <h3>Friday</h3>
    <h4>Lunch</h4>
    <p>${this.friday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.friday_dinner}</p>
    <h3>Saturday</h3>
    <h4>Lunch</h4>
    <p>${this.saturday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.saturday_dinner}</p>
    <h3>Sunday</h3>
    <h4>Lunch</h4>
    <p>${this.sunday_lunch}</p>
    <h4>Dinner</h4>
    <p>${this.sunday_dinner}</p>
    <a href="/menus/${this.id}/edit">Edit</a>`
  }

}
