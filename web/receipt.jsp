
<!DOCTYPE html>


<%@ page import="java.sql.*"%>
<%@ page import="hostel.*"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>UIET |  KURUKSHETRA  Payment System</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script src="js/bootstrap.min.js"></script>
<div class="container">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Harsh Bhawan</strong>
                        <br>
                  
                        KURUKSHETRA UNIVERSITY
                        <br>
                        <abbr title="Phone">P:</abbr> (213) 484-6829
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em><p id="date"></p></em>
                    </p>
                    <p>
                        <em> Transaction id: <%=request.getParameter("txnid")%></em>
                    </p>
                </div>
            </div>
            
            <%
            
            
                String roll = request.getParameter("roll");
                //String txnid = request.getParameter("txnid");
                
                String roomno = request.getParameter("room");
                String blockno = request.getParameter("block");
                
                        
                    connectionprovider con = new connectionprovider();
                   Connection conn = con.getCon();
                   PreparedStatement st = conn.prepareStatement("select * from info where rollno=?");
                   st.setString(1, roll);
                   ResultSet rs = st.executeQuery();
                   rs.next();
                   
                   String name = rs.getString("sname");
                   
                   String sem = rs.getString("sem");
                   String email = rs.getString("emailid");
                   
                   
                   
                   



%>
            
            
            
             Name :<%=name%><br></br>
                Course :B.tech<br></br>
                Roll No.  :<%=roll%><br></br>
                Room No. :<%=roomno%><br></br>
                Block No. :<%=blockno%><br>
                Email :<%=email%><br>
            <div class="row">
                <div class="text-center">
                    <h1>Payment Receipt</h1>
                </div>
                </span>
               
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Particulars</th>
                            <th></th>
                            <th></th>
                            <th class="text-center">Rupees</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-9"><em>Admission Fees</em></h4></td>
                            <td></td>
                            <td></td>
                            <td class="col-md-1 text-center">800</td>
                        </tr>
                        <tr>
                            <td class="col-md-9"><em>Security Fees</em></h4></td>
                            <td></td>
                            <td></td>
                            <td class="col-md-1 text-center">700</td>
                        </tr>
                        <tr>
                            <td class="col-md-9"><em>Other Fees</em></h4></td>
                            <td></td>
                            <td></td>
                            <td class="col-md-1 text-center">1500</td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right">
                            <p>
                                <strong>Subtotal: </strong>
                            </p>
                            </td>
                            <td class="text-center">
                            <p>
                                <strong>2500</strong>
                            </p>
                            </td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong>2500</strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>
    <script src="receipt.js"></script>
    </html>