$(() => {
	bindClickHanders()
})

const bindClickHanders = () => {
$('.all_beers').on('click', (e) => {
  e.preventDefault()
  history.replaceState(null, null, "/beers")
  fetch(`/beers.json`)
  .then((res) => res.json())
  .then(beers => {
  	$('#app-container').html('')
    	beers.forEach(beer => {
    		let newBeer = new Beer(beer)
    		let beerHtml = newBeer.formatIndex()
        	$('#app-container').append(beerHtml)

      })
   })
})


$(document).on('click',".show_link", function(e) {
    e.preventDefault()
    // clear out app container
      $('#app-container').html('')
    let id = $(this).attr('data-id')
    fetch(`/beers/${id}.json`)
    .then(res => res.json())
    .then(beer => {
     let newBeer = new Beer(beer)
      let beerHtml = newBeer.formatShow()
      $('#app-container').append(beerHtml)
    })
})
}

$(function() {
  //Listen for submission of the form
  $("#beer_form").submit(function(e) {
    e.preventDefault();
    console.log("Prevented!")
    })
})

 // JS model object / constructor function
function Beer(beer) {
  this.id = beer.id
  this.name = beer.name
  this.brewery = beer.brewery
  this.abv = beer.abv
  this.review = beer.review
  this.comments = beer.id.comments
}

//declare prototype methods on the model object 
Beer.prototype.formatIndex = function() {
	let beerHtml = `
  <div class="box">
  <a href="/beers/${this.id}" data-id="${this.id}" class="show_link"><h3>${this.name}</a></h3>
  </div>
  `
  return beerHtml
}

Beer.prototype.formatShow = function(){
  let beerHtml = `
  <div class="box">
  <h3 class="blue small_caps">${this.name}</h3>
    <p> <span class="blue small_caps">Brewery: </span>${this.brewery}</p>
    <p> <span class="blue small_caps">ABV: </span>${this.abv}</p>
    <p><span class="blue small_caps">Review: </span>${this.review}</p>
    <button data-id="${this.id}" class="show-comments">View Comments</button><br />
    
  <button data-id="${this.id}" class="next-beer">Next</button>
  </div>
  `
  return beerHtml

}
