package com.testexample4;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/Servlet11")
public class Servlet11 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Servlet11(){super(); }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/report","root","password");   
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("select * from MyTable");  
			
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonDataObject;

			while(rs.next()){
				jsonDataObject= new JSONObject();
				jsonDataObject.put("ramUsed",rs.getDouble(1));
				jsonDataObject.put("diskUsed",rs.getDouble(2));
				jsonDataObject.put("cpuUsed",rs.getDouble(3));
				jsonDataObject.put("readDateTime",rs.getString(4));
				jsonArray.put(jsonDataObject);
			}	  
			//System.out.println(jsonArray);
			request.setAttribute("jsonData",jsonArray);
			RequestDispatcher rd=request.getRequestDispatcher("jspfile25.jsp");
			rd.forward(request, response);
			con.close();  
			stmt.close();
			rs.close();
		 }catch(Exception e){ 
				System.out.println(e);
		 }  
	}
}
