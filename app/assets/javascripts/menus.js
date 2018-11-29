class Menu {
  constructor(id, menuDate, mondayLunch, mondayDinner, tuesdayLunch, tuesdayDinner, wednesdayLunch, wednesdayDinner, thursdayLunch, thursdayDinner, fridayLunch, fridayDinner, saturdayLunch, saturdayDinner, sundayLunch, sundayDinner, recipes) {
    this.mondayLunch = mondayLunch
    this.mondayDinner = mondayDinner
    this.tuesdayLunch = tuesdayLunch
    this.tuesdayDinner = tuesdayDinner
    this.wednesdayLunch = wednesdayLunch
    this.wednesdayDinner = wednesdayDinner
    this.thursdayLunch = thursdayLunch
    this.thursdayDinner = thursdayDinner
    this.fridayLunch = fridayLunch
    this.fridayDinner = fridayDinner
    this.saturdayLunch = saturdayLunch
    this.saturdayDinner = saturdayDinner
    this.sundayLunch = sundayLunch
    this.sundayDinner = sundayDinner
    this.menuDate = menuDate
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
    return `<h1>Week of ${this.menuDate}</h1>
    <button id="recipes">This Week's Recipes</button>
    <h3>Monday</h3>
    <h4>Lunch</h4>
    <p>${this.mondayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.mondayDinner}</p>
    <h3>Tuesday</h3>
    <h4>Lunch</h4>
    <p>${this.tuesdayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.tuesdayDinner}</p>
    <h3>Wednesday</h3>
    <h4>Lunch</h4>
    <p>${this.wednesdayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.wednesdayDinner}</p>
    <h3>Thursday</h3>
    <h4>Lunch</h4>
    <p>${this.thursdayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.thursdayDinner}</p>
    <h3>Friday</h3>
    <h4>Lunch</h4>
    <p>${this.fridayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.fridayDinner}</p>
    <h3>Saturday</h3>
    <h4>Lunch</h4>
    <p>${this.saturdayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.saturdayDinner}</p>
    <h3>Sunday</h3>
    <h4>Lunch</h4>
    <p>${this.sundayLunch}</p>
    <h4>Dinner</h4>
    <p>${this.sundayDinner}</p>
    <a href="/menus/${this.id}/edit">Edit</a>`
  }

}
