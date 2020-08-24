window.addEventListener('load', function(){
  var item_price = document.getElementById("item-price")
  var add_tax_price = document.getElementById("add-tax-price")
  var profit = document.getElementById("profit")  

  item_price.addEventListener('keyup', function(){


    add_tax_price.innerHTML = Math.floor(item_price.value * 0.1)
    profit.innerHTML = Math.floor(item_price.value * 0.9)
  })
})