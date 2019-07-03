
var data_ = [];
var data_2 = [];
var x,
	y,
	title1,
	title2,
	tip1,
	tip2;
var t1,
	t2,
	t3,
	t4;

function newData(a, b, c, d) {
	t1 = a;
	t2 = b;
	t3 = c;
	t4 = d;

	refreshData(a, b);

	refreshData(c, d);


}

function draw() {
	var len = data_.length > data_2.length ? data_2.length : data_.length;

	for (var i = 0; i < len; i++) {

		data_[i][0] = data_2[i][1];
	}



	//过程量换瞬时量

	if (t1 == 3 || t1 == 4 || t2 == 5) {
		console.log(data_);

		for (var i = data_.length - 1; i > 0; i--) {




			if (data_[i][1] - data_[i - 1][1] >= 0) {

				data_[i][1] = (data_[i][1] - data_[i - 1][1]) * 6;
			}
		}

		//错误数据清零
		for (var i = data_.length - 1; i >= 0; i--) {

			if (data_[i][1] > 100) {

				data_[i][1] = 0;
			}
		}


	}



	//删除光照错误数据

	if (t4 == 1) {
		for (var i = 0; i < data_.length; i++) {

			if (data_[i][0] < 3000 || data_[i][0] > 65500) {
				//delete data_[i];
				data_.splice(i, 1);
				i--;

			}
		}
	}


	if (t1 == 4) {
		for (var i = 0; i < data_.length; i++) {

			if (data_[i][1] == 0) {
				//delete data_[i];
				data_.splice(i, 1);
				i--;

			}
		}
	}

	if (t1 == 5 && t2 == 4) {
		for (var i = 0; i < data_.length; i++) {

			if (data_[i][1] == 0) {
				//delete data_[i];
				data_.splice(i, 1);
				i--;

			}
		}
	}

	if (t1 == 5 && t2 == 5) {
		for (var i = 0; i < data_.length; i++) {

			if (data_[i][1] == 0) {
				//delete data_[i];
				data_.splice(i, 1);
				i--;

			}
		}
	}




	var a = max(data_);
	var b = min(data_);
	var c = avg(data_);

	var d = null; //方差
	var e = null; //标准差


	for (var i = 0; i < data_.length; i++) {
		d += Math.pow(data_[i][1] - c, 2)
	}
	d = (d / (data_.length)).toFixed(2);


	e = Math.sqrt(d).toFixed(2);


	document.getElementById("v1").innerHTML = a + "(" + tip2 + ")";
	document.getElementById("v11").innerHTML = y + "最大值";

	document.getElementById("v2").innerHTML = b + "(" + tip2 + ")";
	document.getElementById("v22").innerHTML = y + "最小值";


	document.getElementById("v3").innerHTML = c + "(" + tip2 + ")";
	document.getElementById("v33").innerHTML = y + "平均值";


	document.getElementById("v4").innerHTML = e + "(" + tip2 + ")";
	document.getElementById("v44").innerHTML = y + "标准差";







	var chart = Highcharts.chart('co', {
		chart : {
			type : 'scatter',
			zoomType : 'xy'
		},
		title : {
			text : title1 + '与' + title2 + '关系散点图'
		},
		subtitle : {
			text : document.ontouchstart === undefined ?
				'鼠标框选可以进行缩放' : '手势操作进行缩放'
		},

		xAxis : {
			title : {
				enabled : true,
				text : x
			},
			startOnTick : true,
			endOnTick : true,
			showLastLabel : true
		},
		yAxis : {
			title : {
				text : y
			}
		},
		legend : {
			layout : 'vertical',
			align : 'left',
			verticalAlign : 'top',
			x : 100,
			y : 70,
			floating : true,
			backgroundColor : (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
			borderWidth : 1
		},
		plotOptions : {
			scatter : {
				marker : {
					radius : 4,
					states : {
						hover : {
							enabled : true,
							lineColor : 'rgb(120,198,149)'
						}
					}
				},
				states : {
					hover : {
						marker : {
							enabled : false
						}
					}
				},
				tooltip : {
					headerFormat : '<b>{series.name}</b><br>',
					pointFormat : '{point.x}' + tip1 + ',' + '{point.y}' + tip2
				}
			}
		},
		series : [ {
			name : '散点关系',
			color : 'rgb(120,198,249)',
			data : data_
		} ]
	});

}



function refreshData(parentId, childId, date) {




	//生成请求信息数组，之后根据用户请求参数调用对应的参数加载数据
	var options = [
		[ [ 'loadConsumptionServlet', 'getVoltageOfLoadConsumption', '负载消耗输出电压', '输出电压(V)', 'V' ],
			[ 'loadConsumptionServlet', 'getCurrentOfLoadConsumption', '负载消耗输出电流', '输出电流(A)', 'A' ],
			[ 'loadConsumptionServlet', 'getPowerOfLoadConsumption', '负载消耗输出功率', '输出功率(W)', 'W' ],
			[ 'loadConsumptionServlet', 'getDayConsumeOfLoadConsumption', '负载消耗日耗电量', '日耗电量(kw·h)', 'kw·h' ],
			[ 'loadConsumptionServlet', 'getMonthConsumeOfLoadConsumption', '负载消耗月耗电量', '月耗电量(kw·h)', 'kw·h' ],
			[ 'loadConsumptionServlet', 'getAllConsumeOfLoadConsumption', '负载消耗总耗电量', '总耗电量(kw·h)', 'kw·h' ] ],
		[ [ 'environmentalParametersServlet', 'getIlluminanceOfEnvironmentalParameters', '环境参数光照度', '光照度(KLUS)', 'KLUS' ],
			[ 'environmentalParametersServlet', 'getWindSpeedOfEnvironmentalParameters', '环境参数风速', '风速(m/s)', 'm/s' ],
			[ 'environmentalParametersServlet', 'getTemperatureOfEnvironmentalParameters', '环境参数温度', '温度(℃)', '℃' ] ],
		[ [ 'electricityParameterServlet', 'getVoltageOfElectricityParameter', '市电参数输出电压', '输出电压(V)', 'V' ],
			[ 'electricityParameterServlet', 'getCurrentOfElectricityParameter', '市电参数输出电流', '输出电流(A)', 'A' ],
			[ 'electricityParameterServlet', 'getPowerOfElectricityParameter', '市电参数输出功率', '输出功率(W)', 'W' ],
			[ 'electricityParameterServlet', 'getDaySupplyOfElectricityParameter', '市电参数供电功率', '供电功率(kw)', 'kw' ],
			[ 'electricityParameterServlet', 'getMonthSupplyOfElectricityParameter', '市电参数月供电量', '月供电量(kw·h)', 'kw·h' ],
			[ 'electricityParameterServlet', 'getAllSupplyOfElectricityParameter', '市电参数总供电量', '总供电量(kw·h)', 'kw·h' ] ],
		[ [ 'inverterServlet', 'getVoltageOfInverter', '逆变器输出电压', '输出电压(V)', 'V' ],
			[ 'inverterServlet', 'getCurrentOfInverter', '逆变器输出电流', '输出电流(A)', 'A' ],
			[ 'inverterServlet', 'getPowerOfInverter', '逆变器输出功率', '输出功率(W)', 'W' ],
			[ 'inverterServlet', 'getDayConsumeOfInverter', '逆变器供电功率', '供电功率(kw)', 'kw' ],
			[ 'inverterServlet', 'getMonthConsumeOfInverter', '逆变器月供电量', '月供电量(kw·h)', 'kw·h' ],
			[ 'inverterServlet', 'getAllConsumeOfInverter', '逆变器总供电量', '总供电量(kw·h)', 'kw·h' ] ],
		[ [ 'solarControllerServlet', 'getVoltageOfSolarController', '太阳能控制器电池电压', '电池电压(V)', 'v' ],
			[ 'solarControllerServlet', 'getInputCurrentOfSolarController', '太阳能控制器光伏输入电流', '光伏输入电流(A)', 'A' ],
			[ 'solarControllerServlet', 'getOutputCurrentOfSolarController', '太阳能控制器负载输出电流', '负载输出电流(A)', 'A' ],
			[ 'solarControllerServlet', 'getDischargeCurrentOfSolarController', '太阳能控制器充放电电流', '充放电电流(A)', 'A' ],
			[ 'solarControllerServlet', 'getDayGenerationOfSolarController', '太阳能控制器日发电量', '日发电量(kw·h)', 'kw·h' ],
			[ 'solarControllerServlet', 'getMonthGenerationOfSolarController', '太阳能控制器月发电量', '月发电量(kw·h)', 'kw·h' ],
			[ 'solarControllerServlet', 'getAllGenerationOfSolarController', '太阳能控制器总发电量', '总发电量(kw·h)', 'kw·h' ],
			[ 'solarControllerServlet', 'getAllRuntimeOfSolarController', '太阳能控制器总运行时间', '总运行时间(h)', 'h' ] ]
	];
	var type = options[parentId - 1][childId - 1][1];

	$('#date_button').unbind().one('click', function() {
		newData(t1, t2, t3, t4);

	});
	if (type.indexOf("Month") != -1) {
		$("#startDate").attr("type", "month");
		$("#endDate").attr("type", "month");
	} else {
		$("#startDate").attr("type", "date");
		$("#endDate").attr("type", "date");
	}

	if (date) {
		//判断用户查询时间是否合法
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		if (startDate == '' || endDate == '') {
			alert('起始时间不能为空!');
			return;
		}
		var start = Date.parse(startDate.replace('/-/g', '/'));
		var end = Date.parse(endDate.replace('/-/g', '/'));
		var day = (end - start) / (24 * 60 * 60 * 1000);
		if (day <= 0) {
			alert('结束日期要大于开始日期!')
			return;
		} else if (day > 7 && (type.indexOf("Month") == -1)) {
			alert('一次只能查询一周的数据!');
			return;
		}
	}




	var params = {
		'type' : options[parentId - 1][childId - 1][1],
		'startDate' : $('#startDate').val(),
		'endDate' : $('#endDate').val()
	};
	if (type.indexOf("Month") != -1) {
		if ($('#startDate').val() == "") {
			var date = new Date();
			var d = new Date();
			d.setMonth(date.getMonth() - 1);
			params = {
				'type' : options[parentId - 1][childId - 1][1],
				'startDate' : d.getFullYear() + "-" + (d.getMonth() + 1) + "-01",
				'endDate' : date.getFullYear() + "-" + (date.getMonth() + 1) + "-31"
			}
		} else {
			params = {
				'type' : options[parentId - 1][childId - 1][1],
				'startDate' : $('#startDate').val() + "-01",
				'endDate' : $('#endDate').val() + "-31"
			}
		}
	}

	if (type.indexOf("All") != -1) {
		if ($('#startDate').val() == "") {
			var date = new Date();
			var d = new Date();
			d.setMonth(date.getMonth() - 1);
			params = {
				'type' : options[parentId - 1][childId - 1][1],
				'startDate' : "2017-07-06",
				'endDate' : date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
			}
		}
	}
	showchart(options, parentId, childId, []);
	//if($('#startDate').val() == "") {return;}
	$('#startDate').val('');
	$('#endDate').val('');
	$.post(options[parentId - 1][childId - 1][0], params, function(data) {
		var jsonData = JSON.parse(data);
		if (jsonData == '') {
			alert('所选时间段没有数据!');
			return;
		}
		var alldata1 = [];
		for (i = 0; i < jsonData.length; i++) {
			rz = jsonData[i][0];
			tm = jsonData[i][1];
			var someDate = new Date(Date.parse(rz));
			var tms = Date.UTC(someDate.getFullYear(), someDate.getMonth(), someDate.getDate(), someDate.getHours(), someDate.getMinutes(), someDate.getSeconds());
			alldata1.push([ tms, tm ]);

		}
		showchart(options, parentId, childId, alldata1);





		if (parentId != 2) {
			data_ = alldata1;
			title1 = options[parentId - 1][childId - 1][2];
			y = options[parentId - 1][childId - 1][3];
			tip2 = options[parentId - 1][childId - 1][4]
		} else if (parentId == 2) {
			title2 = options[parentId - 1][childId - 1][2]
			x = options[parentId - 1][childId - 1][3]
			tip1 = options[parentId - 1][childId - 1][4]
			data_2 = alldata1;
		}

		if (data_.length > 0 && data_2.length > 0) {
			console.log('2222', data_);

			console.log('1111', data_2);
			draw();

		}


	});




}





var chart = null;

function showchart(options, parentId, childId, alldata1) {
	var flag = true;

}


function max(alldata1) {
	var max = 0;

	for (var i = 1; i < alldata1.length; i++) {
		if (alldata1[i][1] > max) {
			max = alldata1[i][1];
		}

	}

	return max.toFixed(2);

}


function min(alldata1) {
	var min = 10000;
	for (var i = 1; i < alldata1.length; i++) {
		if (alldata1[i][1] < min) {
			min = alldata1[i][1];
		}

	}

	return min.toFixed(2);


}

function avg(alldata1) {
	var sum = 0;
	for (var i = 1; i < alldata1.length; i++) {
		sum = sum + alldata1[i][1];
	}
	sum = sum / (alldata1.length);
	return sum.toFixed(2);

}




//显示二级菜单
function showChild(id) {
	$('#childSelect_' + id).css('display', 'block');
}
//隐藏二级菜单
function hiddenChild(id) {
	$('#childSelect_' + id).css('display', 'none');
}
function download(level) {
	if (!level) {
		location.href = "login.jsp";
	} else {
		openWindow('download.jsp', '光伏数据下载', 600, 400);
	}
}
//开启新窗口，并设置窗口的属性
function openWindow(url, name, width, height) {
	var left = (parent.innerWidth - width) / 2;
	var top = (parent.innerHeight - height) / 2;
	window.open(url, name, "top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",toolbar=no,location=no,directories=no,resizable=no,status=no,menubar=no,scrollbars=yes");
}
function startDownload(level) {
	//判断用户查询时间是否合法
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	if (startDate == '' || endDate == '') {
		alert('时间不能为空!');
		return;
	}
	var start = Date.parse(startDate.replace('/-/g', '/'));
	var end = Date.parse(endDate.replace('/-/g', '/'));
	var day = (end - start) / (24 * 60 * 60 * 1000) + 1;
	if (day <= 0) {
		alert('结束日期要大于开始日期!')
		return;
	} else if (day > 7 && level == 0) {
		alert('普通用户一次最多下载一周的数据!');
		return;
	} else if (day > 365 && level == 1) {
		alert('vip会员一次最多下载一年的数据!');
		return;
	}
	var options = [ [ 'loadConsumptionServlet', 'getExcelOfLoadConsumption' ],
		[ 'environmentalParametersServlet', 'getExcelOfEnvironmentalParameters' ],
		[ 'inverterServlet', 'getExcelOfInverter' ],
		[ 'electricityParameterServlet', 'getExcelOfElectricityParameter' ],
		[ 'solarControllerServlet', 'getExcelOfSolarController' ], ];
	location.href = options[$('#select').val() - 1][0] + "?type=" + options[$('#select').val() - 1][1] + "&startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val();
}