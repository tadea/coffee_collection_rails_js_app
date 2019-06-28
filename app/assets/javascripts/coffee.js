// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  // console.log('hellow')
  coffesIndexClick()
})

const coffesIndexClick = () => {
  $('.navbar-brand').on('click', (e) => {
    e.preventDefault()
    fetch('/coffees.json')
      .then(response => response.json())
      .then(coffees => {
        $('#container').html('')
        coffees.forEach(coffee => {
          let newCoffee = new Coffee(coffee)
          let coffeeHtml = newCoffee.formatIndex()
           $('.container').append(coffeeHtml)
        })
      })
  })
}

function Coffee(coffee) {
  this.id = coffee.id
  this.name = coffee.name
  this.process = coffee.process
  this.grind_id = coffee.grind_id
}

Coffee.prototype.formatIndex = function(){
  let coffeeHtml = `
    <a href="/coffees/${this.id}"<h1>${this.name}</h1></a>
  `
  return coffeeHtml

}