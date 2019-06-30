// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  coffesIndexClick()
})

const coffesIndexClick = () => {
  $('.all-coffees').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "coffees")
    fetch('/coffees.json')
      .then(response => response.json())
      .then(coffees => {
        $('.container').html('')
        coffees.forEach(coffee => {
          let newCoffee = new Coffee(coffee)
          let coffeeHtml = newCoffee.formatIndex()
           $('.container').append(coffeeHtml)
        })
      })
  })

  $(document).on('click', ".show_coffee", function(e) {
    e.preventDefault()
    $('.container').html('')
    let id = $(this).attr('data-id')
    fetch(`/coffees/${id}.json`)
    .then(response => response.json())
    .then(coffee => {
      let newCoffee = new Coffee(coffee)
      let coffeeHtml = newCoffee.formatShow()
       $('.container').append(coffeeHtml)
    })
  })

  $("#new_coffee").on("submit", function(e) {
    e.preventDefault()
    const values = $(this).serialize()

    $.post("/coffees", values).done(function(data) {
      //console.log(data)
      $('.container').html('')
      const newCoffee = new Coffee(data)
      const coffeehtmlToAdd = newCoffee.formatShow()
      $('.container').html(coffeehtmlToAdd)

    })
  })
}



function Coffee(coffee) {
  this.id = coffee.id
  this.name = coffee.name
  this.process = coffee.process
  this.grind_id = coffee.grind_id
}

Coffee.prototype.formatIndex = function() {
  let coffeeHtml = `
    <a href="/coffees/${this.id}" data-id="${this.id}" class="show_coffee"<h1>${this.name}</h1></a>
  `
  return coffeeHtml
}

Coffee.prototype.formatShow = function() {
  let coffeeHtml = `
    <h3>${this.name}</h3>

  `
  return coffeeHtml

}
