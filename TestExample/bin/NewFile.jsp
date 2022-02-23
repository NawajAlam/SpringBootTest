<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<title>.:: vCard ::.</title>

<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="context" value="${pageContext.request.contextPath}" />

<link rel="stylesheet"
href="${context}/resources/css/jquery-ui-1.9.2.css">
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" /> -->

<style type="text/css">
.card-header{
 background-color:#27ae60 !important;
 font-size: 20px;
 color: white;
 
 }
 #modal-dialog {
  max-width: 90% !important;
  height: 100%;
 
}
.phoneBox select, input[type="text"] {
background: rgba(0, 0, 0, 0) none repeat scroll 0 0 !important;
color: #ff8345 !important;
font-size: 15px !important;
height: 30px !important;
width: 93% !important;
border: 0px !important;
border-bottom: 2px solid #ff8345 !important;
}

</style>

</head>
<body>
<%@ include file="callCenterHeader.jsp"%>
<%@ include file="../reportsHeader.jsp"%>

<div class="container top-content">
<div class="row">
<div class="col-sm-8 col-12 mx-auto">
<c:if test="${ empty customersList}">
<table border="0" cellspacing="0" cellpadding="0"
class="w-100 table formList table-striped table-condensed"
id="data">
<form:form method="POST" action="" commandName="customerBean"
id="callcenterCustomersFunnelReport">
<p>&nbsp;</p>
<!-- <h2 style="color:#fff;"> Search Customers </h2><br> -->

<div class="row">
<div class="col-md-6 col-9 mx-auto  phoneBox">
<input type="text" name="fromDate" placeholder="From date"
id="fromDate" onkeydown="return false" onClick="errorHide();" />
<!-- <input type="text" name="fromDate"    placeholder="From date "
id="fromDate"  min="01-01-1970"   pattern="\d{1,2}/\d{1,2}/\d{4}"   onkeydown="return false" onfocus="(this.type='date')" onClick="errorHide();"/> -->
</div>
</div>
<br />

<div class="row">
<div class="col-md-6 col-9 mx-auto  phoneBox">
<input type="text" placeholder="To date " name="toDate"
id="toDate" onkeydown="return false" onClick="errorHide();" />
<!-- <input type="text"  placeholder="To date "  name="toDate"  min="01-01-1970"  pattern="\d{1,2}/\d{1,2}/\d{4}"
id="toDate"  onkeydown="return false"  onfocus="(this.type='date')" onClick="errorHide();"/> -->
</div>
</div>
<br />



<div class="row">
<div class="col-md-6 col-9 mx-auto  phoneBox">
<input type="hidden" id="lenderCode" name="lenderCode" /> <select
id="lenderListId">
<option value="" selected>--Select Lender--</option>
<c:forEach items="${lenderList}" var="lender">
<option value="${lender.key}" style="color: black;">${lender.value}</option>
</c:forEach>
</select>

</div>
</div>
<br />


<div class="row">
<div class="col-md-6 col-9 mx-auto  phoneBox">
<input type="hidden" id="appStatusVal" name="appStatus" /> <select
id="custAppStatusId">
<option value="" selected>--Select Status--</option>
<c:forEach items="${customerAppStatusMap}" var="custAppStatus">
<option value="${custAppStatus.itemId}" style="color: black;">${custAppStatus.itemData1} &nbsp;(${custAppStatus.itemId} )</option>
</c:forEach>
</select>

</div>
</div>
<br />



<div class="row">
<div class="col text-center">
<label id="error" style="color: red; cursor: default;"></label>
<label style="color: red" id="failMsg">${failureMsgResp}</label>
<label class="text-success" id="succMsg">${successMsgResp}</label>
</div>
</div>

<div class="row">
<div class="form-group col-12 text-center">
<input type="button" value="Preview"
onclick=" return validate_activity('preview');"
class="btn btn-primary mr-2" /> <input type="button"
value="Reset" onclick=" return resetFormData();"
class="btn btn-primary mr-2" /> <a
href="${context}/callCenterHome" class="btn btn-primary">&nbsp;Home&nbsp;</a>
<input type="button" value="Funnel Dashboard"
onclick="return funnelreport('customerPincapList')"
class="btn btn-primary mr-2" />
<input type="button" value="CRM Follow Up"
onclick=" return validate_activity('crmFollowUp');"
class="btn btn-primary mr-2" /> 
</div>
</div>
</form:form>
</table>
</c:if>
</div>
</div>
</div>
 <table id="customerList" class="w-100 table-bordered table formList table-striped table-condensed">
<thead>
<tr>
<th>Customer Code</th>
<th>DOB</th>
<th>Gender</th>
<th>Aadhaar Number</th>
<th>Customer Status</th>
<th>Address Line1</th>
<th>Address Line2</th>
<th>City</th>
<th>State</th>
<th>Country</th>
<th>Postal</th>
<th>District</th>
<th>Sub District</th>
<th>Date Created</th>
</tr>
</thead>
</table>

<table id="customerAppQueueList" class=" table-bordered"
		style="width: 100%">
		<thead>
			<tr>
				<th>Status</th>
				<th>Customer Code</th>
				<th>Mobile Number</th>
