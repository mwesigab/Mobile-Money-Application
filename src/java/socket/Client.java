/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package socket;
/**
 *
 * @author BENNY
 */
import java.io.*;
import java.net.*;
import java.util.*;



public class Client {
        public static void main(String[] args){
        try{
            Socket cs = new Socket("localhost",6666);
            DataInputStream din = new DataInputStream(cs.getInputStream());
            DataOutputStream dout = new DataOutputStream(cs.getOutputStream());
			
                    System.out.println("Please input your l"
                            + "ogin credentials: ");
		    System.out.println();
		    System.out.print("Username:  ");
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            
            String str = "",str2="";
			
		str=br.readLine();
		dout.writeUTF(str);
		dout.flush();
		str2=din.readUTF();
            System.out.println(str2);
            System.out.println(din.readUTF());
              
             
             Scanner brSwitch = new Scanner(System.in);
        
             int switchSelect=brSwitch.nextInt();
             dout.writeInt(switchSelect);
             
             String info=din.readUTF();
             System.out.println(info);
             
             //Enter customer's phone number
             Scanner phone = new Scanner(System.in);
             String cuPhoneNumber=phone.nextLine();
             dout.writeUTF(cuPhoneNumber);
             //Enter the amount
             String amountHeading=din.readUTF();
             System.out.println(amountHeading);
             Scanner currency = new Scanner(System.in);
             int amount=currency.nextInt();
             dout.writeInt(amount);
             
             //Display cash and float balance to the user
             String readCash,readFloat="";
             readCash =din.readUTF();
             readFloat = din.readUTF();
             
             System.out.println(readCash);
             System.out.println(readFloat);             
             dout.flush();
             dout.close();         
                          
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
