const int oneEnd = 2; 
const int otherEnd = 3; 
int ledPin = 13; 

void setup() {
  pinMode(oneEnd, OUTPUT); 
  pinMode(otherEnd, OUTPUT); 
  pinMode(ledPin, OUTPUT); 
  // baud rate of openBCI
  Serial.begin(115200);
  
}

void loop() {
  if (Serial.available()){
    char val = (char)Serial.read();
  }
  // if openBCI sends a '$' command
  // set pin 2 high and pin 3 low 
  // turn on onboard LED to indicate command received 
  if (val == '$'){               
    digitalWrite(ledPin, HIGH); 
    digitalWrite(oneEnd, HIGH); 
    digitalWrite(otherEnd, LOW); 
  }
  else{
    digitalWrite(ledPin, LOW); 
    digitalWrite(oneEnd, LOW); 
    digitalWrite(otherEnd, HIGH); 
  }
 delay(10); 

}




