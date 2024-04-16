import Foundation

class CuentaBancaria{
  var saldo: Double
  var numeroTarjeta: String
  var pin: Int
  var fechaVenciomiento: Int

  init(saldoInicial: Double, numeroTarjeta: String, pin: Int, fechaVenciomiento: Int)
  {
    self.saldo = saldoInicial
    self.numeroTarjeta = numeroTarjeta
    self.pin = pin
    self.fechaVenciomiento = fechaVenciomiento
  }
  
  func esTarjetaValida()-> Bool{
    let añoActual = Calendar.current.component(.year, from: Date())

    if añoActual <= fechaVenciomiento {
      if añoActual == fechaVenciomiento{
        print("Tu tarjeta esta por vencer")
        return true
      }else{
      print("ES UNA TARJETA VALIDA")
        return true}    
    }
    print("TARJETA VENCIDA")
    return false
   // return añoActual <= fechaVenciomiento
  }

  func validarPin(pinIngresado: Int) -> Bool{
    if pinIngresado != pin{
      print("Pin Incorrcto")
      return false
    }
    return true
  }

  func consultarSaldo(pinIngresado: Int) -> Double{
    if validarPin(pinIngresado: pinIngresado){
      if esTarjetaValida(){
        return saldo
      }
    }
    print ("El pin ingresado fue incorrecto")
    return 0.0
  }

  

}

func main(){
 


  
  let cuenta1 = CuentaBancaria(saldoInicial: 1000.0, numeroTarjeta: "123456789", pin: 1234, fechaVenciomiento: 2025)

  //cuenta1.esTarjetaValida()
 let saldo = cuenta1.consultarSaldo(pinIngresado: 1234)
print(saldo)
//  esTarjetaValida(fechaVenciomiento: cuenta1.fechaVenciomiento)

  
}

main()