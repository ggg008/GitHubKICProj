<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/stock/highstock.js"></script>
	<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
</head>
<script>
	function draw3(){
		var chartdata = [];
		$.getJSON('https://min-api.cryptocompare.com/data/v2/histohour?fsym=BTC&tsym=USD&limit=1000', function (data) {
			console.log(data);
			$.each(data.Data.Data, function(i, item){
				console.log(item);
				chartdata.push([item.time * 1000, item.open, item.high, item.low, item.close]);
			});
		}).done(function(){
			Highcharts.stockChart('container',{
				title: {
					text: 'BTC/USD'
				},
				rangeSelector: {
					buttons: [
						
						{type: 'hour',count: 1,text: '1h'}, 
						
						{type: 'day',count: 1,text: '1d'}, 
						{type: 'all',count: 1,text: 'All'}
					],
					selected: 2,
					inputEnabled: true
				},
				plotOptions: {
					candlestick: {						
						color: 'red',
						upColor: 'green'						 
					}
				},
				series: [{
					name: 'BTC/USD',
					type: 'candlestick',
					data: chartdata,
					tooltip: {
						valueDecimals: 8
					}
				}]
			});
		});
	}
	draw3();
</script>
<body>
	<div id="container" style="height: 400px; min-width: 310px"></div>
</body>
</html>
