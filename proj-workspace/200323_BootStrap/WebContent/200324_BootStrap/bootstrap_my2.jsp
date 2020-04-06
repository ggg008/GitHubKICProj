<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/hmac-sha256.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/components/enc-base64-min.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#btn').on('click', function() {
			//alert('click');
			$.ajax({
				// 다국어이면 url 인코딩
				url : testFunc(),//주로 get
				type: 'post',
				dataType: 'json',
				success: function(data) {
					// 중심적인 처리
					console.log('성공 : ' + typeof(data));
					console.log(data)
					
					var output = "";
					output += data;

					$('#result').html(output);
				},
				error: function(error) {
					// 404일때
					console.log('실패 : ' + error.status);
					console.log(error.responseText);
				}
			})
			
		})
		
	})
	
	console.log( CryptoJS );
	function testFunc() {
		
		

		// This is base64 encoded
		var secret = 'fef075d38edccd520d37bbd43618bf5f6b258b3580446954cb74957d431940d0';

		var nonce = Date.now();
		var requestPath = "/v1/users/70e3a52a-4fda-464d-b4af-029f55cbd9be/accounts/123/rebalance_period";
		
		var body = JSON.stringify({
		    rebalancePeriod: 24
		});

		var method = "POST";

		// create the prehash string by concatenating required parts
		var prehashString = requestPath + method + nonce + body;

		// decode the base64 secret
		//var key = Buffer(secret, 'base64');
		var key = CryptoJS.enc.Base64.parse(secret);

		// create a sha256 hmac with the secret
		//var hmac = crypto.createHmac('sha256', key);
		var hmac2 = CryptoJS.HmacSHA256(prehashString, key);

		// hash the prehash string and base64 encode the result
		return CryptoJS.enc.Base64.stringify(hmac2);
	}
	
	console.log(testFunc());
	
</script>
</head>
<body>
	<button id="btn">요청</button>
	<br>
	<hr>
	<div id="result"></div>
</body>
</html>

