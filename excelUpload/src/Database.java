
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Random;

import Log.Log;

public class Database {
	String url;
	String user;
	String password;
	Connection con;
	Statement stmt;
	public Database() throws Exception{
		Setting.Loadsetting();
		url=Setting.databaseUrl;
		password=Setting.databasePassword;
		user=Setting.databaseUserName;
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			con = DriverManager.getConnection(url, user, password);
			//this is important
			con.setAutoCommit(false);
			stmt = con.createStatement();
			ResultSet resultSet=stmt.executeQuery("select * from gigadb_user");
//			int i=1;
//			while(resultSet.next())
//				System.out.println(resultSet.getString(4));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Database(String url, String user, String password) throws SQLException {
		// TODO Auto-generated constructor stub
		this.url = url;
		this.user = user;
		this.password = password;
		// ���斤���������拷���斤����
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url, user, password); // 使������拷SQL-SERVER2000���斤������
			stmt = con.createStatement();
			stmt.execute("selcet * from submitter");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean exist(String tableName,String field,String value) throws SQLException{
		String query="select null from "+tableName+" where "+
			field+" = '"+value+"';";
		ResultSet resultSet=stmt.executeQuery(query);
		if(resultSet.next()){
			return true;
		}
		return false;
	}
	public ResultSet getResultSet(String query) throws SQLException{
		return stmt.executeQuery(query);
	}
	//assign new doi
	public String assigndoi() throws SQLException
	{
		String query="select max(identifier) from dataset";
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString("max");
		}
		String[] ss= new String[2];
		ss=query.split("/");
		int newpart= Integer.parseInt(ss[1])+1;
	    String newdoi= "10.5524/"+newpart;
	    boolean result= this.exist("reserved_dataset", "identifier", newdoi);
	    while(result) {
	    	newpart=newpart+1;
	    	newdoi= "10.5524/"+newpart;
	    	result= this.exist("reserved_dataset", "identifier", newdoi);
	    } 
		return newdoi;
	}
	
	public void assigndoitest() throws SQLException
	{
		String query="select max(identifier) from dataset";
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString("max");
			System.out.println("SBSBSBS"+ query);
		}
	}
	
	
	public String checkcontain1(String table, String valuename, String value,String getvalue) throws SQLException
	{
		
		String query ="select "+getvalue+" from "+ table +" where "+valuename+"= " + "'" + value + "'";
		System.out.println("query "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		query=null;
		
		while(resultSet.next())
		{
			query= resultSet.getString(getvalue);
			System.out.println("checkcontain result: "+ query);
			
		}
	
		
		return query;

	}
	
	
	public String checkcontain(String table, String valuename, String value,String getvalue) throws SQLException
	{
		
		String query ="select "+getvalue+" from "+ table +" where "+valuename+"= " + value;
		System.out.println("query "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		query=null;
		while(resultSet.next())
		{
			query= resultSet.getString(getvalue);
			System.out.println("checkcontain result: "+ query);
			
		}
		
		return query;

	}
	
	public int getid(String table) throws SQLException
	{
		int newid=0;
		String query="SELECT max(id) from " + table;
	    System.out.println("query "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString("max");
		}
		if(query==null)
			newid=1;
		else
			newid= Integer.valueOf(query)+1;
		
		System.out.println("id number in db "+ newid);
		return newid;

	}
	
	public boolean checkemail(String id) throws SQLException
	{
		String query="select upload_status from dataset where identifier="+"'"+id+"'";
		ResultSet resultSet=stmt.executeQuery(query);
		boolean flag =true;
		while(resultSet.next())
		{
			query= resultSet.getString("upload_status");
			System.out.println(""+ query);
			if(query.equalsIgnoreCase("Published"))
			{
				flag=false;
			}
		}
		
		return flag;
	
	}
	
	
	public ArrayList<String> compare_result_in(String want_name, String tablename, String compare_name, String in_want_name, String in_tablename, String in_compare_name, String value) throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		String query="SELECT "+ want_name+  " from "+ tablename + " WHERE " + compare_name +" IN ( SELECT "+ in_want_name +" from "+ in_tablename + " where "+ in_compare_name +"= "+ value + " )";
		System.out.println("Comparison query: "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString(want_name);
			result.add(query);
		}
		return result;	
	}
	
	
	public ArrayList<String> compare_result_all(String value,String pk, String tablename, String attribute) throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		String query="SELECT "+ attribute+  " from "+ tablename + " WHERE " + tablename+"."+pk+ " =" + "'" + value + "'";
		System.out.println("Comparison query in image: "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString(attribute);
			result.add(query);
		}
		return result;	
	}
	
	
	
	
	
	public ArrayList<String> compare_result(String doi, String tablename, String attribute) throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		String newdoi= "'"+ doi +"'";
		String query="SELECT "+ attribute+  " from "+ tablename + " WHERE " + tablename+".identifier="+newdoi;
		//System.out.println("Comparison query: "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString(attribute);
			result.add(query);
		}
		return result;	
	}
	
	
	public String get_sample(String sample_id, String attribute) throws SQLException
	{
		String new_sample_id= "'"+ sample_id +"'";
		String query="SELECT "+attribute+" from sample where sample_id="+ new_sample_id;
		//System.out.println("select sample query: "+ query);
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString(attribute);
		}
		return query;
		
	}
	
	
	public String get_result(String command, String attribute) throws SQLException
	{
		System.out.println("get_result from query: "+ command);
		ResultSet resultSet=stmt.executeQuery(command);
		command=null;
		while(resultSet.next())
		{
			command= resultSet.getString(attribute);
		}
		System.out.println("get_result : "+ command);
		return command;
		
	}
	
	public ArrayList<String> get_result_more(String command, String attribute) throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		System.out.println("get_result_more from query : "+ command);
		ResultSet resultSet=stmt.executeQuery(command);
		command=null;
		while(resultSet.next())
		{
			command= resultSet.getString(attribute);
			result.add(command);
		}
		
		return result;
		
	}
	
	public String get_file_sample_id(String doi, String location) throws SQLException
	{
		String newdoi= "'"+ doi +"'";
		String newlocation="'"+location+"'";
		String query="SELECT sample_id from file where identifier="+newdoi+"and file_location="+newlocation;
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString("sample_id");
		}
		return query;
		
	}
	
	
	public String provideDatastamp(String doi) throws SQLException
	{
		String newdoi= "'"+ doi +"'";
		String query="SELECT max(date_stamp) from file WHERE file.identifier="+newdoi;
		ResultSet resultSet=stmt.executeQuery(query);
		while(resultSet.next())
		{
			query= resultSet.getString("max");
		}
		return query;
		
		
	}
	
	// to dertermine if a record exists.
	public boolean exist(Table table,int index) throws SQLException{
		String query="select null from "+table.name+table.updateWhereClause(index);
		ResultSet resultSet=stmt.executeQuery(query);
		if(resultSet.next()){
			return true;
		}
		return false;
	}
	// to dertermine if a record exists, all attributes should equal
	public boolean completeExist(Table table,int index) throws SQLException{
		String query="select null from "+table.name+table.completeWhereClause(index);
		System.out.println(query);
		ResultSet resultSet=stmt.executeQuery(query);
		if(resultSet.next()){
			return true;
		}
		return false;
	}
	// to dertermine if a record exists.
	public boolean niexist(Table table,int index) throws SQLException{
		String query="select null from "+table.name+table.niWhereClause(index);
		ResultSet resultSet=stmt.executeQuery(query);
		if(resultSet.next()){
			return true;
		}
		return false;
	}
