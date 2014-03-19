package chat;

import java.io.*;

public class writer
{
  byte ref[]; 
  String path;
  public writer(String val )
  {  
     this.path = "C://Documents and Settings/Dexterity 101/.netbeans/7.0/apache-tomcat-7.0.14.0_base/webapps/chathistory/chat.txt" ;
     write(val);
  }
   final void write(String val)
  {
      Integer n1 = 13;
      Integer n2 = 10;
       try
      {
         RandomAccessFile file = new RandomAccessFile(path,"rw");   
         long len = file.length();
         if(len != 0)
         {
             file.seek(len+1); 
             file.writeBytes(" <BR>");
         }
         file.writeBytes(val); 
         file.close(); 
      
      }
      catch(Exception ex)
      {
          System.out.println("Error:- " + ex);
      }
  }
}