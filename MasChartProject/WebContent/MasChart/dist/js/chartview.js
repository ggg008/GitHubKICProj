/* *
*
*  (c) 2010-2020 Torstein Honsi
*
*  License: www.highcharts.com/license
*
*  Sand-Signika theme for Highcharts JS
*
*  !!!!!!! SOURCE GETS TRANSPILED BY TYPESCRIPT. EDIT TS FILE ONLY. !!!!!!!
*
* */
'use strict';

	//Load the fonts
	Highcharts.createElement('link', {
	   href: 'https://fonts.googleapis.com/css?family=Signika:400,500',
	   rel: 'stylesheet',
	   type: 'text/css'
	}, null, document.getElementsByTagName('head')[0]);
	//Add the background image to the container
	Highcharts.addEvent(Highcharts.Chart, 'afterGetContainer', function () {
	   // eslint-disable-next-line no-invalid-this
	   this.container.style.background =
	       'url(https://www.highcharts.com/samples/graphics/sand.png)';
	});
	Highcharts.theme = {
	   colors: ['#f45b5b', '#8085e9', '#8d4654', '#7798BF', '#aaeeee',
	       '#ff0066', '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
	       
	   chart: {
	       backgroundColor: null,
	       style: {
	           fontFamily: 'Signika, serif'
	       }
	   },
	   title: {
	       style: {
	           color: 'black',
	           fontSize: '16px',
	           fontWeight: 'bold'
	       }
	   },
	   subtitle: {
	       style: {
	           color: 'black'
	       }
	   },
	   tooltip: {
	       borderWidth: 0
	   },
	   labels: {
	       style: {
	           color: '#6e6e70'
	       }
	   },
	   legend: {
	       backgroundColor: '#E0E0E8',
	       itemStyle: {
	           fontWeight: 'bold',
	           fontSize: '13px'
	       }
	   },
	   
	   xAxis: {
	       labels: {
	           style: {
	               color: '#6e6e70'
	           }
	       }
	   },
	   yAxis: {
	       labels: {
	           style: {
	               color: '#6e6e70'
	           }
	       }
	   },
	   
	   plotOptions: {
	       series: {
	           shadow: true
	       },
	       candlestick: {
	           lineColor: '#404048'
	       },
	       map: {
	           shadow: false
	       }
	   },
	   // Highstock specific
	   navigator: {
	       xAxis: {
	           gridLineColor: '#D0D0D8'
	       }
	   },
	   rangeSelector: {
	       buttonTheme: {
	           fill: 'white',
	           stroke: '#C0C0C8',
	           'stroke-width': 1,
	           states: {
	               select: {
	                   fill: '#D0D0D8'
	               }
	           }
	       }
	   },
	   scrollbar: {
	       trackBorderColor: '#C0C0C8'
	   }
	};

	// Apply the theme
	Highcharts.setOptions(Highcharts.theme);
	
	var historyTime = 'histohour';
	var symbolA = 'BTC';
	var symbolB = 'USD';	
		
	var chart = null;
	
	var draw3 = function(paramHistoryTime, paramSymbolA, paramSymbolB){
		
		console.log('call draw3');
		
		historyTime = paramHistoryTime != undefined && paramHistoryTime !== '' ? paramHistoryTime : historyTime;
		symbolA = paramSymbolA != undefined && paramSymbolA !== ''  ? paramSymbolA : symbolA;
		symbolB = paramSymbolB != undefined && paramSymbolB !== ''  ? paramSymbolB : symbolB;
		
		
		
		var chartdata = [];
		$.getJSON('https://min-api.cryptocompare.com/data/v2/'+ historyTime +'?fsym='+ symbolA +'&tsym='+ symbolB +'&limit=1000', function (data) {
			//console.log(data);
			$.each(data.Data.Data, function(i, item){
				//console.log(item);
				
				chartdata.push([item.time * 1000, item.open, item.high, item.low, item.close]);
			});
		}).done(function(){
			chart = Highcharts.stockChart('container', {
				loading: {
	    	        hideDuration: 1000,
	    	        showDuration: 1000
	    	    },
				
				title: {
					text: 'BTC/USD' + historyTime.replace('histo', ' ')
				},
				
				rangeSelector: {
					buttons: [
						
						/* 
						{type: 'hour',count: 1,text: '1h'},						
						{type: 'day',count: 1,text: '1d'},  
						*/
						{type: 'all',count: 1,text: 'All'}
					],
					selected: 0,
					inputEnabled: false
				},
				
				exporting: {
			        buttons: {
			            contextButton: {
			                text: 'Export'
			            }
			        }
			    },
				
				/* 
				plotOptions: {
					candlestick: {						
						color: 'red',
						upColor: 'green'						 
					}
				},
				 */
				series: [{
					name: 'ChartView',
					type: 'candlestick',
					data: chartdata,
					tooltip: {
						valueDecimals: 8
					}
				}],
				
				subtitle: {
			        text: '* Footnote aligned right',
			        align: 'right',
			        floating: true,
			        x: -10,
			        y: +80
				}
				
			});
			
			realtimePrice();
			switch (historyTime) {
			case 'histominute':
				$('#card-subtitle').text('Overview of Latest Minute');				
				break;
			case 'histohour':
				$('#card-subtitle').text('Overview of Latest Hour');			
				break;
			case 'histoday':
				$('#card-subtitle').text('Overview of Latest Day');			
				break;

			default:
				break;
			}
		});
	}
	
	var realtimePrice = function() {
		$.getJSON('https://min-api.cryptocompare.com/data/price?fsym='+ symbolA +'&tsyms=' + symbolB, function (data) {

			$('#chart-price').text(data.USD);
		});
		
	};
	draw3();	
	
	
	$('#minuteBtn').on("click", function() {
//	    	alert('minuteBtn!');
		if(chart != null) {
			chart.showLoading();			
		}
		draw3('histominute');
	});
	
	$('#hourBtn').on("click", function() {
//	    	alert('hourBtn!');
		if(chart != null) {
			chart.showLoading();			
		}
		draw3('histohour');
	});
	
	$('#dayBtn').on("click", function() {
//	    	alert('hourBtn!');
		if(chart != null) {
			chart.showLoading();			
		}
		draw3('histoday');
	});
	

	