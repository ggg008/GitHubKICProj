/**
 * 
 */
// 선언
function doFunc1() {
	console.log('call doFunc1');
	console.log('Hello Function');
}

function doFunc2(data1, data2) {
	console.log('call doFunc2 data1 : ' + data1);
}

function doFunc3(data1) { // 마지막에 정의 된것만 호출(오버로딩 안됨)
	console.log('call doFunc3-1 data1 : ' + data1);
}

function doFunc3(data1, data2) {
	console.log('call doFunc3-2 data1 : ' + data1 + ' data2 : ' + data2);
}

function doFunc4(data1, data2) {
	var sum = data1 + data2;
	console.log('call doFunc4');
	return sum;
}