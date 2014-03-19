package chat;

import java.io.*;

public class reader
{
     //public static String read(String path)
     public static String read()
    {
         String temp=" ";
         String path="C://Documents and Settings/Dexterity 101/.netbeans/7.0/apache-tomcat-7.0.14.0_base/webapps/chathistory/chat.txt";
        try
       {
         // openning file via constructor
         FileInputStream fin = new FileInputStream(path);
      
         //reading job
              int x;
               byte arr[] = new byte[512]; 
            while((x= fin.read(arr)) != -1)
         {
           temp = new String(arr,0,x);
        }

          // close the file
           fin.close();
        }
        catch(IOException ex)
        {
	System.out.println("Error :" + ex);
         }
         finally
        {
	            return temp;
        }
    }
}