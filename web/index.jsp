

<%@ page import="java.sql.*" %>
<%@ page import="java.security.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>

<html lang="en">
    
    <%!

   
   

    
    //This is testing...
    //This is secong test
    //hello my name is test
    //Hello niks master
    
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
<% 	
	String merchant_key="rjQUPktU";//typer here...test merchant_key[bPfxw2UH] and original merchankey[WBiWEqtY]
	String salt="e5iIg1jwi8";//type here...testsalt[ZUVOg8frEb] and merchant ID=5544247 
	String action1 ="#";            //   original... slat[8fu1iJTk9p]
	String base_url="https://test.payu.in";//Its test[https://test.payu.in]
	int error=0;                                        // original url[https://secure.payu.in/_payment]
	String hashString="";
	
        /*String merchant_key="WBiWEqtY";//typer here...test merchant_key[bPfxw2UH] and original merchankey[WBiWEqtY]
	String salt="8fu1iJTk9p";//type here...testsalt[ZUVOg8frEb] and merchant ID=5544247 
	String action1 ="#";            //   original... slat[8fu1iJTk9p]
	String base_url="https://secure.payu.in/_payment";//Its test[https://test.payu.in]
	int error=0;                                        // original url[https://secure.payu.in/_payment]
	String hashString="";
 */

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
        
	String txnid =""; //type here...
	if(empty(params.get("txnid"))){
               // out.println(params.get("txnid"));
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
        //String udf2 = txnid;
	
        String txn="abcd";
	
        String hash="";
	
        String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq = hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>
    
   <!-- <jsp:include page="databasecheckup.jsp"></jsp:include>-->
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
<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == ''){
                
		return;
        }
        console.log("Hello");
      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

</head>

