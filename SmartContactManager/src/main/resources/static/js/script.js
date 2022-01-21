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