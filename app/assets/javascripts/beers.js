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
    		console.log(newBeer)
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
