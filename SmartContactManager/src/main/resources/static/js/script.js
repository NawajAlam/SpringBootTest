console.log("This is Script File");

const toggleSidebar=()=>{
if($('.sidebar').is(":visible"))	{
	//close
	$(".sidebar").css("display","none");
	$(".content").css("margin-left","0%");
}
else{
	//open
	$(".sidebar").css("display","block");
	$(".content").css("margin-left","20%");
}
};

//First request to server to create order
const paymentStart=()=>{
	console.log("Payment Started");
	let amnt=$("#amount").val();
	console.log(amnt)
	if(amnt=='' || amnt==null){
		swal("Failed!", "Amount is required !!", "error");
		return;
	}

	//ajax to send req to server to create order
	$.ajax({
		url:'/user/create_order',
		data: JSON.stringify({amnt:amnt,info:'order_request'}),
		contentType:'application/json',
		type:'POST',
		dataType:'json',
		success:function(response){
            console.log(response);
			if(response.status=='created'){
				//open payment form
				let options={
					kay:'rzp_test_iWOCNg2GFiiXzd',
					amount:response.amount,
					currency:'INR',
					name:'Smart Contact Manager',
					description:'Donation',
					order_id:response.id,
					handler:function(response){
						console.log(response.razorpay_payment_id);
						console.log(response.razorpay_order_id);
						console.log(response.razorpay_signature);
						console.log('Payment Successful');
						updatePaymentOnServer(response.razorpay_payment_id,response.razorpay_order_id,"paid");
						console.log("After Paid ");
					},
					prefill: {
						name: "Nawaj Alam",
						email: "",
						contact: ""
					},
					notes: {
						address: "Smart Contact Manager!!"
					},
					theme: {
						color: "#3399cc"
					}
				};

				let rzp1 =new Razorpay(options);
				rzp1.on('payment.failed', function (response){
					console.log(response.error.code);
					console.log(response.error.description);
					console.log(response.error.source);
					console.log(response.error.step);
					console.log(response.error.reason);
					console.log(response.error.metadata.order_id);
					console.log(response.error.metadata.payment_id);
					swal("Failed!", "Oops Payment Failed !!", "error");
					
			});
			rzp1.open();
			}
		},
		error:function(error){
			console.error("Error :"+error);
			alert("Something went wrong")
		},
	});
};

function updatePaymentOnServer(payment_id,order_id,status)
{
	$.ajax({
	    url:"/user/update_order",
		data: JSON.stringify({payment:payment_id,order:order_id,status:status}),
		contentType:"application/json",
		type:"POST",
		//dataType:"json",
		success: function(response){
			//alert("welcome");
			swal("Good job!", "Payment Success ", "success");
			console.log("Result "+response);
		},
		 error: function(error){
			 
		 	swal("Failed!", "Your Payment is successful, but we did not get on server, we will contact you as soon as possible !!", "error");
			console.log(error);
		 }
		 
	});
}
