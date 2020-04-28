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
import java.sql.*;
import java.util.Date;

import java.lang.*;

class Server {
        public static void main(String[] args){
        try{
            ServerSocket ss = new ServerSocket(6666);
            Socket s = ss.accept();//establises a connection
            
            DataInputStream din = new DataInputStream(s.getInputStream());
            DataOutputStream dout = new DataOutputStream(s.getOutputStream());
            
            String username="",name="",kioskName="",agentNo="",kioskPhoneNo="",
                  dateAndTime="",transacType="",carrierNetwork="";
		  
             username=din.readUTF();
             System.out.println(username+" is requesting login");
			   
			   //create a database connection
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mobile_money","root","");
                  Statement stmt = con.createStatement();
                             
                String selectstr ="select * from kiosk WHERE attendant_username='"+username+"'";                            
			  
                ResultSet rs = stmt.executeQuery(selectstr);	   
                           
			   while(rs.next()){                                
                               name=rs.getString("attendant_username");
                               kioskName=rs.getString("kiosk_name");
                               agentNo = rs.getString("kiosk_phone_number");
                           }
               rs.close();
                if(name.equals(username)){
		 dout.writeUTF("Welcome to Jack's mobile money system "
                   +name+"\n\n");

                     dout.writeUTF("1. Withdraw\n2. Deposit\n3. Check Balance\n4. Exit"
                     +"\n\nSelect an option from the menu");
                      DataInputStream dis = new DataInputStream(s.getInputStream());
                      int switchSelect=dis.readInt();
                                   
                      switch (switchSelect) {
                      case 1:
                         {
                            
                           dout.writeUTF("\n\n                  WITHDRAW                    \n"
                            + "-----------------------------------------------------------\n"
                            + "Please input the customer's phone number");
                            String phoneNumber=din.readUTF();
                            System.out.println(phoneNumber);
                            dout.writeUTF("\nPlease input the amount you want to withdraw");
                            int amount=din.readInt();
                            System.out.println(amount);
                            
                            transacType="withdraw";
                            Date dT = new Date();
                            dateAndTime = dT.toString();
                            
                        if(phoneNumber.startsWith("070")||phoneNumber.startsWith("075")){
                            carrierNetwork="airtel";
                            String airtelWithdraw="SELECT airtel_cash from kiosk WHERE attendant_username='"+username+"'";
                            ResultSet withdraw =stmt.executeQuery(airtelWithdraw);
                            int dbCash=0;                       
                             while(withdraw.next()){
                             dbCash=withdraw.getInt("airtel_cash");
                             dbCash=dbCash-amount; 
                                                                                                             
                             }
                             //update the cash
                             String updateCash="UPDATE kiosk SET airtel_cash='"+dbCash+"' WHERE kiosk_name='"+kioskName+"'";
                             stmt.executeUpdate(updateCash);
                             dout.writeUTF("Your current Airtel cash is "+dbCash);                             
                           
                              //update the float plus the commission
                             String getFloat="select airtel_float from kiosk where attendant_username='"+username+"'";
                              withdraw = stmt.executeQuery(getFloat);
                             int dbFloat=0;                      
                             while(withdraw.next()){
                             dbFloat = withdraw.getInt("airtel_float");
                             dbFloat+=amount;                                                       
                              }
                             
                int commission=0;
                      if(amount<=2500){
                        commission =100;
                      }else if(amount>2500 && amount<=5000){
                        commission =125;
                      }else if(amount>5000 && amount<=15000){
                        commission =450;
                        dbFloat+=commission;                                
                      }else if(amount>15000 && amount<=30000){
                        commission =500;                               
                      }else if(amount>30000 && amount <=45000){
                      commission =525;                                    
                      }else if(amount>45000 && amount<=60000){
                      commission =575;                               
                      }else if(amount>60000 && amount <=125000){
                      commission =700;                             
                       }else if(amount>125000 && amount<=250000){
                       commission =1300;                                
                       }else if(amount>250000 && amount<=500000){
                         commission =2600;                               
                        }else if(amount>500000 && amount<=1000000){
                         commission =5000;                                
                       }else if(amount>1000000 && amount<=2000000){
                       commission =7500;                                
                       }else if(amount>2000000 && amount<=4000000){
                       commission =12500;                                
                       }else if(amount>4000000 && amount<=5000000){
                        commission =15000;                              
                  }
                 //get commission and update it
                int comm=0;
                
                String getCommission="select * from airtel_commission  WHERE kiosk_name='"+kioskName+"'";
                withdraw = stmt.executeQuery(getCommission);
                String kName="";
                while(withdraw.next()){
                    comm=withdraw.getInt("commission");
                    kName=withdraw.getString("kiosk_name");
                }
                
                
                if(kName.isEmpty()){
                   comm+=commission;
                 stmt.executeUpdate("INSERT INTO `airtel_commission`(kiosk_name,commission) VALUE ('"+kioskName+"','"+comm+"')");
                 System.out.println("Your current commission is "+comm);
                }else{
                comm+=commission;
                String updateComm="UPDATE airtel_commission SET kiosk_name='"+kioskName+"',commission='"+comm+"' WHERE kiosk_name='"+kioskName+"'";
                stmt.executeUpdate(updateComm); 
                System.out.println("Your current commission is "+comm);
                comm=0;
               }                              
                
                //update float
                System.out.println(dbFloat);       
                String updateFloat="UPDATE kiosk SET airtel_float='"+dbFloat+"' WHERE attendant_username='"+username+"'";
                stmt.executeUpdate(updateFloat);
                dout.writeUTF("Your current airtel Float is "+dbFloat);
                
                // insert the records of transactions into the transaction table
                stmt.executeUpdate("INSERT INTO `transaction`(transaction_type,date_and_time,amount,kiosk_phone_number,customer_phone_number,carrier_network,comitted_by)"
                        + " VALUES ('"+transacType+"','"+dateAndTime+"','"+amount+"','"+agentNo+"','"+phoneNumber+"','"+carrierNetwork+"','"+username+"')");             
                 withdraw.close();
                 
             }else if(phoneNumber.startsWith("077")||phoneNumber.startsWith("078")){
                 carrierNetwork="mtn";
                      
                      String mtnWithdraw="select mtn_cash from kiosk where attendant_username='"+username+"'";
                      ResultSet withdrawMtn = stmt.executeQuery(mtnWithdraw);
                        int dbCash=0;
                        while(withdrawMtn.next()){
                         dbCash=withdrawMtn.getInt("mtn_cash");
                         dbCash-=amount;
                                       
                                   }
                       //Update mtn cash
                             String updateCash="UPDATE kiosk SET mtn_cash="+dbCash+" WHERE attendant_username='"+username+"'";
                             stmt.executeUpdate(updateCash);
                             dout.writeUTF("Your current Mtn cash is "+dbCash); 
                      // Update mtn float
                      
                             String getFloat="select mtn_float from kiosk where attendant_username='"+username+"'";
                             withdrawMtn = stmt.executeQuery(getFloat);
                             int dbFloat=0;                      
                             while(withdrawMtn.next()){
                             dbFloat = withdrawMtn.getInt("mtn_float");
                             dbFloat+=amount;
                                                       
                              }

                             
                int commission=0;
                      if(amount<=2500){
                        commission =100;
                      }else if(amount>2500 && amount<=5000){
                        commission =125;
                      }else if(amount>5000 && amount<=15000){
                        commission =450;                               
                      }else if(amount>15000 && amount<=30000){
                        commission =500;                              
                      }else if(amount>30000 && amount <=45000){
                      commission =525;                                    
                      }else if(amount>45000 && amount<=60000){
                      commission =575;                                
                      }else if(amount>60000 && amount <=125000){
                      commission =700;                             
                       }else if(amount>125000 && amount<=250000){
                       commission =1300;                               
                       }else if(amount>250000 && amount<=500000){
                         commission =2600;                               
                        }else if(amount>500000 && amount<=1000000){
                         commission =5000;                               
                       }else if(amount>1000000 && amount<=2000000){
                       commission =7500;                                
                       }else if(amount>2000000 && amount<=4000000){
                       commission =12500;                                
                       }   

                 //get mtn commission and update it
                int comm=0;
                
                String getCommission="select * from mtn_commission  WHERE kiosk_name='"+kioskName+"'";
                withdrawMtn = stmt.executeQuery(getCommission);
                String kName="";
                while(withdrawMtn.next()){
                    comm=withdrawMtn.getInt("commission");
                    kName=withdrawMtn.getString("kiosk_name");
                }
                
                /*the if statement inserts into the commission if the user has not done transactions before
                * while the else parts keeps updating and summing up the commission every time a transaction is made
                */
                if(kName.isEmpty()){
                   comm+=commission;
                 stmt.executeUpdate("INSERT INTO `mtn_commission`(kiosk_name,commission) VALUES ('"+kioskName+"','"+comm+"')");
                 System.out.println("Your current mtn commission is "+comm);
                }else{
                comm+=commission;
                String updateComm="UPDATE mtn_commission SET kiosk_name='"+kioskName+"',commission='"+comm+"' WHERE kiosk_name='"+kioskName+"'";
                stmt.executeUpdate(updateComm); 
                System.out.println("Your current commission is "+comm);
                comm=0;
               }       
                //update and display the current float
               String updateFloat="UPDATE kiosk SET mtn_float="+dbFloat+" WHERE attendant_username='"+username+"'";
               stmt.executeUpdate(updateFloat);
               System.out.println(dbFloat);
               dout.writeUTF(" Your current Mtn float is "+dbFloat);   
               
        // insert the records of transactions into the transaction table
        stmt.executeUpdate("INSERT INTO `transaction`(transaction_type,date_and_time,amount,kiosk_phone_number,customer_phone_number,carrier_network,comitted_by)"
         + " VALUES ('"+transacType+"','"+dateAndTime+"','"+amount+"','"+agentNo+"','"+phoneNumber+"','"+carrierNetwork+"','"+username+"')");                 
  withdrawMtn.close();
                              
}else if(phoneNumber.startsWith("1")){
                 dout.writeUTF("Please input a valid phone number");
               }
                break;
            }
           case 2:
            {
             dout.writeUTF("\n\n                  DEPOSIT                     \n"
              + "-----------------------------------------------------------\n"
                + "Please input the customer's phone number");
              String phoneNumber=din.readUTF();
              System.out.println(phoneNumber);
              dout.writeUTF("\nPlease input the amount you want to deposit");
              int amount=din.readInt();
              System.out.println(amount);
              
              transacType="deposit";
              Date dT = new Date();
              dateAndTime = dT.toString();
              
          if(phoneNumber.startsWith("070")||phoneNumber.startsWith("075")){
              carrierNetwork="airtel";
              String airtelDeposit="select airtel_float from kiosk WHERE attendant_username='"+username+"'";
              ResultSet deposit =stmt.executeQuery(airtelDeposit);
                                                 
              // get airtel float from the DB, deduct from it and send updated float to the DB
              int dbFloat=0;
              while(deposit.next()){
              dbFloat=deposit.getInt("airtel_float");
              dbFloat=dbFloat-amount;                                                         
               }

            // add to the current cash plus the commission for the transaction
            
            String getCash="select airtel_cash from kiosk WHERE attendant_username='"+username+"'";
            deposit = stmt.executeQuery(getCash);
            int dbCash=0;                               
            while(deposit.next()){
            dbCash=deposit.getInt("airtel_cash");
            dbCash = dbCash+amount;                                  
              }
            
                          
                int commission=0;
                      if(amount>=500 && amount<=2500){
                        commission =150;
                      }
                       else if(amount>5000 && amount<=60000){
                        commission =285;                               
                      }else if(amount>60000 && amount <=125000){
                       commission =440;                              
                       }else if(amount>125000 && amount<=250000){
                       commission =520;                               
                       }else if(amount>250000 && amount<=500000){
                         commission =850;                               
                        }else if(amount>500000 && amount<=1000000){
                         commission =2500;                                
                       }else if(amount>1000000 && amount<=2000000){
                       commission =4500;                                
                       }else if(amount>2000000 && amount<=4000000){
                       commission =8000;                               
                       }else if(amount>4000000 && amount<=5000000){
                        commission =9000;                              
                  }
                 //get commission and update it
                int comm=0;
                
                String getCommission="select * from airtel_commission  WHERE kiosk_name='"+kioskName+"'";
                deposit = stmt.executeQuery(getCommission);
                String kName="";
                while(deposit.next()){
                    comm=deposit.getInt("commission");
                    kName=deposit.getString("kiosk_name");
                }
                
                
                if(kName.isEmpty()){
                   comm+=commission;
                 stmt.executeUpdate("INSERT INTO `airtel_commission`(kiosk_name,commission) VALUE ('"+kioskName+"','"+comm+"')");
                 System.out.println("Your current commission is "+comm);
                }else{
                comm+=commission;
                String updateComm="UPDATE airtel_commission SET kiosk_name='"+kioskName+"',commission='"+comm+"' WHERE kiosk_name='"+kioskName+"'";
                stmt.executeUpdate(updateComm); 
                System.out.println("Your current commission is "+comm);
                comm=0;
               }                           
                                
            //update the airtel current cash
           // String updateCash="UPDATE kiosk SET airtel_float='"+dbCash+"' WHERE attendant_username='"+username+"'";
            String updateCash="UPDATE kiosk SET airtel_float='"+dbCash+"' WHERE Kiosk_name='"+kioskName+"'";
            stmt.executeUpdate(updateCash);
            dout.writeUTF("Your current cash is "+dbCash);
            
            //update the float
              String updateFloat="UPDATE kiosk SET airtel_float='"+dbFloat+"' WHERE attendant_username='"+username+"'";
              stmt.executeUpdate(updateFloat);
              dout.writeUTF("Your current Airtel float is "+dbFloat);
              
          // insert the records of transactions into the transaction table
          stmt.executeUpdate("INSERT INTO `transaction`(transaction_type,date_and_time,amount,kiosk_phone_number,customer_phone_number,carrier_network,comitted_by)"
           + " VALUES ('"+transacType+"','"+dateAndTime+"','"+amount+"','"+agentNo+"','"+phoneNumber+"','"+carrierNetwork+"','"+username+"')");               
                                            
            deposit.close();
      }else if(phoneNumber.startsWith("077")||phoneNumber.startsWith("078")){
          carrierNetwork="mtn";
            String mtnDeposit="select mtn_float from kiosk WHERE attendant_username='"+username+"'";
            ResultSet depositMtn =stmt.executeQuery(mtnDeposit);
         //Mtn deposit transaction    
            int dbFloat=0;
             while(depositMtn.next()){
             dbFloat=depositMtn.getInt("mtn_float");
             dbFloat=dbFloat-amount;

               }
             
                int commission=0;
                      if(amount>=500 && amount<=5000){
                        commission =0;
                      }else if(amount>5000 && amount<=60000){
                        commission =285;                                
                      }else if(amount>60000 && amount <=125000){
                      commission =440;                              
                       }else if(amount>125000 && amount<=250000){
                       commission =520;                                
                       }else if(amount>250000 && amount<=500000){
                         commission =850;                                
                        }else if(amount>500000 && amount<=1000000){
                         commission =2500;                                
                       }else if(amount>1000000 && amount<=2000000){
                       commission =4500;                                
                       }else if(amount>2000000 && amount<=4000000){
                       commission =8000;
                       dbFloat+=commission;                                
                       }else if(amount>4000000 || amount<500){
                        System.out.println("You cannot deposit money less than 500 or greater than 4000000 "
                                + "Uganda Shillings ");                               
                  }             
             

                 //get mtn commission and update it
                int comm=0;
                
                String getCommission="select * from mtn_commission  WHERE kiosk_name='"+kioskName+"'";
                depositMtn = stmt.executeQuery(getCommission);
                String kName="";
                while(depositMtn.next()){
                    comm=depositMtn.getInt("commission");
                    kName=depositMtn.getString("kiosk_name");
                }
                
                /*the if statement inserts into the commission if the user has not done transactions before
                * while the else parts keeps updating and summing up the commission every time a transaction is made
                */
                if(kName.isEmpty()){
                   comm+=commission;
                 stmt.executeUpdate("INSERT INTO `mtn_commission`(kiosk_name,commission) VALUES ('"+kioskName+"','"+comm+"')");
                 System.out.println("Your current mtn commission is "+comm);
                }else{
                comm+=commission;
                String updateComm="UPDATE mtn_commission SET kiosk_name='"+kioskName+"',commission='"+comm+"' WHERE kiosk_name='"+kioskName+"'";
                stmt.executeUpdate(updateComm); 
                System.out.println("Your current commission is "+comm);
                comm=0;
               }                             
             
        //Mtn float update
             String updateFloat="UPDATE kiosk SET mtn_float='"+dbFloat+"' WHERE attendant_username='"+username+"'";
             stmt.executeUpdate(updateFloat);
             dout.writeUTF("Your transaction has been completed"+"\n\n"+"Your current mtn float is "+dbFloat);
             
            String getCash="select mtn_cash from kiosk WHERE attendant_username='"+username+"'";
            depositMtn = stmt.executeQuery(getCash);             
            int dbCash=0;                               
            while(depositMtn.next()){
            dbCash=depositMtn.getInt("mtn_cash");
            dbCash+= amount;                                  
             }
           //Mtn cash update 
            String updateCash = "UPDATE kiosk SET mtn_cash ='"+dbCash+"'WHERE attendant_username='"+username+"'";
            stmt.executeUpdate(updateCash);
            dout.writeUTF("Your current Mtn cash is "+dbCash);            
            
            // insert the records of transactions into the transaction table
            stmt.executeUpdate("INSERT INTO `transaction`(transaction_type,date_and_time,amount,kiosk_phone_number,customer_phone_number,carrier_network,comitted_by)"
             + " VALUES ('"+transacType+"','"+dateAndTime+"','"+amount+"','"+agentNo+"','"+phoneNumber+"','"+carrierNetwork+"','"+username+"')");             
                                            
       depositMtn.close();
     }else if(phoneNumber.startsWith("1")){
             dout.writeUTF("Please input a valid phone number");
           }
        break;                                           }
                                   //Code for checking balance goes here
case 3:
     break;
default:
  dout.writeUTF("Please make a valid selection");
  break;
 }

//dis.close();
}else{
   name=null;
                                      
    String err="The username does not exist\n\nPlease try again with a correct username"; 
     dout.writeUTF(err);
   }
	dout.flush();
		
 din.close();
		   
 s.close();
 ss.close();

        }catch(Exception e){
            System.out.println(e);
        }
    }
}
