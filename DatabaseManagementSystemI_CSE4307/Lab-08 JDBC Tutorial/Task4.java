import java.sql.*;
import java.util.HashMap;

public class Task4
{
    static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    static final String DB_URL= "jdbc:oracle:thin:@localhost:1521:xe";
    static final String USER="s200042121";
    static final String PASS="cse4308";
    public static void main (String args[])
    {
        Connection conn=null;
        Statement stmt=null;
        try
        {
            Class.forName(JDBC_DRIVER);
            System.out.println("Connecting to database");
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Creating statement");
            stmt=conn.createStatement();
            String sql;
            sql="SELECT A_ID, AMOUNT,TYPE FROM TRANSACTIONS";
            System.out.println("Executing the query: " + sql);
            ResultSet rs=stmt.executeQuery(sql);
            int cip=0,vip=0,op=0;
            HashMap<Integer,Long>totalTransactions=new HashMap<Integer, Long>();
            HashMap<Integer,Long>account_balance=new HashMap<Integer, Long>();
            while(rs.next())
            {
                int ID=rs.getInt("A_ID");
                Long balance=rs.getLong("AMOUNT");
                String type=rs.getString("TYPE");
                if(totalTransactions.get(ID)==null){
                    totalTransactions.put(ID,balance);
                }
                else{
                    totalTransactions.replace(ID,totalTransactions.get(ID)+balance);
                }
                if(account_balance.get(ID)==null){
                    if(type.equals("0")){
                        account_balance.put(ID,-balance);
                    }
                    else{
                        account_balance.put(ID,balance);
                    }
                }
                else{
                    if(type.equals("0")){
                        account_balance.replace(ID,account_balance.get(ID)-balance);
                    }
                    else{
                        account_balance.replace(ID,account_balance.get(ID)+balance);
                    }

                }
            }
            int outside=0;
            for(int i=1;i<=252;i++){
                if(totalTransactions.get(i)>5000000 && account_balance.get(i)>1000000){
                    cip++;
                }
                else if(totalTransactions.get(i)>2500000 && totalTransactions.get(i)<4500000 && account_balance.get(i)>500000 && account_balance.get(i)<900000){
                    vip++;
                }
                else if(totalTransactions.get(i)<1000000 && account_balance.get(i)<100000){
                    op++;
                }
                else{
                    outside++;
                }
            }
            System.out.printf("CIP: %d, VIP: %d, OP: %d, No Category: %d",cip,vip,op,outside);

            rs.close();
            stmt.close();
            conn.close();
        }
        catch(SQLException se)
        {
            se.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}