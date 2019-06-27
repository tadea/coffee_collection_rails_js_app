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
          console.log(coffee)
        })
      })
  })
}

function Coffee(id, name, process, grind_id) {
  this.id = id
  this.name = name
  this.process = process
  this.grind_id = grind_id
}
