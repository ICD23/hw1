PROGRAM mytest(input, output, error) ;
# pragma list   off
   //incorrect symbols test
   var a, 0aa, bb: integer;
   var gg, hh, mm, pp, pp@$5: real;
#pragma list on
   //this is a very long comment and includes letter and symbol qwertyui~@%hopasdfghjkl;.,mnbvcxz`1234567890p;mdsf4577846799tj,vsffdfger~!@#$%^&*()POIUYEP{{}_+|_{"?><MZXCVB
#pragma list off
   begin
      str := "This is a srting!!";
      str2 := "  This is a srting,too!!  ";
      str3 := "";
      str4 := "adc""def";
      str4 := "single #  pragma  list on  line string";
#pragma list off
      a := 5 +bb;
   end.   // this is the end of the program
