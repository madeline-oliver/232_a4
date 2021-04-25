#' Compute profit from yield
#' 
#' Convert almond yield in tons/year to profit in dollars/ton
#' 
#' @param almond_yield (tons/year)
#' @param year
#' @param price ($/ton)
#' @param discount 
#' 
compute_profit = function(almond_yield, year, price = 5000, discount = 0.12) {
  scen = seq(from=1, to=length(almond_yield))
  yearprofit = data.frame(scen=scen, almond_yield=almond_yield, year=year)
  yearprofit$net = yearprofit$almond_yield*price
  
  yearprofit = yearprofit %>% 
    mutate(net_profit = compute_npv(value=net, time=year-year[1], discount=discount))
  
  return(yearprofit)
}
