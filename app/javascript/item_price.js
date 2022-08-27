window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  if ( priceInput !== null ){
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const Tax = Math.floor(inputValue * 0.1);
      const addBenefitDom = document.getElementById("profit");
      
      addTaxDom.innerHTML = Tax
      addBenefitDom.innerHTML = inputValue - Tax
    })
  }
})