<!-- 				<th>First Name</th>
 				<th>Last Name</th> -->
<!-- 				<th>Aadhaar Number</th> -->
<!-- 				<th>App Code</th> -->
<!-- 				<th>Recommed. Count</th> -->
<!-- 				<th>Docs Verified</th> -->
				<th>App Status Code</th>
				<th>PreApprove Amount</th>
				<th>App Status</th>
				<th>App Status Date</th>
				<th>Lender Code</th>
<!-- 				<th>HCI Score</th> -->
				<th>Lender App Number</th>
				<th>Application Date Created</th>
				<th>Application Date Time</th>
				<th>Card Activation Date</th>
				<th>Card Setup</th>
<!-- 				<th>Mobile Flag</th> -->
				<!-- newly added properties -->
				<th>Current Residence City</th>
				<th>Age-RR</th>
				<th>IncomeType-RR</th>
				<th>Income-RR</th>
				<th>City-RR</th>
<!-- 				<th>Reject Code</th> -->
				<th>Company</th>
				<th>Salary</th>
				<th>Source</th>
				
				 <th>Call Disposition Status</th> 
				 <th> Disposition Details</th> 
				 <th>Callback Date</th>
				 <th>Appointment Date</th>
			<!-- newly added properties end -->
			</tr>
		</thead>
	</table>
<table id="customerPincapList" class="table-bordered"
  style="width: 75%" class="w3-btn w3-block w3-red">
 
</table>
<!-- <table id="customerPincapListLevel2" class="table-bordered"
  style="width: 75%" class="w3-btn w3-block w3-red">
  <thead>
<tr>
  <th>App Status</th>
  <th>Status Code</th>
   <th>Counts</th>
  </tr>
  </thead>
 
</table> -->
<!-- <table id="customerPincapListLevel3" class="table-bordered"
  style="width: 75%" class="w3-btn w3-block w3-red">
  <thead>
<tr>
<th>Customer Code</th>
  <th>Customer Name</th>
  <th>Pre Approve Amount</th>
  <th>App Status Date</th>
 
  <th>Lender Code</th>
  <th>Lender App Number</th>
  <th>Current Residence City</th>
  <th>Reason</th>
 
  </tr>
  </thead>
 
</table> -->

<script type="text/javascript">
$('#customerAppQueueList').hide();
$('#customerList').hide();
$('#customerPincapList').hide();
//$('#customerPincapListLevel2').hide();
//$('#customerPincapListLevel3').hide();
$('#funnelAccordion').hide();
  $.fn.dataTable.ext.errMode = 'none';

   $('#customerAppQueueList').on( 'error.dt', function ( e, settings, techNote, message ) {
   console.log( 'An error has been reported by DataTables: ', message );
   } ) ;

   $('#customerList').on( 'error.dt', function ( e, settings, techNote, message ) {
   console.log( 'An error has been reported by DataTables: ', message );
   } ) ;
   $('#customerPincapList').on( 'error.dt', function ( e, settings, techNote, message ) {
   console.log( 'An error has been reported by DataTables: ', message );
   } ) ;
   
  /*  $('#customerPincapListLevel2').on( 'error.dt', function ( e, settings, techNote, message ) {
   console.log( 'An error has been reported by DataTables: ', message );
   } ) ;
   
   $('#customerPincapListLevel3').on( 'error.dt', function ( e, settings, techNote, message ) {
   console.log( 'An error has been reported by DataTables: ', message );
   } ) ; */
   
