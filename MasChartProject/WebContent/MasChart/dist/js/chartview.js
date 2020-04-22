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
	           color: '#6e6e70'
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
				animation: {
				    duration: 1000
				},
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
		   series: {
			   color: '#343a40',
		   },
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
	   },
		
		exporting: {
	        buttons: {
	            contextButton: {
	                text: 'Export'
	            }
	        }
	    },
		loading: {
	        hideDuration: 100,
	        showDuration: 100
	    },
	};

	// Apply the theme
	Highcharts.setOptions(Highcharts.theme);
	
	console.log(typeof Highcharts);
	console.log(Highcharts);
	
	var historyTime = 'histominute';
	var symbolA = 'BTC';
	var symbolB = 'USD';	
		
	var chart = null;
	
	var utcWeight = -2;//utc 시간보정	
	var standardTime = 0;
	var updateTime = 0;
	var timeUnit = 0;
	
	var timeSetter = function() {

		//갱신 시간 계산 알고리즘
		var now = Math.floor(new Date() / 1000) + utcWeight; 	
		standardTime = now - (now % timeUnit);
		updateTime = standardTime + timeUnit;		
//		console.log('time setter ' + standardTime + ' + ' + updateTime);
	}
	
	var subtitleDeco = 'Countdown To Bar Close ▶ ';
	
	var draw3 = function(paramHistoryTime, paramSymbolA, paramSymbolB){
		
		console.log('call draw3');
		
		historyTime = paramHistoryTime != undefined && paramHistoryTime !== '' ? paramHistoryTime : historyTime;
		symbolA = paramSymbolA != undefined && paramSymbolA !== ''  ? paramSymbolA : symbolA;
		symbolB = paramSymbolB != undefined && paramSymbolB !== ''  ? paramSymbolB : symbolB;
		
		
		
		var customBtns = [];
		var selBtn = null;
		var timeDeco = '--:--';

		$('#chart-title').text('BTC/USD Chart');
		
		switch (historyTime) {
		case 'histominute':
			$('#chart-subtitle').text('Overview of Latest Minute');	
			timeUnit = 60;
			customBtns.push({type: 'hour',count: 1,text: '1h'});
			customBtns.push({type: 'hour',count: 2,text: '2h'});
			customBtns.push({type: 'hour',count: 4,text: '4h'});
			selBtn = 0;
			break;
		case 'histohour':
			$('#chart-subtitle').text('Overview of Latest Hour');
			timeUnit = 60 * 60;
			customBtns.push({type: 'day',count: 1,text: '1d'});
			customBtns.push({type: 'day',count: 3,text: '3d'});
			customBtns.push({type: 'day',count: 7,text: '7d'});
			selBtn = 2;
			break;
		case 'histoday':
			$('#chart-subtitle').text('Overview of Latest Day');	
			timeUnit = 60 * 60 * 24;		
			customBtns.push({type: 'month',count: 1,text: '1m'});
			customBtns.push({type: 'year',count: 1,text: '1y'});			
			timeDeco = '--:' + timeDeco;			
			break;

		default:
			break;
		}

		customBtns.push({type: 'all',count: 1,text: 'All'});
		if(selBtn == null) {
			selBtn = customBtns.length - 1;			
		}
		
		var chartdata = [];		
		$.getJSON('https://min-api.cryptocompare.com/data/v2/'+ historyTime +'?fsym='+ symbolA +'&tsym='+ symbolB +'&limit=2000', function (data) {
			//console.log(data);
			$.each(data.Data.Data, function(i, item){
				//console.log(item);
				
				chartdata.push([item.time * 1000, item.open, item.high, item.low, item.close]);
			});
			
			if(chart != null) {
				chart.showCustomLoading('Loading data from server...');	
				
			}
			
		}).done(function(){
			chart = Highcharts.stockChart('container', {
				
				title: {
					text: 'BTC/USD' + historyTime.replace('histo', ' ')
				},
				
				rangeSelector: {
					buttons: customBtns,
					selected : selBtn,
					inputEnabled: false
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
					name: 'BTC/USD',
					type: 'candlestick',
					data: chartdata,
					tooltip: {
						valueDecimals: 8
					}
				}],
				
				subtitle: {
			        text: subtitleDeco + timeDeco,
			        align: 'right',
			        floating: true,
			        x: 0,
			        y: +49
				},
				
				xAxis: {
		            events: {
		                afterSetExtremes: function() {
							console.log('change navigator');
						}
		            },
		        },
				
				
			});			
	    	
	    	chart.showCustomLoading = function(str) {
	    		this.showLoading(str);
	    		this.isLoading = true;
	    	};
	    	
	    	chart.hideCustomLoading = function() {
	    		this.hideLoading();
	    		this.isLoading = false;
	    	};			
	    	console.log(chart);
	    	
	    	chart.hideCustomLoading();

	    	timeSetter();
	    	
//			chart.rangeSelector.buttons.push(day);
//			console.log(chart.rangeSelector);			
//			console.log(chart.rangeSelector.buttonOptions);
//			chart.rangeSelector.buttonOptions.splice(1, 2);	
//			chart.rangeSelector.buttons.splice(1, 2);		
//			chart.reflow();
//			console.log(chart.rangeSelector.buttonOptions);
		});
		
	}	
	draw3();
	
	var draw3DataUpdate = function() {
		console.log('call draw3DataUpdate');
		
		if(chart != null) {
			chart.showCustomLoading('Loading data from server...');				
		}
		
		var chartdata = [];
		$.getJSON('https://min-api.cryptocompare.com/data/v2/'+ historyTime +'?fsym='+ symbolA +'&tsym='+ symbolB +'&limit=2000', function (data) {
			//console.log(data);
			$.each(data.Data.Data, function(i, item){
				//console.log(item);
				
				chartdata.push([item.time * 1000, item.open, item.high, item.low, item.close]);
			});
			
			chart.series[0].setData(chartdata);
			
	        chart.hideCustomLoading();
	        
		})
		
		timeSetter();
	}
	
	
	var realtimePrice = function() {
		$.getJSON('https://min-api.cryptocompare.com/data/price?fsym='+ symbolA +'&tsyms=' + symbolB, function (data) {

			$('#chart-price').text(data.USD);
		});
		
	};
	
	
	$('#minuteBtn').on("click", function() {
		draw3('histominute');
	});
	
	$('#hourBtn').on("click", function() {		
		draw3('histohour');
	});
	
	$('#dayBtn').on("click", function() {		
		draw3('histoday');
	});



	
	setInterval(function() {	
		
		realtimePrice();
		
		var sec = Math.floor(new Date() / 1000) + utcWeight - standardTime;

		if(chart != null) {							
			var remainTime = timeUnit - sec;
			var remainTimeHour = parseInt(remainTime / (60 * 60));
			var remainTimeMinute = parseInt(1 <= remainTimeHour ? (remainTime % 3600) / 60 : remainTime / 60);
			var remainTimeSecond = parseInt(1 <= remainTimeMinute ? remainTime % 60 : remainTime);
			
			
			var remainTimeStr = 0 < remainTimeHour ? (10 <= remainTimeHour ? remainTimeHour +':' : '0' + remainTimeHour + ':') : '';
			remainTimeStr += (10 <= remainTimeMinute ? remainTimeMinute : '0' + remainTimeMinute) + ':';
			remainTimeStr += (10 <= remainTimeSecond ? remainTimeSecond : '0' + remainTimeSecond);
						
			$('.highcharts-subtitle').eq(0).html(chart.isLoading ? timeDeco : subtitleDeco + remainTimeStr );				
		}
		
		if(updateTime <= standardTime + sec ) {
			standardTime = updateTime;
			updateTime = updateTime + timeUnit;
			console.log('새로운 기준 ' + standardTime + ' : ' + updateTime );
			
			draw3DataUpdate();
		}
		
	}, 1000);
	

	