

//////////////////////////////////////////////////////////////
//
// This class creates and manages the messaging to the arduino pins 
//
// Any mention of Hex Bug should be considered legacy and evidence
// that Joel has not updated this class to consider the change.
// 
// 
//
// Created: Chip Audette, May-June 2014
// Modified: Joel Murphy, July 2016
// Modified: Xin Wen, May-June 2017
//
///////////////////////////////////////////////////////////////

class Direction { 
 
  
  class Command {
    private String command_str;
    private String variable_str;
    private String name;
    private int counter;
    private Serial serial_h;
    public boolean printReceivedCommand = true;
//    public int ID;
    
    Command(Serial _serial_h, String _str, String _name, int _ID) {  // String _var,
      serial_h = _serial_h;
      command_str = _str;
      name =_name;
      counter = 0;
    }
    
    public void issue() {
      counter++;
      if (printReceivedCommand) {
        println("Direction: Command: " + name + " (" + counter + ")");
        }
        // println("A");  // verbose debug
      if (serial_h != null) serial_h.write(command_str);
        // println("B");  // verbose debug
    }
  
  } //close definition of class Command
      
  private Command command_switchDirection;//, // switch direction command
                   
  private int counter = 0;

  //Constructor, pass in an already-opened serial port
  Direction(Serial serialPort) { 
    // empty
  }

  public void switchDirection() {
      counter++;
      println("Command: Switch Direction");
      direction_serial.write('$');
      while(direction_serial.available() > 0){ // hang and wait
        print(char(direction_serial.read()));  // for the handshake
      }

  }
  

}