//$('#buttons').hide();
function validate_activity(type) {
$('label[id*="failMsg"]').text('');
$('#customerAppQueueList').dataTable().fnDestroy();
//$('#customerPincapList').dataTable().fnDestroy();
//$('#customerPincapListLevel2').dataTable().fnDestroy();
//$('#customerPincapListLevel3').dataTable().fnDestroy();
$('#customerList').dataTable().fnDestroy();

$('#customerAppQueueList').hide();
$('#customerList').hide();
$('#customerPincapList').hide();

$('#funnelAccordion').hide();


//$('#customerPincapListLevel2').hide();
//$('#customerPincapListLevel3').hide();

var flag = datesValidation();
if (flag == true) {
// document.getElementById("customersRegistrationReport").submit();
var custStatusId=$('#custAppStatusId option:selected').val();
var lenderId=$('#lenderListId option:selected').val();
var fromDate=$("#fromDate").val();
var toDate=$("#toDate").val();
$.ajax({
url: "${context}/callcenterCustomersFunnelReport",
type:"POST",
    data: {
    appStatus : secure(custStatusId),
    lenderCode:secure(lenderId),
    fromDate : secure(fromDate),
    toDate  : secure(toDate),
    buttonType : type
},
error: function(exception) {
          window.alert("Exception---:"+exception);
          },
          success: function(result) {
          if(result.status=="Success"){
        var customerAppQueueList=result.customersApplicationList;
        var customerList=result.customersRegistrationList;
        if(customerList != null && customerList.length > 0){
            $('#customerList').show();
               $('#customerList').DataTable( {
           data: customerList,
           dom: 'Bfrtip',
                   buttons: [],
           destroy: true,
           responsive:true,
       
                           "columns": [
    {  data: 'customerCode'},
    //{  data: 'firstName'},
    //{  data: 'lastName'},
    {  data: 'dob'},
    {  data: 'sex'},
    {  data: 'aadhaarNumber'},
    //{  data: 'phoneNumber'},
    {  data: 'customerStatus'},
    {  data: 'addrLine1'},
    {  data: 'addrLine2'},
    {  data: 'city'},
    {  data: 'stateCode'},
    {  data: 'countryCode'},
    {  data: 'postalCode'},
    {  data: 'district'},
    {  data: 'subDistrict'},
    {  data: 'dateCreated'}    
        ]
          } );
              } // if(customerList.length > 0)
if(customerAppQueueList != null && customerAppQueueList.length > 0){
// $('#buttons').show();
	if(result.viewPreview==true)
        $('#customerAppQueueList').show();
	else
		{
		$('#customerAppQueueList').hide();
		$('#customerList').hide();
		$('#customerAppQueueList').dataTable().fnDestroy();
		$('#customerList').dataTable().fnDestroy();
		}
           $('#customerAppQueueList').DataTable( {
            dom:
               "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
               "<'row'<'col-sm-12'tr>>" +
               "<'row'<'col-sm-5'i><'col-sm-7'p>>",
               buttons : [{
					extend : 'excel',
					filename : function() {
						var d = new Date();
						return "Customers_Application_Report_"+ d.getDate()+ "-"+ d.getMonth()+ "-"+ d.getFullYear()+ "_"+ d.getTime();
					}
				},
				{
					extend : 'pdf',
					orientation : 'landscape',
					pageSize : 'A4',
					customize : function(doc) {
						doc.styles.tableHeader.fontSize = 10
						doc.defaultStyle.fontSize = 8;
					},
					filename : function() {
						var d = new Date();
						return "Customers_Application_Report_"+ d.getDate()+ "-"+ d.getMonth()+ "-"+ d.getFullYear()+ "_"+ d.getTime();
					}

				} ],       
            data: customerAppQueueList,
       destroy: true,
       responsive:true,
   
                       "columns": [
{  data: 'customerCode',
    'render': function (data, type, row, meta)
    {
        return '<a class="btn btn-info" role="button" href="#" onclick="getCustomerUpdateCallDispositionDetails(\''+row.customerCode+'\'); " >Update</a>'
   }
	
	
	},
	{  data: 'customerCode'},
//{  data: 'firstName'},
//{  data: 'lastName'},
//{  data: 'customerName'},
// {  data: 'aadhaarNumber'},
 {  data: 'phoneNumber'},
// {  data: 'appCode'},
// {  data: 'recommCount'},
// {  data: 'isDLVerified'},
										{  data: 'appStatusCode'},
										{  data: 'preApprovedAmount'},
										{  data: 'appStatus'},
										{  data: 'appStatusDate'},
										{  data: 'lenderCode'},
									//	{  data: 'hciScore'},
										{  data: 'lenderAppNum'},
										{  data: 'dateCreated'},
										{  data: 'time'},
										{  data: 'cardActivationDate'},
										{  data: 'cardSetup'},
									//	{  data: 'mobileFlag'},
										{  data: 'residenceCity'},
{  data: 'rejectReasonAge'},
{  data: 'rejectReasonIncomeType'},
{  data: 'rejectReasonIncome'},
{  data: 'rejectReasonCity'},
// {  data: 'rejectCode'},
{  data: 'employerName'},
{  data: 'netIncome',
render: function ( data, type, row ) {
let netSal = parseFloat(row.netIncome).toFixed(2);
return  netSal != 'NaN'  ?  netSal : "0.00";
}
},
{  data: 'source'},
{  data:  'dispositionstatus'},
{  data:  'dispositiondetails'},
{  data:  'callbackdate'},
{  data:  'appointmentdate'}

    ],
               
    			"bPaginate": result.viewPreview, //hide pagination
    		    "bFilter": result.viewPreview, //hide Search bar
    		    "bInfo": result.viewPreview, // hide showing entries
        } );
          } // if(customerAppQueueList.length > 0)
          } // if(result.status=="Success")
          else{
          $('#failMsg').text('No records found');
          }
          }
});
} else {
return false;
}
}

