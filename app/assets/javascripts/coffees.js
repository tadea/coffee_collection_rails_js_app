// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(() => {
  coffesIndexClick()
  showCoffee()
  submitForm()
})




function coffesIndexClick() {
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
}

function showCoffee() {
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
  }


function submitForm() {
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
  this.description = coffee.description
  this.process = coffee.process
  this.origin = coffee.origin
  this.grind_id = coffee.grind_id
  this.reviews = coffee.reviews
}


Coffee.prototype.formatIndex = function() {
  let coffeeHtml = `
    <a href="/coffees/${this.id}" data-id="${this.id}" class="show_coffee"
    <h1 class="show_name">${this.name}</h1></a>
    <p class="show_process">Process: ${this.process}</p>

  `
  return coffeeHtml
}

Coffee.prototype.formatShow = function() {

  let reviewsHtml = ``
    this.reviews.forEach((rev) => {
      reviewsHtml += `<li> ${rev.id} - ${rev.comment}`
    })

  let coffeeHtml = `
    <h2><b>${this.name}</h2></b>
    <h4>Process: ${this.process}</h4>
    <p>${this.description}</p>
    <p>Origin: ${this.origin}</p>



    <h3><b>Reviews</h3></b>
      ${reviewsHtml}
      `
  return coffeeHtml
}
