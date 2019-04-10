$(() => {
	bindClickHanders()
})

const bindClickHanders = () => {
	$('.all_beers').on('click', (e) => {
    e.preventDefault()
    console.log("hello")
  })
}