/* function Funnel_report(id) {
var flag = datesValidation();
if (flag == true){
} else {
return false;
}
var lenderId=$('#lenderListId option:selected').val();
var fromDate=$("#fromDate").val();
var toDate=$("#toDate").val();
$.ajax({
url: "${context}/callCenterFunnelDashboard",
type:"POST",
    data: {
    lenderCode:secure(lenderId),
    fromDate : secure(fromDate),
    toDate  : secure(toDate)
},
error: function(exception) {
          window.alert("Exception---:"+exception);
          },
          success: function(result) {
          if(result.status=="Success"){
        var callCenterFunnelDashboardList=result.callCenterFunnelDashboardList;
if(callCenterFunnelDashboardList != null && callCenterFunnelDashboardList.length > 0){
        $('#customerPincapList').show();
           $('#customerPincapList').DataTable( {
            dom:
               "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
               "<'row'<'col-sm-12'tr>>" +
               "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [],    
            data: callCenterFunnelDashboardList,
       destroy: true,
       responsive:true,
   
                       "columns": [
{  data: 'grp_status'},
{  data: 'count',

                                            'render': function (data, type, row, meta)

            {

                return '<a class="btn btn-info" role="button" href="#" onclick="getFunnelDashboardLevel2(\''+row.grp_status+'\'); return false;" >'+row.count +' </a>'
               

           }

            }
    ] ,
        "bPaginate": false, //hide pagination
           "bFilter": false, //hide Search bar
           "bInfo": false, // hide showing entries 
        } );
          }
$('#failMsg').text('');
          }
          else{
          $('#failMsg').text('No records found');
         $('#customerPincapListLevel2').hide();
       
          }
         $('#customerPincapListLevel3').hide();
          }
});
} else {
return false;
}
} */
 /*       function getFunnelDashboardLevel2(status){
      //
     // alert('hello'+status);

var flag = datesValidation();
if (flag == true){
var lenderId=$('#lenderListId option:selected').val();
var fromDate=$("#fromDate").val();
var toDate=$("#toDate").val();
$.ajax({
url: "${context}/callCenterFunnelDashboard",
type:"POST",
    data: {
    lenderCode:secure(lenderId),
    fromDate : secure(fromDate),
    toDate  : secure(toDate),
    grpStatus:status
},
error: function(exception) {
          window.alert("Exception---:"+exception);
          },
          success: function(result) {
          if(result.status=="Success"){
        var callCenterFunnelDashboardList=result.callCenterFunnelDashboardList;
if(callCenterFunnelDashboardList != null && callCenterFunnelDashboardList.length > 0){
        $('#customerPincapListLevel2').show();
           $('#customerPincapListLevel2').DataTable( {
            dom:
               "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
               "<'row'<'col-sm-12'tr>>" +
               "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [],    
            data: callCenterFunnelDashboardList,
       destroy: true,
       responsive:true,
   
                       "columns": [
{  data: 'grp_status'},
{  data: 'status_code'},
{  data: 'count',

                                            'render': function (data, type, row, meta)

            {

                return '<a class="btn btn-info" role="button" href="#" onclick="getCustomerWiseFunnelDashboard(\''+row.status_code+'\'); return false;" >'+row.count +' </a>'
               

           }}
    ]
        ,
        "bPaginate": false, //hide pagination
           "bFilter": false, //hide Search bar
           "bInfo": false, // hide showing entries
           } );
          }
          }
          else{
          $('#failMsg').text('No records found');
       
          }
         $('#customerPincapListLevel3').hide();
          }
});
} else {
return false;
}
       } */
/* function getCustomerWiseFunnelDashboard(status_code)
{

var flag = ();
if (flag == true){
var lenderId=$('#lenderListId option:selected').val();
var fromDate=$("#fromDate").val();
var toDate=$("#toDate").val();
$.ajax({
url: "${context}/callCenterCustomerWiseFunnelDashboard",
type:"POST",
    data: {
    lenderCode:secure(lenderId),
    fromDate : secure(fromDate),
    toDate  : secure(toDate),
    status_code : secure(status_code)
},
error: function(exception) {
          window.alert("Exception---:"+exception);
          },
        success: function(result) {
        if(result.status=="Success"){
      var customersApplicationList=result.customersApplicationList;
if(customersApplicationList != null && customersApplicationList.length > 0){

        $('#customerPincapListLevel3').show();
           $('#customerPincapListLevel3').DataTable( {
            dom:
               "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
               "<'row'<'col-sm-12'tr>>" +
               "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [],    
            data: customersApplicationList,
       destroy: true,
       responsive:true,
   
                       "columns": [
{  data: 'customerCode'},
{  data: 'customerName'},
{  data: 'preApprovedAmount'},
{  data: 'appStatusDate'},
{  data: 'lenderCode'},
{  data: 'lenderAppNum'},
{  data: 'residenceCity'},
{  data: 'rejectReason'}
    ]
        ,
        "bPaginate": false, //hide pagination
           "bFilter": false, //hide Search bar
           "bInfo": false, // hide showing entries
           } );
        }
        }
        else{
        $('#failMsg').text('No records found');
        }
        }
});
} else {
return false;
}




} */


function datesValidation(){

var fromDate = $('#fromDate').val();
var toDate = $('#toDate').val();

var splitFromDate = $('#fromDate').val().split("-");
var splitToDate=$('#toDate').val().split("-");

if(fromDate.trim() == "" && toDate.trim() == ""){
return true;
}
if( fromDate.trim() == "" && toDate.trim() != ""){
document.getElementById("error").innerHTML = "Please select From date !!";
return false;
 }

if( fromDate.trim() != "" && toDate.trim() == ""){
document.getElementById("error").innerHTML = "Please select To date !!";
return false;
 }
return true;
}


