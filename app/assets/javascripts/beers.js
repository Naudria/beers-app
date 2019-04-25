$(bindClickHanders)

function bindClickHanders () {
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
      $('.comment_box').html('')
    let id = $(this).attr('data-id')
    fetch(`/beers/${id}.json`)
    .then(res => res.json())
    .then(beer => {
     let newBeer = new Beer(beer)
      let beerHtml = newBeer.formatShow()
      $('#app-container').append(beerHtml)
      beer.comments.forEach(comment => {

      let beerComment = new Comment(comment)
      let commentHtml = beerComment.renderComments()
      // $('#app-container').append(commentHtml)
      $(commentHtml).appendTo($('#app-container'))
    
    })
   })
  })
  
  

$(document).on('click', '.next-beer', function(e) {
    e.preventDefault()
    console.log('Prevented!')
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    fetch(`/beers/${id}/next.json`)
    .then(res => res.json())
    .then(beer => {
      let newBeer = new Beer(beer)
      let beerHtml = newBeer.formatShow()
      $('#app-container').append(beerHtml)
    beer.comments.forEach(comment => {

      let beerComment = new Comment(comment)
      let commentHtml = beerComment.renderComments()
      // $('#app-container').append(commentHtml)
      $(commentHtml).appendTo($('#app-container'))
    
    })
   })
  })
}




// $(document).on('click', '.show-comments', function(e) {
// e.preventDefault()
//     console.log("Prevented!")
//     $(".comment_box").remove();
//     let id = $(this).attr('data-id')
//     fetch(`/beers/${id}/comments.json`)
//     .then(res => res.json())
//     .then(comments =>  { 
//      //console.log(JSON.stringify(comments))
//      comments.forEach(comment => {
//       let beerComment = new Comment(comment)
//       let commentHtml = beerComment.renderComments()
//       $('#app-container').append(commentHtml)
//     })
//    })
//   })
// }

$(function() {
  //Listen for submission of the form
  $("#beer_form").submit(function(e) {
    e.preventDefault();
    console.log("Prevented!")
    $('#app-container').html('')
    // let action = $(this).attr('action');
    let action = this.action;
    let method = $(this).attr('method');
    let beer_name = $(this).find('#beer_name').val();
    let data = $(this).serializeArray();
     $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'json'
    })

    .done(function(result){
      console.log(result)
      let newBeer = new Beer(result)
      let beerHtml = newBeer.formatShow()
      $('#app-container').append(beerHtml)
      $("#beer_form").hide();
    })
   .catch(function(result){
      return alert('Error!')
       })
   
  })
})

 // JS model object / constructor function for Beer
function Beer(beer) {
  this.id = beer.id
  this.name = beer.name
  this.brewery = beer.brewery
  this.abv = beer.abv
  this.review = beer.review
  this.comments = beer.comments

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
  <button data-id="${this.id}" class="next-beer">Next</button>
  </div>
  `
  return beerHtml

}

// JS model object / constructor function for Comment
function Comment(comment) {
  this.id = comment.id
  this.content = comment.content
  this.user = comment.username
   
}

Comment.prototype.renderComments = function(){
  let commentHtml = `
  <div class="comment_box">
  <p><span class="small_caps">${this.user}:</span> ${this.content}</p>
  </div>
  `
  return commentHtml
}





