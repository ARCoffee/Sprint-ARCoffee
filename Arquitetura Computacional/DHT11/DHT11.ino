#include "DHT.h"
#define dht_type DHT11 //define qual o tipo de sensor DHTxx que se está utilizando
 

int dht_pin = A0;
DHT dht_1 = DHT(dht_pin, dht_type); //pode-se configurar diversos sensores DHTxx
int switch_pin = 7;

void setup() 
{
  Serial.begin(9600);
  dht_1.begin();
  pinMode(switch_pin, INPUT);
}
 
void loop() 
{
  float umidade = dht_1.readHumidity();
  float temperatura = dht_1.readTemperature();
  float umidadeP = (0.4186 *  umidade) - 15.11;
  float temperaturaP = (0.649 * temperatura) + 3.24;

  if (isnan(temperatura) or isnan(umidade)) 
  {
    Serial.print("Erro ao ler o DHT11");
  } 
  else
  {
    Serial.print(umidadeP);
    Serial.print(";");
    Serial.print(temperaturaP);
    Serial.println(";");
   }
 delay(2000);
}