function errorHide(){
document.getElementById("error").innerHTML="";
document.getElementById("failMsg").innerHTML="";
document.getElementById("succMsg").innerHTML="";
}

function resetFormData() {
$('#customerAppQueueList').dataTable().fnDestroy();
$('#customerList').dataTable().fnDestroy();

//$('#customerPincapListLevel2').dataTable().fnDestroy();
//$('#customerPincapListLevel3').dataTable().fnDestroy();
//$('#customerPincapList').dataTable().fnDestroy();

//$('#customerPincapListLevel2').hide();
//$('#customerPincapListLevel3').hide();
$('#customerPincapList').hide();

$('#customerAppQueueList').hide();
$('#customerList').hide();

$("#fromDate").val('');
$("#toDate").val('');
$("#fromDate").attr('type', 'text');
$("#toDate").attr('type', 'text');

$("#custAppStatusId option").prop("selected", function() {
return this.defaultSelected;
});

$("#lenderListId option").prop("selected", function() {
return this.defaultSelected;
});
document.getElementById("error").innerHTML = "";
document.getElementById("failMsg").innerHTML="";
document.getElementById("succMsg").innerHTML="";
}

</script>

<script>

</script>

<div class="container">
<div id="funnelAccordion" >











<!-- <div class="card">


<div class="card-header">
<div>CIBILAuthFailedPending</div>
<div style="display:flex;color:green;margin-left:100px;"><a class="collapsed card-link" data-toggle="collapse" href="#collapse0">Count</a></div>

</div>

<div id="collapse0" class="collapse" data-parent="#accordion">
<div class="card-body">

<table class="table table-bordered">
<tr>
<th>App Status</th>
<th>Status Code</th>
<th>Counts</th>
</tr>
<tr>
<td></td>
<td></td>
<td style="text-color:blue"><a href="button" data-toggle="modal"
data-target="#myModal">number</a></td>

</tr>
</table>

</div>

</div>

</div> -->
</div>

<!--modal-->
<div class="container-fluid">
<div class="modal fade" id="myModal" role="dialog" tabindex="-1"
aria-labelledby="myModalLabel" aria-close="true">
<div class="modal-dialog  modal-lg"  id="modal-dialog" role="document">

<!-- Modal content-->

<div class="modal-content">

<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
aria-close="true" style="max-width: 1350px">&times;</button>

</div>

<div class="modal-body">
<!-- <table class="table table-bordered">
<tr>
<th>CustomerCode</th>
<th>CustomerName</th>
<th>PreApproveAmount</th>
<th>App StatusDate</th>
<th>LenderCode</th>
<th>LenderApp Number</th>
<th>CurrentResidence City</th>
<th>Reason</th>
</tr>
</table> -->
</div>

</div>

</div>
</div>
</div>


<div class="card">

<div id="collapseTwo" class="collapse" data-parent="#accordion">
<div class="card-body">
<table class="table table-bordered">
<tr>
<th>App Status</th>
- <th>Status Code</th>
<th>Counts</th>
</tr>
<tr>
<td></td>
<td></td>
<td><a href="button" data-toggle="modal"
data-target="#myModal1">number2</a></td>
</tr>
</table>

</div>
</div>
</div>
<!--modal-->
<div class="container-fluid">
<div class="modal fade" id="myModal1" role="dialog" tabindex="-1"
aria-labelledby="myModalLabel" aria-close="true">
<div class="modal-dialog  modal-lg" id ="modal-dialog" role="document">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
aria-close="true" style="max-width: 1350px">&times;</button>
</div>
<div class="modal-body">
<!-- <table class="table table-bordered">
<tr>
<th>CustomerCode</th>
<th>CustomerName</th>
<th>PreApproveAmount</th>
<th>App StatusDate</th>
<th>LenderCode</th>
<th>LenderApp Number</th>
<th>CurrentResidence City</th>
<th>Reason</th>
</tr> -->
<span id="cust"></span>
<!-- </table> -->
</div>

</div>
</div>
</div>
</div>

<!-- added update status pop up -->

<div class="container-fluid">
<div class="modal fade" id="myModal2" role="dialog" tabindex="-1"
aria-labelledby="myModalLabel" aria-close="true">
<div class="modal-dialog  modal-lg" role="document" >
<!-- Modal content-->
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
aria-close="true" style="max-width: 550px">&times;</button>
</div>
<div class="modal-body">
<span id="updateStatusSpanId"></span>
</div>
<label  id="messageLabel" style="color:green;margin-left: 300px;margin-top: -27px;" ></label>
</div>
</div>
</div>
</div>


</div>

<script type="text/javascript">

function datesValidation(){

var fromDate = $('#fromDate').val();
var toDate = $('#toDate').val();

var splitFromDate = $('#fromDate').val().split("-");
var splitToDate=$('#toDate').val().split("-");

if(fromDate.trim() == "" && toDate.trim() == ""){
return true;
}
if( fromDate.trim() == "" && toDate.trim() != ""){
document.getElementById("error").innerHTML = "Please select From date !!";
return false;
 }

if( fromDate.trim() != "" && toDate.trim() == ""){
document.getElementById("error").innerHTML = "Please select To date !!";
return false;
 }
return true;
}

