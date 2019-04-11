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
    		console.log(beer)
    	})

      })
   })
}
