function commission() {
  const price = document.getElementById("item-price");
  const fee = Math.floor(price.value * 0.10);
  const TaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  TaxPrice.innerHTML = fee;
  profit.innerHTML = price.value - fee;
}

setInterval(commission, 1000);