function funnelreport(id){
	$('#customerAppQueueList').hide();
	$('#customerList').hide();
	$('#funnelAccordion').show();
	$('#customerAppQueueList').dataTable().fnDestroy();
	$('#customerList').dataTable().fnDestroy();
var flag = datesValidation();
if (flag == true){

var lenderId=$('#lenderListId option:selected').val();
var fromDate=$("#fromDate").val();
var toDate=$("#toDate").val();

$.ajax({
url: "${context}/callCenterFunnelDashboard",
type:"POST",
    data: {
    lenderCode:secure(lenderId),
    fromDate : secure(fromDate),
    toDate  : secure(toDate)
},
error: function(exception) {
          window.alert("Exception---:"+exception);
          },
      success: function(result) {
      if(result.status=="Success"){
    var callCenterFunnelDashboardList=result.callCenterFunnelDashboardList;
if(callCenterFunnelDashboardList != null && callCenterFunnelDashboardList.length > 0){
    $('#customerPincapList').show();
   
    viewDashboardList(callCenterFunnelDashboardList, result.total);
      }
$('#failMsg').text('');
      }
      else{
      $('#failMsg').text('No records found');
     $('#customerPincapListLevel2').hide();
   
      }
     $('#customerPincapListLevel3').hide();
      }
});
} else {
return false;
}

}

function viewDashboardList(dashboardList, total){
$("#funnelAccordion").html("");
let funnelAccordins= "";
dashboardList.forEach(function(funnel, index ){
// customerPincapListDiv
/* alert("callCenterFunnelDashboardList ::: "+ JSON.stringify(funnel)); */
console.log(JSON.stringify(funnel));
   var st=getFunnelDashboardLevel11(funnel.grp_status, index);
console.log(st);
//alert(st);
var funnelItem="<div class='container'>"
+"<div id='funnelAccordion'>"
+"<div class='card'>"
   +"<div class='card-header' id='heading"+index+"'>"
   +"<p>"+ funnel.grp_status/* "</p>" */
     /* +"<p class='mb-0'>" */
     /*  +"<button class='btn btn-link' type='button' style='float:right;' data-toggle='collapse' data-target='#collapse"+index+"' aria-expanded='true' aria-controls='collapse"+index+"'>"+
              +funnel.count +"</button>"  */
      + "<a class='collapsed card-link'  style='float:right;' data-toggle='collapse' href='#collapse"+index+"'  data-target='#collapse"+index+"' aria-expanded='true' aria-controls='collapse"+index+"' >"
              +funnel.count+"</a>"    
      +"</p>"
      + "</div>"
     
      +  "<div id='collapse"+index+"' class='collapse' aria-labelledby='heading"+index+"' data-parent='#funnelAccordion'>"
      +  "<div class='card-body'  id='divBody' >"
      +" <span id='innerTable"+index+"'> </span>"
     // +st
      +"</div>"
      +"</div>"
      +"</div>"
      +"</div>"
      +"</div>";  
    //alert(funnelItem);
   
     $("#funnelAccordion").append(funnelItem);
});

var total="<div class='container'>"
+"<p style='color:white;text-size:20px;'>Total"
+"<b style='float:right; text-size:20px;'>"+total+"</b></p>"
+"</div>";
$("#funnelAccordion").append(total);
}




 function getFunnelDashboardLevel11(status, outerIndex){
console.log(status);
var flag = datesValidation();
let table="";
if (flag == true){
var lenderId=$('#lenderListId option:selected').val();
var fromDate=$("#fromDate").val();
var toDate=$("#toDate").val();

var errorTable="<table  class='table table-bordered'  >"
      +"<tr>"
      +"<th>App Status</th>"
      +"<th>Status Code</th>"
      +"<th>Counts</th>"
      +"<td>no match found</td>"
      +"</tr>";
$.ajax({
url: "${context}/callCenterFunnelDashboard",
type:"POST",
    data: {
    lenderCode:secure(lenderId),
    fromDate : secure(fromDate),
    toDate  : secure(toDate),
    grpStatus:status
},
error: function(exception) {
        window.alert("Exception---:"+exception);
        return errorTable;
        },
    success: function(result) {
    if(result.status=="Success"){
  var callCenterFunnelDashboardList=result.callCenterFunnelDashboardList;
if(callCenterFunnelDashboardList != null && callCenterFunnelDashboardList.length > 0){
console.log(result);

var table="<table  class='table table-bordered'  >"
      +"<tr>"
      +"<th>App Status</th>"
      +"<th>Status Code</th>"
      +"<th>Counts</th>"
      +"</tr>";
      console.log(table);
 callCenterFunnelDashboardList.forEach(function(funnelOutLevel2, index ){
console.log(funnelOutLevel2);
     var tableRow="<tr>"
      +"<td>"+funnelOutLevel2.grp_status+"</td>"
      +"<td>"+funnelOutLevel2.status_code+"</td>"
      +"<td><a class='btn btn-info' role='button' href='#' onclick=\"getCustomerWiseFunnelDashboardLeve3(\'"+funnelOutLevel2.status_code+"\');\">"+funnelOutLevel2.count+" </a></td>"
      +"</tr>";
      table=table+tableRow;
      document.getElementById('innerTable'+outerIndex).innerHTML = table; 

      }); 
      table=table+"</table>";
      //alert("table"+table);
      console.log(table);
      

      return table;
}else{
 return errorTable;
}
}}
});
} else {
return false;
}
}

 
 function getCustomerWiseFunnelDashboardLeve3(status_code_1){
	//alert("status code"+status_code_1);
	 var flag = datesValidation();
	 let table="";
	 if (flag == true){
	 var lenderId=$('#lenderListId option:selected').val();
	 var fromDate=$("#fromDate").val();
	 var toDate=$("#toDate").val();
var status_code=status_code_1;
	 var errorTable="<table  class='table table-bordered'  >"
;
	 $.ajax({
	 url: "${context}/callCenterCustomerWiseFunnelDashboard",
	 type:"POST",
	     data: {
	     lenderCode:secure(lenderId),
	     fromDate : secure(fromDate),
	     toDate  : secure(toDate),
	     status_code : secure(status_code)
	 },
	 error: function(exception) {
	         window.alert("Exception---:"+exception);
	         return errorTable;
	         },
	     success: function(result) {
	     if(result.status=="Success"){
	   var customersApplicationList=result.customersApplicationList;
	 if(customersApplicationList != null && customersApplicationList.length > 0){
	 console.log(result);
//alert("data >>"+customersApplicationList);



	 var table="<table class='table table-bordered'>"
	 +"<tr>"
	 +"<th>CustomerCode</th>"
	 +"<th>CustomerName</th>"
	 
	 +"<th>PreApproveAmount</th>"
	 +"<th>App StatusDate</th>"
	 +"<th>LenderCode</th>"
	 +"<th>LenderApp Number</th>"
	 +"<th>CurrentResidence City</th>"
	 +"<th>Reason</th>"
	 +"</tr>";
	 
	 customersApplicationList.forEach(function(customerwiseDetails, index ){
		 console.log(customerwiseDetails.customerCode+"reason"+customerwiseDetails.rejectReason);
		      var tableRow="<tr>"
		       +"<td>"+customerwiseDetails.customerCode+"</td>"
		       +"<td>"+customerwiseDetails.customerName+"</td>"
		       
		       +"<td>"+customerwiseDetails.preApprovedAmount+"</td>"
		       +"<td>"+customerwiseDetails.appStatusDate+"</td>"
		       +"<td>"+customerwiseDetails.lenderCode+"</td>"
		       
		       +"<td>"+customerwiseDetails.lenderAppNum+"</td>"
		       +"<td>"+customerwiseDetails.residenceCity+"</td>"
		       +"<td>"+customerwiseDetails.rejectReason+"</td>"
		       +"</tr>";
		       table=table+tableRow;
		      
		       }); 
		       //table=table+"</table>";
	  document.getElementById('cust').innerHTML = table; 

	 $("#myModal1").modal();
	       return table;
	 }else{
	  return errorTable;
	 }
	 }}
	 });
	 } else {
	 return false;
	 }
	 }

