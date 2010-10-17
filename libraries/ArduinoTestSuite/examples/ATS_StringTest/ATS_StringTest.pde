//************************************************************************
//*	Arduino String Test
//*		(C) 2010 by Rick Anderson
//*		Open source as per standard Arduino code
//*
//************************************************************************
//*	Oct 16,	2010	<ROA> Started on String Test
//************************************************************************



#ifdef __MWERKS__
#include	"codewarrior.h"
#else
#include	<avr/pgmspace.h>
#endif
#include	<avr/io.h>
#include	"WProgram.h"
#include	"HardwareSerial.h"
#include	"pins_arduino.h"
#include	<ArduinoTestSuite.h>
#include	"avr_cpunames.h"

#if defined(__AVR_ATmega168__) || defined(__AVR_ATmega328P__)
#define	kBoard_PinCount		20
#define	kBoard_AnalogCount	6
#elif defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#define	kBoard_PinCount		70
#define	kBoard_AnalogCount	16
#endif


//************************************************************************
void setup()
{

  short	ii;
  uint8_t	timerNumber;
  char testName[64];

  gYotalErrors	=	0;
  gTestCount		=	0;

  /*
* Test Variable Setup
   */

  String stringOne = String("stringThree = ");
  String stringTwo = String("this string");
  String stringThree = String ();
  char charResult[100];

  Serial.begin(9600);
  delay(1000);

  gTestStartTime	=	millis();
  ATS_PrintTestStart("Arduino", "String Test");


  /*
* Run the tests
   */

  // adding a constant integer to a string:
  stringThree =  stringOne + 123;
  //strcpy(charResult,  "\0");
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("1. Adding a constant integer to a string:", strcmp(charResult,"stringThree = 123" ) == 0);

  // adding a constant long interger to a string:
  stringThree = stringOne + 123456789;
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("2. Adding a constant long interger to a string", strcmp(charResult,"stringThree = 123456789" )  == 0);


  // adding a constant character to a string:
  stringThree =  stringOne + 'A';
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("3. Adding a constant character to a string", strcmp(charResult,"stringThree = A" ) == 0);


  // adding a constant string to a string:
  stringThree =  stringOne +  "abc";
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("4. Adding a constant string variable to a string", strcmp(charResult,"stringThree = abc" )  == 0);

  //"5. Adding a constant long interger to a string"
  stringThree = stringOne + stringTwo;
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("5. Adding a constant long interger to a string", strcmp(charResult,"stringThree = this string" )  == 0);


  /*
* setup up String Comparison Operater Tests
   */

  stringOne = String("this");
  stringTwo = String("that");

  // two strings equal:
  ATS_PrintTestStatus("6. Two strings equal",stringOne == "this");

  // two strings not equal:
  ATS_PrintTestStatus("7. Two strings not equal",stringOne != stringTwo);

  // two strings not equal (case sensitivity matters):
  stringOne = "This";
  stringTwo = "this";
  ATS_PrintTestStatus("8. Two strings not equal [case sensitivity matters]", stringOne != stringTwo);

  // you can also use equals() to see if two strings are the same:
  stringOne = "this";
  stringTwo = "this";
  ATS_PrintTestStatus("9. Equals() method equals", stringOne.equals(stringTwo));


  // you can also use not equals() to see if two strings are not the same:
  stringOne = String("This");
  stringTwo = String("this");
  ATS_PrintTestStatus("10. Not equals() method equals", !stringOne.equals(stringTwo));

  // or perhaps you want to ignore case:
  ATS_PrintTestStatus("11.  EqualsIgnoreCase() method equals", stringOne.equalsIgnoreCase(stringTwo));

  // a numeric string compared to the number it represents:
  stringOne = "1";
  int numberOne = 1;
  ATS_PrintTestStatus("12.  A numeric string compared to the number it represents", stringOne == numberOne);

  // two numeric strings compared:
  stringOne = "2";
  stringTwo = "1";
  ATS_PrintTestStatus("13.  Two numeric strings compared",stringOne >= stringTwo);


  // comparison operators can be used to compare strings for alphabetic sorting too:


  stringOne = String("Brown");
  // ATS_PrintTestStatus("14.  comparison operator < can be used to compare strings for alphabetic sorting ",stringOne < "Charles");
  //  ATS_PrintTestStatus("15.  comparison operator > can be used to compare strings for alphabetic sorting ",stringOne > "Adams");
  //  ATS_PrintTestStatus("16.  comparison operator <= can be used to compare strings for alphabetic sorting ",stringOne <= "Browne");
  //  ATS_PrintTestStatus("17.  comparison operator >= can be used to compare strings for alphabetic sorting ",stringOne >= "Brow");



  // the compareTo() operator also allows you to compare strings
  stringOne = "Cucumber";
  stringTwo = "Cucuracha";

  ATS_PrintTestStatus("18.  The compareTo() operator also allows you to compare strings", stringOne.compareTo(stringTwo) < 0);

  // compareTo() String with numnber > String with number:
  stringOne = "Sensor: 50";
  stringTwo=  "Sensor: 150";
  ATS_PrintTestStatus("19.  The compareTo() String with integers", stringOne.compareTo(stringTwo) < 0);

  // compareTo() String with numnber > String with number append integer, matches example code:
  stringOne = "Sensor: ";
  stringTwo=  "Sensor: ";
  stringOne += 50;
  stringTwo += 150;
  ATS_PrintTestStatus("20.  The compareTo()  compare strings with appended integers", stringOne.compareTo(stringTwo) < 0);


  /*
* setup up String Append Operation Tests
   */
  // Serious awful problem here
  stringOne = String("Sensor ");
  stringTwo = String("value");

  stringOne += stringTwo;
  // ATS_PrintTestStatus("N. Adding string to string += ",(strcmp(charResult,"Sensor value" )  == 0));
  //ATS_PrintTestStatus("N. Adding string to string += ", stringOne.equals("Sensor value"));

  ATS_PrintTestStatus("21.  The compareTo()  compare strings with appended integers", stringOne.compareTo(stringTwo) < 0);
  /*
    * Test complete
   */
  ATS_PrintTestEnd();


}


//************************************************************************
void loop()
{


}










