
<%@ page import="java.security.*"%>
<%@ page import="java.util.*"%>
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

</head>


  <%!
        public boolean empty(String s)
            {
                if(s== null || s.trim().equals(""))
                    return true;
                else
                    return false;
            }
        %>
<%!
            public String hashCal(String type,String str){
                byte[] hashseq=str.getBytes();
                StringBuffer hexString = new StringBuffer();
                try{
                MessageDigest algorithm = MessageDigest.getInstance(type);
                algorithm.reset();
                algorithm.update(hashseq);
                byte messageDigest[] = algorithm.digest();



                for (int i=0;i<messageDigest.length;i++) {
                    String hex=Integer.toHexString(0xFF & messageDigest[i]);
                    if(hex.length()==1) hexString.append("0");
                    hexString.append(hex);
                }

                }catch(NoSuchAlgorithmException nsae){ }

                return hexString.toString();

            }
        %>


<body>
<div class="header">
<div class="container">
<div class="row">
	<div class="col-md-7 col-sm-12">
    	<div class="logo"><a href="index.php" title="University Institute of Engineering & Technology" ><img src="images/logo.png" alt="University Institute of Engineering & Technology"></a></div>
    </div>
    <div class="col-md-5 col-sm-12">
			<div class="contact text-right"><span>Contact us at:</span> 01744-239155</div>
    </div>
    
    </div>
</div>
    
    
    
    
</div><div class="container">
  <div class="page-header">
    <h1 class="text-center">Payment Success</h1>
    <div class="row"> 
    <div class="col-md-8 col-md-offset-2" id="textmiddleid">
    <table class="table table-bordered">
        
        <%

       
        String status = request.getParameter("status");
        String firstname = request.getParameter("firstname");
        
        String blockno = request.getParameter("address1");
        String roomno = request.getParameter("udf1");
      //  String city = request.getParameter("city");
        
        String phone = request.getParameter("phone");
        String zipcode = request.getParameter("zipcode");
        String udf2 = request.getParameter("udf2");//udf2====Roll number


  //        String blockno = request.getParameter("city");
//        String roomno = request.getParameter("country");
       


                      String amount = request.getParameter("amount");
        String txnid = request.getParameter("txnid");
        String posted_hash = request.getParameter("hash");
        String key = request.getParameter("key");
        String productinfo = request.getParameter("productinfo");
        String email = request.getParameter("email");
        String salt = "e5iIg1jwi8";    //original salt --8fu1iJTk9p,, test salt--ZUVOg8frEb
        String mode = request.getParameter("mode");

        Enumeration paramNames = request.getParameterNames();
            Map<String,String> params= new HashMap<String,String>();
                while(paramNames.hasMoreElements()) 
            {
                    String paramName = (String)paramNames.nextElement();

                    String paramValue = request.getParameter(paramName);

                params.put(paramName,paramValue);
            }

        String retHashSeq = "status|udf10|udf9|udf8|udf7|udf6|udf5|udf4|udf3|udf2|udf1|email|firstname|productinfo|amount|txnid|key";

                String[] hashVarSeq=retHashSeq.split("\\|");
                retHashSeq=salt+'|';
                    for(String part : hashVarSeq)
                    {
                        retHashSeq= (empty(params.get(part)))?retHashSeq.concat(""):retHashSeq.concat(params.get(part));
                        retHashSeq=retHashSeq.concat("|");
                    }

               retHashSeq = retHashSeq.substring(0,retHashSeq.length()-1);
               String hash = hashCal("SHA-512", retHashSeq);

               if (!hash.equals(posted_hash)) {
                    
                   out.print("Invalid Transaction. Please try again");
                   }
               else {
                   
                   
                   connectionprovider con = new connectionprovider();
                   Connection conn = con.getCon();
                   PreparedStatement st = conn.prepareStatement("insert into status values(?,?,?)");
                   st.setString(1, udf2);
                   st.setString(2, roomno);
                   st.setString(3, blockno);
                   st.execute();
                   
                   
                   
                   
                   
                   
                   
      %>             

        
        
        
        
 		<tr><td align="center"><strong>Transcation Id:<%=txnid%><br>
                            
                            
                            
                            <%}%>
                            <br></td>
     </table>
                            <center><h3> <a href="http://localhost:8084/Hostelfee/receipt.jsp?roll=<%=udf2%>&txnid=<%=txnid%>&block=<%=blockno%>&room=<%=roomno%>">Print Receipt</a></h3></center>
    </div>
  </div>
</div>
</div>
<div class="footer">
<div class="container">
<div class="row">
      	<div class="col-md-12"><div class="copyright">Copyright &copy;2106 UIET, Kurukshetra. All rights reserved. </div></div>
</div>
</div>
</div>

</body>

</html>