//added for update status popup
//added for update status popup
		function getCustomerUpdateCallDispositionDetails(cust_code) {
			//alert("getCustomerUpdateCallDispositionDetails"+cust_code);
			$("#messageLabel").html("");
			var flag = datesValidation();
			if (flag == true) {
				var lenderId = $('#lenderListId option:selected').val();
				var fromDate = $("#fromDate").val();
				var toDate = $("#toDate").val();
				var errorTable = "<table  class='table table-bordered'  >";

				$
						.ajax({
							url : "${context}/getCallDispositionDetails",
							type : "POST",
							data : {
								lenderCode : secure(lenderId),
								fromDate : secure(fromDate),
								toDate : secure(toDate),
								customer_code : secure(cust_code)
							},
							error : function(exception) {
								window.alert("Exception---:" + exception);
								return errorTable;
							},
							success : function(result) {
								if (result.status == "Success") {
									var callDispositionStatusList = result.callDispositionStatusList;
									if (callDispositionStatusList != null
											&& callDispositionStatusList.length > 0) {
										console.log(callDispositionStatusList);
										var callDispostionDropDown = "<select id='CallDispositionStatusId' name='CallDispositionStatusId'  onchange='disposition(value)'>";
										callDispositionStatusList.forEach(function(callDispositionStatusList,index) {
													callDispostionDropDown = callDispostionDropDown
															+ ""
															+ "<option value='"+callDispositionStatusList.callDispositionId+"'>"
															+ callDispositionStatusList.callDisposition
															+ "</option>" + "";
												});
										var dispostionDropDown = "<select id='dispostionDropDown'>";	
								 		dispostionDropDown = dispostionDropDown
												+ "</select>";
										callDispostionDropDown = callDispostionDropDown
												+ "</select>";
										console.log(callDispostionDropDown);
										
										var table = "<table class='table table-bordered'>"
												+ "<tr>"
												+ "<td>Customer Code</td>"
												+ "<td id='customerCode'>"+cust_code+"</td>"
												+ "</tr><tr>"
												+ "<tr>"
												+ "<td>Call Disposition Status</td>"
												+ "<td>"
												+ callDispostionDropDown
												+ "</td>"
												+ "</tr><tr>"
												+ "<td>Disposition Details</td>"
												+ "<td><select id='dispostionDropDown' name='dispostionDropDown'></select>"
												+ "<input type='text' name='fromDate' class='date-input col-sm-3' placeholder='select date' id='Date' onkeydown='return false' onClick='errorHide();' />"
												+ "</td>"
												+ "</tr><tr>"
												+ "</tr><tr>"
												+ "<td>Remarks</td>"
												+ "<td><textarea type='text'id='remark' name='remark' style='width: 423px;height: 45px;'></textarea></td>"
												+ "</tr>"
												+"</table>"
												+"<button  class='btn btn-info' value='save' onclick='saveDetails("+cust_code+")' style='float:right'>Save</button>";
									

										document.getElementById('updateStatusSpanId').innerHTML = table;
										$("#myModal2").modal();
										$("#dispostionDropDown").hide();
										$("#Date").hide();
										return table;
									} else {
										return errorTable;
									}
								}
							}
						});

			} else {
				return false;
			}
		}
		
