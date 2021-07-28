function calculate (){
  const itemPrice = document.getElementById("item-price");
  

  itemPrice.addEventListener('keyup', () => {
    const priceCommission = document.getElementById('add-tax-price');
    const priceProfit = document.getElementById('profit');
    const tax = itemPrice.value / 10;
    const commissionValue = parseInt(tax).toLocaleString();
    const profitValue = parseInt(itemPrice.value - tax).toLocaleString();

    priceCommission.innerHTML = `${commissionValue}`;
    priceProfit.innerHTML = `${profitValue}`;
  });
};


window.addEventListener('load', calculate);