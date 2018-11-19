class Menu {
  constructor(menu_date, monday_lunch, monday_dinner, tuesday_lunch, tuesday_dinner, wednesday_lunch, wednesday_dinner, thursday_lunch, thursday_dinner, friday_lunch, friday_dinner, saturday_lunch, saturday_dinner, sunday_lunch, sunday_dinner) {
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
  }

  static getMenu(path) {
    // $.get(path, function(result) {
    //   console.log(result);
    // })
    fetch(path)
    .then(response => response.json())
    .then(function(json) {
      let menu = new Menu(json.data.attributes["menu-date"], json.data.attributes["monday-lunch"], json.data.attributes["monday-dinner"], json.data.attributes["tuesday-lunch"], json.data.attributes["tuesday-dinner"], json.data.attributes["wednesday-lunch"], json.data.attributes["wednesday-dinner"], json.data.attributes["thursday-lunch"], json.data.attributes["thursday-dinner"], json.data.attributes["friday-lunch"], json.data.attributes["friday-dinner"], json.data.attributes["saturday-lunch"], json.data.attributes["saturday-dinner"], json.data.attributes["sunday-lunch"], json.data.attributes["sunday-dinner"])
      document.getElementById('homePage').innerHTML = menu.display()
    }
    );
  }

// generate html to display menu content
  display() {
    return `<h1>Week of ${this.menu_date}</h1>
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
    <p>${this.sunday_dinner}</p>`
  }

}