//	public Table getTable(String tableName){
//		
//	}
//	public Object get(String table,String field,String value) throws SQLException{
//		String query="select null from "+table+" where "+
//			field+" = '"+value+"';";
//		ResultSet resultSet=stmt.executeQuery(query);
//		if(resultSet.next()){
//			return true;
//		}
//		return false;
//	}
	public long execute(ArrayList<String> stmtList) throws SQLException, IOException {
//		stmt.execute("begin;");
//		String rollBack="rollback;";
		long startTime=System.currentTimeMillis();
		for(String s:stmtList){
			try{
				stmt.execute(s);
			}
			catch (Exception e) {
//				stmt.execute(rollBack);
				// TODO: handle exception
				Excel2Database.excel2DBLog.writeLine("**************************");
				Excel2Database.excel2DBLog.writeLine("SQL statement: "+s);
				e.printStackTrace(Excel2Database.excel2DBLog.printWriter);
//				System.out.println(stmts[i]);
				Excel2Database.excel2DBLog.writeLine(e.toString());
				Excel2Database.excel2DBLog.writeLine("**************************");
				throw new SQLException(e);
			}
		}
		long endTime=System.currentTimeMillis();
		long time=endTime-startTime;
		System.out.println("execution time: "+ time);
//		stmt.execute("commit;");
		return time;
	}
	public void execute(String s) throws SQLException, IOException {
//		stmt.execute("begin;");
//		String rollBack="rollback;";
			try{
				stmt.execute(s);
			}
			catch (Exception e) {
//				stmt.execute(rollBack);
				// TODO: handle exception
				Excel2Database.excel2DBLog.writeLine("**************************");
				Excel2Database.excel2DBLog.writeLine(s);
				Excel2Database.excel2DBLog.writeLine(e.toString());
				Excel2Database.excel2DBLog.writeLine("**************************");
				throw new SQLException(e);
			}
//		stmt.execute("commit;");
	}
	public static void main(String[] args) throws Exception {
		Database database = new Database();			
//		database.calPhraseProb();
//		System.out.println(database.exist("1.5524/100003"));
	}


}
