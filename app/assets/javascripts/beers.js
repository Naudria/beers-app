$(() => {
	bindClickHanders()
})

const bindClickHanders = () => {
$('.all_beers').on('click', (e) => {
  e.preventDefault()
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
}

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