//dispotion Deatils By Id 		
		function disposition(id) {
			$("#dispostionDropDown").hide();
			$("#dispostionDropDown").html("");
			$("#Date").hide();
			if (id == 3 || id == 6) {
				console.log(id);
				$("#Date").show();
				$("#Date").datepicker({
					dateFormat : 'dd/mm/yy',
					changeMonth : true,
					changeYear : true
				});

			} else {
				
						$.ajax({
							url : "${context}/getdispositionDetailsById",
							type : "POST",
							data : {
								dispositionDetailsId : id
							},
							error : function(exception) {
								window.alert("Exception---:" + exception);
							},
							success : function(result) {
								if (result.status == "Success") {
									$("#dispostionDropDown").show();
									var listOfDisposition = result.dispositionDetailsList;
									var options = "<option value='-1' selected>--Select Dispostion Details--</option>";
									;
									listOfDisposition
											.forEach(function(list, index) {

												var option = "<option value='"+list.dispositionDetailId+"'>"
														+ list.dispositionDetailName
														+ "</option>";

												options = options + option;
											});
									console.log(options);
									$("#dispostionDropDown").append(options);
									console
											.log(result.dispositionDetailsList[0].dispositionDetailId);
									console.log(result.dispositionDetailsList);
 
								}
							}
						});
			}

		}
		// details to be  updated 
		function saveDetails(customerCd) {
			$("#messageLabel").show();
			$("#messageLabel").html("");
		    var callDispositionId = $('#CallDispositionStatusId option:selected').val();
		    var dispositionId = $('#dispostionDropDown option:selected').val();
		    var remark = $("#remark").val();
		    var customerCode =customerCd;
		    var callbackdate = $("#Date").val();
			var appointmentdate = $("#Date").val();
			
			if(dispositionId==null||dispositionId==undefined || dispositionId==-1){
		    	 dispositionId=0;
		     }
			if(callbackdate==null||callbackdate==undefined){
	    		 callbackdate ="";		
	          }
			if(appointmentdate==null||appointmentdate==undefined){
				appointmentdate ="";		
	          }
			
			$.ajax({
				url : "${context}/saveUpdateStatusDispotionDetails",
				type : "POST",
				data : {
					callDispositionStatusId : callDispositionId,
					dispositionDetailsId : dispositionId,
					remark : remark,
					callbackdate : callbackdate,
					appointmentdate : appointmentdate,
					customerCode : customerCode
				},
				error : function(exception) {
					window.alert("Exception---:" + exception);
				},
				success : function(result) {
					
					if (result.status == "Success") {
                       /* alert(result.status); */
                       $("#messageLabel").append("Details saved successfully");
					}else{
						 $("#messageLabel").append("Failed To Save");
					}
					
				}
			});
		}

/* =========================================================================================================================================================================================== */
</script>
<script type="text/javascript">
/*  $(function() {  
 $("#datepicker").datepicker();
}); */

$("#fromDate").datepicker({
changeMonth : true,
changeYear : true,
dateFormat : 'dd/mm/yy',

onSelect : function(date) {
var dt2 = $('#toDate');
var minDate = $(this).datepicker('getDate');
dt2.datepicker('option', 'minDate', minDate);
}
})
.datepicker('setDate', new Date());
$("#toDate").datepicker({
dateFormat : 'dd/mm/yy',
changeMonth : true,
changeYear : true
}).datepicker('setDate', new Date());

$(document).ready(
function() {
$("#appStatusVal").val(
$('#custAppStatusId option:selected').val());
$("#lenderCode").val(
$('#lenderListId option:selected').val());
});
$('#custAppStatusId').on('change', function() {
$("#appStatusVal").val(this.value);
});
$('#lenderListId').on('change', function() {
$("#lenderCode").val(this.value);
});
</script>
 
</body>
</html>