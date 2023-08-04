
$(document).ready(function(){
$('#catalogue_price').keyup(function(ev){
  cal();
});

});
function cal()
{
  const priceInput =parseFloat($("#catalogue_price").val());
  const gstInput = $("#catalogue_gst");
  const totalInput = $("#catalogue_total");
 

    if (priceInput!=0) {
      const gst = priceInput * 0.18; // Assuming 18% GST rate, adjust as needed
      const total = priceInput + gst;

      gstInput.val(gst.toFixed(2));
      totalInput.val(total.toFixed(2));
    } 
    else {
      gstInput.value = "";
      totalInput.value = "";
    }
}