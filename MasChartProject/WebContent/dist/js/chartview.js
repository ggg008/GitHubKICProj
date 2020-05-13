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
	Highcharts.themeNormal = {
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

	    navigation: {
	        buttonOptions: {
	            symbolStroke: '#666666',
	            theme: {
	                fill: 'white'
	            }
	        }
	    },
	    navigator: {
	        handles: {
	            backgroundColor: '#666',
	            borderColor: '#AAA'
	        },
	        outlineColor: '#CCC',
	        maskFill: 'rgba(255,255,255,0.1)',
	        series: {
	            color: '#343a40',
	            lineColor: '#000000'
	        },
	        xAxis: {
	            gridLineColor: '#D0D0D8'
	        }
	    },
//	    rangeSelector: {
//	        buttonTheme: {
//	            fill: 'white',
//	            stroke: '#C0C0C8',
//	            'stroke-width': 1,
//	            states: {
//	                select: {
//	                    fill: '#D0D0D8'
//	                }
//	            }
//	        }
//	    },
	    rangeSelector: {
	        buttonTheme: {
	            fill: 'white',
	            stroke: '#C0C0C8',
	            style: {
	                color: '#000'
	            },
	            states: {
	                hover: {
	                    fill: '#707073',
	                    stroke: '#000000',
	                    style: {
	                        color: 'white'
	                    }
	                },
	                select: {
	                    fill: '#d0d0d8',
	                    stroke: '#000000',
	                    style: {
	                        color: 'black'
	                    }
	                }
	            }
	        },
	        inputBoxBorderColor: '#505053',
	        inputStyle: {
	            backgroundColor: '#333',
	            color: 'silver'
	        },
	        labelStyle: {
	            color: 'silver'
	        }
	    },
	    scrollbar: {
	        barBackgroundColor: '#808083',
	        barBorderColor: '#808083',
	        buttonArrowColor: '#CCC',
	        buttonBackgroundColor: '#606063',
	        buttonBorderColor: '#606063',
	        rifleColor: '#FFF',
	        trackBackgroundColor: '#404043',
	        trackBorderColor: '#C0C0C8',	    
	    },
	
	    
	    loading: {
	        hideDuration: 100,
	        showDuration: 100
	    },
	};
	
	Highcharts.themeDark = {
	    colors: ['#2b908f', '#90ee7e', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066',
	        '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
	    chart: {
	        backgroundColor: {
	            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
	            stops: [
	                [0, '#2a2a2b'],
	                [1, '#3e3e40']
	            ]
	        },
	        style: {
	            fontFamily: '\'Unica One\', sans-serif'
	        },
	        plotBorderColor: '#606063'
	    },
	    title: {
	        style: {
	            color: '#E0E0E3',
	            //textTransform: 'uppercase',
	            fontSize: '20px',
	            fontWeight: 'bold'
	        }
	    },
	    subtitle: {
	        style: {
	            color: '#E0E0E3',
	            //textTransform: 'uppercase'
	        }
	    },
	    xAxis: {
	        //gridLineColor: '#707073',
	        labels: {
	            style: {
	                color: '#E0E0E3'
	            }
	        },
	        lineColor: '#707073',
	        minorGridLineColor: '#505053',
	        tickColor: '#707073',
	        title: {
	            style: {
	                color: '#A0A0A3'
	            }
	        }
	    },
	    yAxis: {
	        //gridLineColor: '#707073',
	        labels: {
	            style: {
	                color: '#E0E0E3'
	            }
	        },
	        lineColor: '#707073',
	        minorGridLineColor: '#505053',
//	        tickColor: '#707073',
//	        tickWidth: 1,
	        title: {
	            style: {
	                color: '#A0A0A3'
	            }
	        }
	    },
//	    tooltip: {
//	        backgroundColor: 'rgba(0, 0, 0, 0.85)',
//	        style: {
//	            color: '#F0F0F0'
//	        }
//	    },
	    plotOptions: {
	        series: {
	            dataLabels: {
	                color: '#F0F0F3',
	                style: {
	                    fontSize: '13px'
	                }
	            },
	            marker: {
	                lineColor: '#333'
	            }
	        },
	        boxplot: {
	            fillColor: '#505053'
	        },
	        candlestick: {
	            lineColor: 'white'
	        },
	        errorbar: {
	            color: 'white'
	        }
	    },
	    legend: {
	        backgroundColor: 'rgba(0, 0, 0, 0.5)',
	        itemStyle: {
	            color: '#E0E0E3'
	        },
	        itemHoverStyle: {
	            color: '#FFF'
	        },
	        itemHiddenStyle: {
	            color: '#606063'
	        },
	        title: {
	            style: {
	                color: '#C0C0C0'
	            }
	        }
	    },
	    credits: {
	        style: {
	            color: '#666'
	        }
	    },
	    labels: {
	        style: {
	            color: '#707073'
	        }
	    },
	    drilldown: {
	        activeAxisLabelStyle: {
	            color: '#F0F0F3'
	        },
	        activeDataLabelStyle: {
	            color: '#F0F0F3'
	        }
	    },
	    navigation: {
	        buttonOptions: {
	            symbolStroke: '#DDDDDD',
	            theme: {
	                fill: '#505053'
	            }
	        }
	    },
	    // scroll charts
	    rangeSelector: {
	        buttonTheme: {
	            fill: '#505053',
	            stroke: '#000000',
	            style: {
	                color: '#CCC'
	            },
	            states: {
	                hover: {
	                    fill: '#707073',
	                    stroke: '#000000',
	                    style: {
	                        color: 'white'
	                    }
	                },
	                select: {
	                    fill: '#000003',
	                    stroke: '#000000',
	                    style: {
	                        color: 'white'
	                    }
	                }
	            }
	        },
	        inputBoxBorderColor: '#505053',
	        inputStyle: {
	            backgroundColor: '#333',
	            color: 'silver'
	        },
	        labelStyle: {
	            color: 'silver'
	        }
	    },
	    navigator: {
	        handles: {
	            backgroundColor: '#666',
	            borderColor: '#AAA'
	        },
	        outlineColor: '#CCC',
	        maskFill: 'rgba(255,255,255,0.1)',
	        series: {
	            color: '#7798BF',
	            lineColor: '#A6C7ED'
	        },
	        xAxis: {
	            gridLineColor: '#505053'
	        }
	    },
	    scrollbar: {
	        barBackgroundColor: '#808083',
	        barBorderColor: '#808083',
	        buttonArrowColor: '#CCC',
	        buttonBackgroundColor: '#606063',
	        buttonBorderColor: '#606063',
	        rifleColor: '#FFF',
	        trackBackgroundColor: '#404043',
	        trackBorderColor: '#404043'
	    },

	    loading: {
	        hideDuration: 100,
	        showDuration: 100
	    },
	};
	
	
	
	// Apply the theme
	//Highcharts.setOptions(Highcharts.themeNormal);


	

	
	var cookies = document.cookie;
	//console.log(cookies.length);
	//console.log(cookies);
	
	cookies.trim();
	cookies = cookies.split('; ');
	
	//output cookie
	var cookieJson = '{';
	cookies.forEach( function(elt) {
		cookieJson += '"' + elt.split('=')[0] + '":"' + elt.split('=')[1] + '",';				
	} );	
	cookieJson = cookieJson.substr(0, cookieJson.length - 1);	
	
	cookieJson += '}';

	console.log(cookieJson);
	cookieJson = JSON.parse(cookieJson);	
	
	
	var historyTime = cookieJson.historyTime != undefined ? cookieJson.historyTime : 'histominute';
	var fromSymbol = cookieJson.fromSymbol != undefined ? cookieJson.fromSymbol : 'BTC';
	var toSymbol = cookieJson.toSymbol != undefined ? cookieJson.toSymbol : 'USD';
	var theme = cookieJson.theme != undefined ? cookieJson.theme : 'themeNormal';
	
	var setTheme = function(newTheme) {
		
		if(newTheme === 'themeNormal'){		
			$(".page-wrapper").removeAttr("style");
	    	$("#theme-point1").removeAttr("style");
	    	// Apply the theme
	    	Highcharts.setOptions(Highcharts.themeNormal);
	    	var date = new Date();
			date.setDate(date.getDate() + 30);//한달유지 
			document.cookie = 'theme=themeNormal;expires=' + date.toString();
			theme = 'themeNormal';
		}
		else if (newTheme === 'themeDark') {
			
			$(".page-wrapper").css("background", "#212223");
			$("#theme-point1").css("background", "#191919");
			// Apply the theme
			Highcharts.setOptions(Highcharts.themeDark);
			var date = new Date();
			date.setDate(date.getDate() + 30);//한달유지 
			document.cookie = 'theme=themeDark;expires=' + date.toString();
			theme = 'themeDark';
		}
	}
	
	setTheme(theme);
	
	var chart = null;
	var chart2 = null;
	
	var utcWeight = -2;//utc 시간보정	
	var standardTime = 0;
	var updateTime = 0;
	var timeUnit = 0;
	var preWidth = window.outerWidth;
	var preHeight = window.outerHeight;
		
	var changeCommunityHeight = function() {
		$('#community-box').removeAttr('style');
		var communtBoxHeight = $('.left-sidebarNeo').height() - $('#commentform').height();
		communtBoxHeight -= ($('#navbarSupportedContent').height() * 2);//안전빵
		
		//$('.left-sidebarNeo').height();
		
		$('#community-box').attr('style', 'height : ' + communtBoxHeight + 'px;');
	};
	
	changeCommunityHeight();
	
	var timeSetter = function () {	
	    //갱신 시간 계산 알고리즘
	    var now = Math.floor(new Date() / 1000) + utcWeight;
	    standardTime = now - (now % timeUnit);
	    updateTime = standardTime + timeUnit;
	    //		console.log('time setter ' + standardTime + ' + ' + updateTime);
	}
	
	
	var subtitleDecoLg = 'Countdown To Bar Close ▶ ';
	var subtitleDecoSm = 'Bar Close ▶  ';
	var subtitleDecoTiny = '▶  ';
	var timeDeco = '--:--';
	
	var draw3 = function (paramHistoryTime, paramFromSymbol, paramToSymbol) {
	
	    console.log('call draw3');
		
        if (chart != null) {
            chart.showCustomLoading('Loading data from server...');
        }
        chart = null;
        
	    historyTime = paramHistoryTime != undefined && paramHistoryTime !== '' ? paramHistoryTime : historyTime;
	    fromSymbol = paramFromSymbol != undefined && paramFromSymbol !== '' ? paramFromSymbol : fromSymbol;
	    toSymbol = paramToSymbol != undefined && paramToSymbol !== '' ? paramToSymbol : toSymbol;
	
	    //input cookie
	    var date = new Date();
		date.setDate(date.getDate() + 30);//한달유지 
	
		document.cookie = 'historyTime='+historyTime+';expires=' + date.toString();
		document.cookie = 'fromSymbol='+fromSymbol+';expires=' + date.toString();
		document.cookie = 'toSymbol='+toSymbol+';expires=' + date.toString();
				
		//console.log(document.cookie);
	
	    var customBtns = [];
	    var selBtn = null;
	
	    $('#chart-title').text( fromSymbol + '/' + toSymbol +'Chart');
	
	    switch (historyTime) {
	        case 'histominute':
	            $('#chart-subtitle').text('Overview of Latest Minute');
	            timeUnit = 60;
	            customBtns.push({ type: 'hour', count: 1, text: '1h' });
	            customBtns.push({ type: 'hour', count: 2, text: '2h' });
	            customBtns.push({ type: 'hour', count: 4, text: '4h' });
	            selBtn = 0;
	            timeDeco = '--:--';
	            break;
	        case 'histohour':
	            $('#chart-subtitle').text('Overview of Latest Hour');
	            timeUnit = 60 * 60;
	            customBtns.push({ type: 'day', count: 1, text: '1d' });
	            customBtns.push({ type: 'day', count: 3, text: '3d' });
	            customBtns.push({ type: 'day', count: 7, text: '7d' });
	            customBtns.push({ type: 'month', count: 1, text: '1m' });
	            selBtn = 2;
	            timeDeco = '--:--';
	            break;
	        case 'histoday':
	            $('#chart-subtitle').text('Overview of Latest Day');
	            timeUnit = 60 * 60 * 24;
	            customBtns.push({ type: 'month', count: 1, text: '1m' });
	            customBtns.push({ type: 'month', count: 3, text: '3m' });
	            customBtns.push({ type: 'year', count: 1, text: '1y' });
	            selBtn = 1;
	            timeDeco = '--:--:--';
	            break;
	
	        default:
	            break;
	    }
	
	    customBtns.push({ type: 'all', count: 1, text: 'All' });
	    if (selBtn == null) {
	        selBtn = customBtns.length - 1;
	    }
	
	    var chartdata = [];
	    var chartdataRSI = [];
	    
	    
	    var API = './chartView.do?historyTime='+ historyTime.replace('histo', '') +'&fsym='+ fromSymbol +'&tsym=' + toSymbol;
	    
	    
	    //https://min-api.cryptocompare.com/data/v2/histominute?fsym=BTC&tsym=USD&limit=2000
    	$.getJSON(API, function (data) {
    		//console.log(data);    		
	        
	        //console.log(chartdata);
	        console.log('chartdata draw3');
	        
	        var aus = [];
	        var ads = [];

        	var au = 0;
        	var ad = 0;
        	
    		$.each(data.Data, function (i, item) {
    			//console.log(item);

    			var open = item.open;
    			var close = item.close;
	        	var high = item.high;
	        	var low = item.low;
	        	
	        	high = close < high ? high : close;
	        	high = open < high ? high : open;
	        	low = low < close ? low : close;
	        	low = low < open ? low : open;
	        	
	            chartdata.push([item.time * 1000, item.open, high, low, item.close]);
	            
	            
	            if(0 < i){
	            	var compareVal = item.close - data.Data[i - 1].close;
	            	
	            	aus.push(0 < compareVal ? compareVal : 0);
	            	ads.push(compareVal < 0 ? compareVal : 0);
	            } else {
	            	aus.push(0);
	            	ads.push(0);	            	
	            }
	            
	            var avg = 14;
	            
	            if(i < avg){
	            	chartdataRSI.push([item.time * 1000, 0]);
	            } else {
	            	
	            	if(chartdataRSI.length < avg + 1) {
	            		au = 0;
	            		ad = 0;
	            		for(var idx = i - avg; idx < i; ++idx) {
	            			au += aus[idx];
	            			ad += Math.abs(ads[idx]);
	            		}	            		
	            	} else {
	            		au = (au * 13 + aus[aus.length - 1]) / 14;
	            		ad = (ad * 13 + Math.abs(ads[ads.length - 1]) ) / 14;
	            	}
	            	
	            	
	            	var rs = au / Math.abs(ad);
	            	
	            	chartdataRSI.push([item.time * 1000, au / (au + ad) * 100]);
	            }
	            
	            
    		});
    		

    		
//    		$('#chartlist-container').empty();
    		$.each(data.LastPriceData, function (i, item) {
    			
//    			var elt = '<div class="d-flex flex-row m-t-5" id="item'+ item.propName +'">' +
//                        	'<button type="button" class="btn btn-success btn-sm w-100">' + item.propName + item.close +'</button>' +
//                        '</div>';
//    			
//    			//console.log(item.propName);
//    			$('#chartlist-container').append(elt);

    			$('#item'+ item.propName).find("#sym").text(item.propName);
    			$('#item'+ item.propName).find("#price").text( '$ ' + item.close);
    			$('#bigitem'+ item.propName).find("#sym").text(item.propName);
    			$('#bigitem'+ item.propName).find("#price").text( '$ ' + item.close);
    			
    			$('#item' + item.propName).off();
    			var idx = item.propName.indexOf('USD');
    			$('#item' + item.propName).on("click", function () {
    			    draw3( undefined, item.propName.substring(0, idx), item.propName.substring(idx, item.propName.length) );
    			});
    			
    		});
    		

	        $('#chart-price').text('$ ' + data.Data[data.Data.length - 1].close);
	
	    }).done(function () {
	    	
	        chart = Highcharts.stockChart('container', {
	
	            title: {
	                text: 375 < window.outerWidth ? fromSymbol + '/' + toSymbol + historyTime.replace('histo', ' ') : ''
	            },
	
	            rangeSelector: {
	                buttons: customBtns,
	                selected: selBtn,
	                inputEnabled: false,
	                //y : 375 < window.outerWidth ? 0 : -35
	                
	            },
	            xAxis: {
	            	events: {
	            		afterSetExtremes: function () {
	            			//							console.log('change navigator');
	            		}
	            	},
	            },
	    	    yAxis: [{
	                height: '80%',
	    	        resize: {
	    	            enabled: true
	    	        }
	    	    }, {
	                labels: {
	                    align: 'left'
	                },
	                top: '80%',
	                height: '20%',
	                offset: 0
	            }],
	            series: [{
	                name: fromSymbol + toSymbol,
	                type: 'candlestick',
	                data: chartdata,
	                tooltip: {
	                    valueDecimals: 8
	                }
	            }, {
	                name: 'RSI',
	                type: 'line',
	                data: chartdataRSI, 
	                yAxis: 1
	            }],
	            tooltip: {
	                shape: 'square',
	                headerShape: 'callout',
	                borderWidth: 0,
	                shadow: false,
	                positioner: function (width, height, point) {
	                    var chart = this.chart,
	                        position;

	                    if (point.isHeader) {
	                        position = {
	                            x: Math.max(
	                                // Left side limit
	                                chart.plotLeft,
	                                Math.min(
	                                    point.plotX + chart.plotLeft - width / 2,
	                                    // Right side limit
	                                    chart.chartWidth - width - chart.marginRight
	                                )
	                            ),
	                            y: point.plotY
	                        };
	                    } else {
	                        position = {
	                            x: point.series.chart.plotLeft,
	                            y: point.series.yAxis.top - chart.plotTop
	                        };
	                    }

	                    return position;
	                }
	            },
	            subtitle: {
	                text: (window.outerWidth < 450 ? subtitleDecoSm : subtitleDecoLg) + timeDeco,
	                align: 'right',
	                floating: true,
	                x: 0,
	                y: 375 < window.outerWidth ? 52 : 42 
	            },
	
	            exporting: {
	    	        buttons: {
	    	            contextButton: {
	    	                text: 375 < window.outerWidth ? 'Export' : ''
	    	            }
	    	        }
	    	    },
	    	    
	
	
	        });
	        chart.showCustomLoading = function (str) {
	            this.showLoading(str);
	            this.isLoading = true;
	        };
	
	        chart.hideCustomLoading = function () {
	            this.hideLoading();
	            this.isLoading = false;
	        };
	        //	    	console.log(chart);
	
	        chart.hideCustomLoading();
	
	        timeSetter();

			$('.highcharts-indicators').hide();
			$('.highcharts-separator').eq(0).hide();
			$('.highcharts-credits').hide();
			$('.highcharts-toggle-toolbar').hide();
			
	        //			chart.rangeSelector.buttons.push(day);
	        //			console.log(chart.rangeSelector);			
	        //			console.log(chart.rangeSelector.buttonOptions);
	        //			chart.rangeSelector.buttonOptions.splice(1, 2);	
	        //			chart.rangeSelector.buttons.splice(1, 2);		
	        //			chart.reflow();
	        //			console.log(chart.rangeSelector.buttonOptions);
	        
//	        console.log(chart);
	        
//	        chart2 = Highcharts.stockChart('container2', {
//	            series: [{
//	                name: fromSymbol + toSymbol,
//	                type: 'candlestick',
//	                data: chartdata,
//	                tooltip: {
//	                    valueDecimals: 8
//	                }
//	            }],
//	            navigator: {
//	                enabled: false
//	            },
//	            rangeSelector: {
//	                enabled: false
//	            },
//	        });
	        
	    });
    	
    	
	
	}
	draw3();
	
	var testCountFixed = 5;
	var testCount = testCountFixed;
	
	var realtimePrice = function () {
//	    $.getJSON('https://min-api.cryptocompare.com/data/price?fsym=' + fromSymbol + '&tsyms=' + toSymbol, function (data) {
		/*
		 */

	    var chartdata = [];
	    var chartdataRSI = [];
		
		var API = './chartView.do?historyTime='+ historyTime.replace('histo', '') +'&fsym='+ fromSymbol +'&tsym=' + toSymbol;
	    $.getJSON(API, function (data) {
	    	
	    	//console.log(data.Data[Data.length - 1]);
	    	
	        $('#chart-price').text('$ ' + data.Data[data.Data.length - 1].close);
	        
	        console.log('chartdata realtimePrice');
	        	        
	        var aus = [];
	        var ads = [];

        	var au = 0;
        	var ad = 0;
	        
	        $.each(data.Data, function (i, item) {
	            //console.log(item);
	

    			var open = item.open;
    			var close = item.close;
	        	var high = item.high;
	        	var low = item.low;
	        	
	        	high = close < high ? high : close;
	        	high = open < high ? high : open;
	        	low = low < close ? low : close;
	        	low = low < open ? low : open;
	        	
	            chartdata.push([item.time * 1000, item.open, high, low, item.close]);
	            

	            if(0 < i){
	            	var compareVal = item.close - data.Data[i - 1].close;
	            	
	            	aus.push(0 < compareVal ? compareVal : 0);
	            	ads.push(compareVal < 0 ? compareVal : 0);
	            } else {
	            	aus.push(0);
	            	ads.push(0);	            	
	            }
	            
	            var avg = 14;
	            
	            if(i < avg){
	            	chartdataRSI.push([item.time * 1000, 0]);
	            } else {
	            	
	            	if(chartdataRSI.length < avg + 1) {
	            		au = 0;
	            		ad = 0;
	            		for(var idx = i - avg; idx < i; ++idx) {
	            			au += aus[idx];
	            			ad += Math.abs(ads[idx]);
	            		}	            		
	            	} else {
	            		au = (au * 13 + aus[aus.length - 1]) / 14;
	            		ad = (ad * 13 + Math.abs(ads[ads.length - 1]) ) / 14;
	            	}
	            	
	            	
	            	var rs = au / Math.abs(ad);
	            	
	            	chartdataRSI.push([item.time * 1000, au / (au + ad) * 100]);
	            }
	        });
	        
//	        console.log(chartdataRSI);
	        
	        $.each(data.LastPriceData, function (i, item) {
    			$('#item'+ item.propName).find("#sym").text(item.propName);
    			$('#item'+ item.propName).find("#price").text( '$ ' + item.close);
    			$('#bigitem'+ item.propName).find("#sym").text(item.propName);
    			$('#bigitem'+ item.propName).find("#price").text( '$ ' + item.close);
    		});
	        
	        chart.series[0].setData(chartdata, true);
	        chart.series[1].setData(chartdataRSI, true);
	        
	        --testCount;
	        if(testCount <= 0) {
	        	testCount = testCountFixed;
//	        	console.log(data);	        	
	        }
	        
	        
	    });
	    
	};
	
	
	$('#minuteBtn').on("click", function () {
	    draw3('histominute');
	});
	
	$('#hourBtn').on("click", function () {
	    draw3('histohour');
	});
	
	$('#dayBtn').on("click", function () {
	    draw3('histoday');
	});

	
	
	var limitConst = 5;
	var limit = limitConst;
	
	//console.log('리미트 시작값 : ' + standardTime + ':' + (standardTime + utcWeight) % limitConst);
	setInterval(function () {
	
	    var sec = Math.floor(new Date() / 1000) + utcWeight - standardTime;
	    --limit;
	
	    if(limit <= 0) {
			
			limit = sec < limitConst ? sec : limitConst - (sec % limitConst);
			realtimePrice();
		}
	    
	    if (chart != null) {
	        var remainTime = timeUnit - sec;
	        var remainTimeHour = parseInt(remainTime / (60 * 60));
	        var remainTimeMinute = parseInt(1 <= remainTimeHour ? (remainTime % 3600) / 60 : remainTime / 60);
	        var remainTimeSecond = parseInt(1 <= remainTimeMinute ? remainTime % 60 : remainTime);
	
	
	        var remainTimeStr = 0 < remainTimeHour ? (10 <= remainTimeHour ? remainTimeHour + ':' : '0' + remainTimeHour + ':') : '';
	        remainTimeStr += (10 <= remainTimeMinute ? remainTimeMinute : '0' + remainTimeMinute) + ':';
	        remainTimeStr += (10 <= remainTimeSecond ? remainTimeSecond : '0' + remainTimeSecond);

	        remainTimeStr = 
	        	remainTimeHour < 0 || 100 <= remainTimeHour || 
	        	remainTimeMinute < 0 || 100 <= remainTimeMinute || 
	        	remainTimeSecond < 0 || 100 <= remainTimeSecond ||
	        	chart.isLoading
	        	? timeDeco : remainTimeStr;
	        
	        var log = '\n log : ';
	        log += limit;
	        
	        
	        
	        $('.highcharts-subtitle').eq(0).html((window.outerWidth < 450 ? subtitleDecoSm : subtitleDecoLg) + remainTimeStr);
//	        $('.highcharts-subtitle').eq(0).html($('.highcharts-subtitle').eq(0).html() + log);
	        //console.log(chart);
	    }
	
	    if (updateTime <= standardTime + sec) {
	    	
	    	timeSetter();
	    	
	        console.log('새로운 기준 ' + standardTime + ' : ' + updateTime);
	
	        //draw3DataUpdate();
	    }
	
	}, 1000);
	
	$(window).resize(function() {

		//console.log('창크기 변화 감지 ' + preHeight + ' '+ window.outerHeight + ' ' + window.outerHeight);
		//창크기 변화 감지
		if(preWidth != window.outerWidth){
			if( (375 < preWidth && window.outerWidth <= 375) || ( preWidth <= 375 && 375 < window.outerWidth )){				
				draw3();
			}
			
			
			preWidth = window.outerWidth;
		}
		if(preHeight != window.outerHeight){
			
			changeCommunityHeight();
			
			//console.log('호출 : ' + window.outerHeight + 'navbar : ' + $('#navbarSupportedContent').height() + ' ' + $('#commentform').height());
			
			
			
			preHeight = window.outerHeight;
		}
		
		
	});
	
	
