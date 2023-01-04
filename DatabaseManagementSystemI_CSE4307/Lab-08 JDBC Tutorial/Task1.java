import java.sql.*;

public class Task1
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
            sql="SELECT A_ID FROM TRANSACTIONS";
            System.out.println("Executing the query: " + sql);
            ResultSet rs=stmt.executeQuery(sql);
            int count=0;
            while(rs.next())
            {
                int account=rs.getInt("a_id");
                if(account==45){
                    count++;
                }
            }
            System.out.printf("Total number of transactions under ID 45: %d\n",count);
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