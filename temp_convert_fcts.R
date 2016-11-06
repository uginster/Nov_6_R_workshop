# converting fahrenheit ot Kelvin
fah_to_kelvin <- function(temp) {
  kelvin <- ((temp-32)*(5/9)) + 273.15
  return(kelvin)
}


# converting Kelvin to Celsius
kel_to_cel <- function(temp) {
  celsius <- temp-273.15
  return(celsius)
}


# functions to convert "fah_to_celsius"
fah_to_celsius <- function(temp){
  celsius = (temp-32)*5/9
  return(celsius)
}


fah_to_celsius_2 <- function(temp){
  temp_k <- fah_to_kelvin(temp)
  result <- kel_to_cel(temp_k)
  return(result)
}
