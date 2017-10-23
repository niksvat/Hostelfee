/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package hostel;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import org.codehaus.jackson.*;
import org.codehaus.jackson.map.ObjectMapper;
/**
 *
 * @author Nikhil
 */
public class check extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
  */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        ObjectMapper ob = new ObjectMapper();
        String text = "false";
        PrintWriter out = response.getWriter();
    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
    response.getWriter().write(text);
      
        //request.getRequestDispatcher("/notvalid.jsp").forward(request,response);
        
        
        //student info = new student();
       // String nik = request.getParameter("info");
        
        
       // ObjectMapper mapper = new ObjectMapper();
   
     //  student stubean = new student();
       
       
      // PrintWriter out = response.getWriter();
       // BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        
     //   String stu = br.readLine();
        //  response.setContentType("text/plain"); 
          ///      response.setCharacterEncoding("UTF-8");
             //   String hello="hew";
               // response.getWriter().write(hello);
            
            
           /* student stubean = (student)mapper.readValue(stu, student.class);
            String rollno = stubean.getRollNo();
            String block = stubean.getBlock();
            String roomno = stubean.getRoomno();
            
            
       
        
        
        
        
        //*********************************************************************************************************************** 
        //Do three things... 1) Student valid or not If valid2)Check if student already assigned a room or not 3)If room is empty or not 
        
        // 0=student not valid
        // 1=already have a room
        // 2=Room already booked
        // 3=Room is free got and get it
        
        
        
        connectionprovider conn = new connectionprovider();
        Connection con = conn.getCon();
        

        
            PreparedStatement st = con.prepareStatement("select * from info where rollno=?");
            st.setString(1, rollno);
            ResultSet rs = st.executeQuery();
            rs.next();
            if(rs.next()==false){ //means not present not valid
                
                
                response.setContentType("text/plain"); 
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("0");
                
            }else{
                  response.setContentType("text/plain"); 
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("1");
            }
            response.getWriter().write("Hello");
          // request.getRequestDispatcher("/notvalid.jsp").forward(request,response);
        
        
        
  
        
        
        //IF 
          /*String text = "false";
        PrintWriter out = response.getWriter();
    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
    response.getWriter().write(text);
        
        
        
        }catch(Exception e){
            e.printStackTrace();
        }
        */
        
        
       
        
        
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
             
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
