 window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    Math.floor(inputValue * 0.1)
    console.log(Math.floor(inputValue * 0.1))
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const addProfit = document.getElementById("profit")
    Math.floor(inputValue - addTaxDom.innerHTML )
    console.log(inputValue - addTaxDom.innerHTML )
    addProfit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML )
  })
 })



