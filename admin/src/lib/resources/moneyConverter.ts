export function moneyBsConverter(n: number) {
  var formatter = new Intl.NumberFormat('es-VE', {
    style: 'currency',
    currency: "VED",
  });

  let some: string = formatter.format(n)
  return some.replace("VED", "Bs.")
}

export function moneyUsdConverter(n: number) {
  var formatter = new Intl.NumberFormat("en-ES", {
    style: "currency",
    currency: "USD",
  });

  let some: string = formatter.format(n);
  return some.split(/(\s).*/)[0];
}