<body onload="submitPayuForm();">
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
    <h1 class="text-center">Online Fee Payment</h1>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="payment_form">
          <form role="form" action="<%= action1 %>" method="post" name="payuForm">
              
              
              <input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      
	  <input type="hidden" name="service_provider" value="payu_paisa" />
          <input name="country" value="India" type="hidden"/>
          <input type="hidden" name="surl" value="http://localhost:8080/Hostelfee/success.jsp" /><!-- http://www.booksnote.com/success-->
          <input type="hidden" name="furl" value="http://localhost:8080/Hostelfee/failed.jsp" /><!--http://www.booksnote.com/failure -->
          <input type="hidden" name="curl" value="http://www.booksnote.com/cancel" /><!--http://www.booksnote.com/cancel -->
           <input name="productinfo" type="hidden" value="Hostel Fee submission" />
           
           
           
            <fieldset>
              <div class="clearfix"></div>
              <div class="col-md-6 form-group">
                <label>Session <span  class="required">*</span></label>
                <select  name="uiet_session" class="form-control" size="1">
                  <option value="">--Session--</option>
                                    <option value="2017-18" >2017-18</option>
                                  </select>
                <span class="error">
                                </span> </div>
              <div class="col-md-6 form-group">
                <label>Student's Name <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" maxlength="30">
                <span class="error">
                                </span> </div>
                <div class="col-md-6 form-group">
                <label>Father's Name <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" maxlength="30">
                <span class="error">
                                </span> </div>
              
              <div class="col-md-6  form-group">
                <label>Roll Number <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="udf2" value="<%= (empty(params.get("udf2"))) ? "" : params.get("udf2") %>"  maxlength="100">
                <span class="error">
                                </span> </div>
                <div class="clearfix"></div>
              <div class="col-md-6 form-group">
                <label> Course <span  class="required">*</span></label>
                <select name="course" class="form-control course" size="1">
                  <option value="">--Select Course--</option>
                                    <option value="1" >B.Tech Biotech</option>
                                    <option value="2" >B.Tech CSE</option>
                                    <option value="3" >B.Tech ECE</option>
                                    <option value="4" >B.Tech Mechanical </option>      
                                  </select>
                <span class="error">
                                </span> </div>
              
              <div class="col-md-6  form-group">
                <label>Semester <span  class="required">*</span></label>
                
                <select name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="form-control" size="1">
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" selected="selected">--Select Semester--</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem1" >Semester - I</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem1" >Semester - II</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem1" >Semester - III</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem1" >Semester - IV</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem2" >Semester - V</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem2" >Semester - VI</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem2" >Semester - VII</option>
                  <option value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" class="sem2" >Semester - VIII</option>
                  
                </select>
                <span class="error">
                                </span> </div>
                
              <!--<div class="col-md-6 form-group">
                <label> Fee Type <span  class="required">*</span></label>
                
                <select  name="fee_type" class="form-control fee_type" size="1">
                  <option value="">--Fee Type--</option>
                  <option value="Hostel Admission Fee" >Hostel Admission Fee</option>
                  <option value="Security Fee" > Security Fee</option>
                  <option value="Other Fee" > Other Fee</option>
                </select>
                <span class="error">
                                </span> </div>-->
              <div class="col-md-6 form-group">
              <label>Hostel Admission Fee : Rs. 1200</label><br></br>
              <label>Other Fee : Rs. 800 </lable><br></br>
              <label>Security Fee :Rs. 500</label><br></br>
              <span class="error">
                                </span> </div>
              <div class="clearfix"></div>
              <!--<div class="col-md-6 form-group other_field">
                <label>Specify Other Fee <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="other_fee" value=""  maxlength="100">
                <span class="error">
                                </span> </div>-->
              <div class="col-md-6 form-group">
                <label>Amount <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="amount" value="2500" readonly  maxlength="100">
                <span class="error">
                                </span> </div>
                
                 <div class="clearfix"></div>
                <!-- <div class="col-md-12 form-group">
                <!--<label>Aadhaar  Card Number <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="aadhaar_card_no" value="" maxlength="12" onkeypress="return IsNumeric(event)">
                  <span class="error">
                                </span> </div>-->
                
              <div class="col-md-6 form-group">
                <label>Block <span  class="required">*</span></label>
                <select  name="block" class="form-control fee_type" size="1">
                  <option value="">--Block--</option>
                  <option value="A" >A</option>
                  <option value="B" > B</option>
                  <option value="C" > C</option>
                </select>
                <span class="error">
                                </span> </div>
              <div class="col-md-6  form-group">
                <label>Room No. <span  class="required">*</span></label>
                <select  name="roomno" class="form-control fee_type" size="1">
                  <option value="">--Room no--</option>
                  <option value="27" >27</option>
                  <option value="42" > 42</option>
                  
                </select>
                <span class="error">
                                </span> </div>
              <div class="clearfix"></div>
              
              <div class="col-md-6 form-group">
                <label>Email Id <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" maxlength="100">
                <span class="error">
                                </span> </div>
              <div class="col-md-6  form-group">
                <label>Mobile Number <span  class="required">*</span></label>
                <input type="text"  class="form-control" name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" placeholder maxlength="10" onkeypress="return IsNumeric(event)">
                <span class="error">
                                </span> </div>
              <div class="clearfix"></div>
              <div class="col-md-6 form-group">
                <label class=""></label>
                <% if(empty(hash)){ %>
            <td colspan="4"><input  type="submit" class="btn btn btn-dark-blue" value="Submit" name="submit_payment">
          <% } %>
                
              </div>
              <div class="clearfix"></div>
            </fieldset>
          </form>
        </div>
      </div>
      <div class="col-md-8 col-md-offset-2">
        <div class="hint_block">
          <ul>
            <li>Mandatory fields are marked with an asterisk (<span class="required">*</span>)</li>
            <li>Ph.D. Student Enter Registration Number as a Roll Number</li>
            
            
          </ul>
        </div>
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
</div><script type="text/javascript">
function IsNumeric(evt) {
evt = (evt) ? evt : window.event;
var charCode = (evt.which) ? evt.which : evt.keyCode;
if (charCode > 31 && (charCode < 48 || charCode > 57)) {
return false;
}
return true;
}
</script>
</body>
</html>
