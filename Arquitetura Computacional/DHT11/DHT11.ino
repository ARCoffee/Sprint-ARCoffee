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
  /**
   * Bloco do DHT11
   */
  float umidade = dht_1.readHumidity();
  float temperatura = dht_1.readTemperature();
  float umidadeP = (0.649 *umidade) + 3.24;
  float temperaturaP = (0.4186 * temperatura ) - 15.11;

  if (isnan(temperatura) or isnan(umidade)) 
  {
    Serial.println("Erro ao ler o DHT");
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
