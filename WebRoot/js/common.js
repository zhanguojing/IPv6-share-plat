//获取负载消耗电压数据
function refreshData(parentId,childId,date) {
	
	
	//生成请求信息数组，之后根据用户请求参数调用对应的参数加载数据
	var options=[
	             [['loadConsumptionServlet','getVoltageOfLoadConsumption','负载消耗输出电压','输出电压(V)','V'],
	             ['loadConsumptionServlet','getCurrentOfLoadConsumption','负载消耗输出电流','输出电流(A)','A'],
	             ['loadConsumptionServlet','getPowerOfLoadConsumption','负载消耗输出功率','输出功率(W)','W'],
	             ['loadConsumptionServlet','getDayConsumeOfLoadConsumption','负载消耗日耗电量','日耗电量(kw·h)','kw·h'],
	             ['loadConsumptionServlet','getMonthConsumeOfLoadConsumption','负载消耗月耗电量','月耗电量(kw·h)','kw·h'],
	             ['loadConsumptionServlet','getAllConsumeOfLoadConsumption','负载消耗总耗电量','总耗电量(kw·h)','kw·h']],
	             [['environmentalParametersServlet','getIlluminanceOfEnvironmentalParameters','环境参数光照度','光照度(KLUS)','KLUS'],
		         ['environmentalParametersServlet','getWindSpeedOfEnvironmentalParameters','环境参数风速','风速(m/s)','m/s'],
		         ['environmentalParametersServlet','getTemperatureOfEnvironmentalParameters','环境参数温度','温度(℃)','℃']],
	             [['electricityParameterServlet','getVoltageOfElectricityParameter','市电参数输出电压','输出电压(V)','V'],
	             ['electricityParameterServlet','getCurrentOfElectricityParameter','市电参数输出电流','输出电流(A)','A'],
	             ['electricityParameterServlet','getPowerOfElectricityParameter','市电参数输出功率','输出功率(W)','W'],
	             ['electricityParameterServlet','getDaySupplyOfElectricityParameter','市电参数日供电量','日供电量(kw·h)','kw·h'],
	             ['electricityParameterServlet','getMonthSupplyOfElectricityParameter','市电参数月供电量','月供电量(kw·h)','kw·h'],
	             ['electricityParameterServlet','getAllSupplyOfElectricityParameter','市电参数总供电量','总供电量(kw·h)','kw·h']],
	             [['inverterServlet','getVoltageOfInverter','逆变器输出电压','输出电压(V)','V'],
	             ['inverterServlet','getCurrentOfInverter','逆变器输出电流','输出电流(A)','A'],
	             ['inverterServlet','getPowerOfInverter','逆变器输出功率','输出功率(W)','W'],
	             ['inverterServlet','getDayConsumeOfInverter','逆变器日供电量','日供电量(kw·h)','kw·h'],
	             ['inverterServlet','getMonthConsumeOfInverter','逆变器月供电量','月供电量(kw·h)','kw·h'],
	             ['inverterServlet','getAllConsumeOfInverter','逆变器总供电量','总供电量(kw·h)','kw·h']],
	             [['solarControllerServlet','getVoltageOfSolarController','太阳能控制器电池电压','电池电压(V)','v'],
	             ['solarControllerServlet','getInputCurrentOfSolarController','太阳能控制器光伏输入电流','光伏输入电流(A)','A'],
	             ['solarControllerServlet','getOutputCurrentOfSolarController','太阳能控制器负载输出电流','负载输出电流(A)','A'],
	             ['solarControllerServlet','getDischargeCurrentOfSolarController','太阳能控制器充放电电流','充放电电流(A)','A'],
	             ['solarControllerServlet','getDayGenerationOfSolarController','太阳能控制器日发电量','日发电量(kw·h)','kw·h'],
	             ['solarControllerServlet','getMonthGenerationOfSolarController','太阳能控制器月发电量','月发电量(kw·h)','kw·h'],
	             ['solarControllerServlet','getAllGenerationOfSolarController','太阳能控制器总发电量','总发电量(kw·h)','kw·h'],
	             ['solarControllerServlet','getAllRuntimeOfSolarController','太阳能控制器总运行时间','总运行时间(h)','h']]
	];
	var type = options[parentId-1][childId-1][1];
	
	$('#date_button').unbind().one('click',function(){
		refreshData(parentId,childId,true);
	});
	if (type.indexOf("Month") != -1 ) {
		$("#startDate").attr("type","month");
		$("#endDate").attr("type","month");
	} else {
		$("#startDate").attr("type","date");
		$("#endDate").attr("type","date");
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
		'type' : options[parentId-1][childId-1][1],
		'startDate' : $('#startDate').val(),
		'endDate' : $('#endDate').val()
	};
	if (type.indexOf("Month") != -1 ) {
		if ($('#startDate').val() == "") {
			var date = new Date();
			var d = new Date();
			d.setMonth(date.getMonth()-1);
			params = {
					'type' : options[parentId-1][childId-1][1],
					'startDate' : d.getFullYear()+"-"+(d.getMonth() +1)+"-01",
					'endDate' : date.getFullYear()+"-"+(date.getMonth() +1)+"-31"
				}
		} else {
			params = {
				'type' : options[parentId-1][childId-1][1],
				'startDate' : $('#startDate').val()+"-01",
				'endDate' : $('#endDate').val()+"-31"
			}
		}
	}
	
	if (type.indexOf("All") != -1 ) {
		if ($('#startDate').val() == "") {
			var date = new Date();
			var d = new Date();
			d.setMonth(date.getMonth()-1);
			params = {
					'type' : options[parentId-1][childId-1][1],
					'startDate' : "2017-07-06",
					'endDate' : date.getFullYear()+"-"+(date.getMonth() +1)+"-"+date.getDate()
				}
		} 
	}
	showchart(options,parentId,childId,[]);
	//if($('#startDate').val() == "") {return;}
	$('#startDate').val('');
	$('#endDate').val('');
	$.post(options[parentId-1][childId-1][0], params, function(data) {
		var jsonData = JSON.parse(data);
		if (jsonData == '') {
			alert('所选时间段没有数据!');
			return;
		}
		var alldata1=[];
		for(i=0;i<jsonData.length;i++){         
            rz=jsonData[i][0];  
            tm=jsonData[i][1];  
            var someDate = new Date(Date.parse(rz));  
            var tms=Date.UTC(someDate.getFullYear(), someDate.getMonth(), someDate.getDate(), someDate.getHours(),someDate.getMinutes(),someDate.getSeconds());  
            alldata1.push([tms,tm]);  
           
        } 
		 showchart(options,parentId,childId,alldata1);
		
	});
}
var chart = null;

function showchart(options,parentId,childId,alldata1) {

	
	 var flag = true;
	
     var a = max(alldata1);
     var b = min(alldata1);
     var c = avg(alldata1);
     
     var d = 0;//方差
     var e = 0;//标准差
     
     
     for(var i = 0;i < alldata1.length;i++){
    	 d+=Math.pow(alldata1[i][1]-c,2)
     }
     d = (d/(alldata1.length)).toFixed(2);
     
     
     e = Math.sqrt(d).toFixed(2);
     
     
     //document.getElementById('v1').innerHTML = d;//获取div的节点
    // document.getElementById('v2').innerHTML = e;//获取div的节点
     
     
     
 	
 
     
   
     
	$('#container').highcharts({
        chart: {
            zoomType: 'x'
        },
        title: {
            text: options[parentId-1][childId-1][2]
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
            '鼠标拖动可以进行缩放' : '手势操作进行缩放'
        },
        tooltip: {
            dateTimeLabelFormats: {
                millisecond: '%H:%M:%S.%L',
                second: '%H:%M:%S',
                minute: '%H:%M',
                hour: '%H:%M',
                day: '%Y-%m-%d',
                week: '%m-%d',
                month: '%Y-%m',
                year: '%Y'
            },
            valueSuffix: options[parentId-1][childId-1][4]
        },
        xAxis: {
        	
            type: 'datetime',
            dateTimeLabelFormats: {
                millisecond: '%H:%M:%S.%L',
                second: '%H:%M:%S',
                minute: '%H:%M',
                hour: '%H:%M',
                day: '%Y-%m-%d',
                week: '%Y-%m-%d',
                month: '%Y-%m',
                year: '%Y'
            }
        },
        yAxis: {
        	
        
            title: {
                text: options[parentId-1][childId-1][3]
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                marker: {
                    radius: 2
                },
                lineWidth: 1,
                states: {
                    hover: {
                        lineWidth: 1
                    }
                },
                threshold: null
            }
        },
        series: [{
            type: 'area',
            name: options[parentId-1][childId-1][2],
            data: alldata1
        }]
    },function(c) {
		chart = c;
	});
	
	
	
	$(".line").click(function(){
		
		if(flag&&alldata1.length>0){
			
			chart.yAxis[0].addPlotLine({  
				zIndex:20,//在x轴上增加
				
	        		label:{
	        	        text:'最大值:'+a,     //标签的内容
	        	        align:'left',                //标签的水平位置，水平居左,默认是水平居中center
	        	        x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
	        	    },
	                color:'yellow',           //线的颜色，定义为红色
	                dashStyle:'longdashdot',     //默认值，这里定义为实线
	                value:a,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
	                width:2,               //标示线的宽度，2px
	                id:'line1',
	                          //标示线的id，在删除该标示线的时候需要该id标示
			});
			
			chart.yAxis[0].addPlotLine({     
				zIndex:20,//在x轴上增加
				
				label:{
        	        text:'最小值:'+b,     //标签的内容
        	        align:'center',                //标签的水平位置，水平居左,默认是水平居中center
        	        x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
        	    },
                color:'blue',           //线的颜色，定义为红色
                dashStyle:'longdashdot',     //默认值，这里定义为实线
                value:b,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                width:2,
                id:'line2',
		});
			
chart.yAxis[0].addPlotLine({    
	zIndex:20,//在x轴上增加
				
	label:{
        text:'平均值:'+c,     //标签的内容
        align:'right',                //标签的水平位置，水平居左,默认是水平居中center
        x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
    },
    color:'red',           //线的颜色，定义为红色
    dashStyle:'longdashdot',     //默认值，这里定义为实线
    value:c,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
    width:2,                //标示线的宽度，2px
    id:'line3',
		});

       flag = !flag;
			
			
			
		}
		
		else{
			chart.yAxis[0].removePlotLine('line1');
			chart.yAxis[0].removePlotLine('line2');
			chart.yAxis[0].removePlotLine('line3');
			
			flag=!flag;
			
		}
		
		
	});
}

function max(alldata1){
	var max = 0;
	for(var i=1;i<alldata1.length;i++){
		if(alldata1[i][1]>max){
			max = alldata1[i][1];
		}
			
	}
	
	return max;
	
	
}


function min(alldata1){
	var min = 1000000;
	for(var i=1;i<alldata1.length;i++){
		if(alldata1[i][1]<min){
			min = alldata1[i][1];
		}
			
	}
	
	return min;
	
	
}

function avg(alldata1){
	var sum = 0;
	for(var i=1;i<alldata1.length;i++){
		sum = sum + alldata1[i][1];
	}
	
	sum = sum /(alldata1.length);
	
	return sum.toFixed(2);
	
}




//显示二级菜单
function showChild(id){
	$('#childSelect_'+id).css('display','block');
}
//隐藏二级菜单
function hiddenChild(id){
	$('#childSelect_'+id).css('display','none');
}
function download(level){
	if(!level){
		location.href="login.jsp";
	}else{
		openWindow('download.jsp','光伏数据下载',600,400);
	}
}
//开启新窗口，并设置窗口的属性
function openWindow(url, name, width, height) {
	var left = (parent.innerWidth - width) / 2;
	var top = (parent.innerHeight - height) / 2;
	window.open(url, name, "top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",toolbar=no,location=no,directories=no,resizable=no,status=no,menubar=no,scrollbars=yes");
}
function startDownload(level){
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
			} else if (day > 7&&level==0) {
				alert('普通用户一次最多下载一周的数据!');
				return;
			}else if(day > 365&&level==1){
				alert('vip会员一次最多下载一年的数据!');
				return;
			}
			var options=[['loadConsumptionServlet','getExcelOfLoadConsumption'],
			             ['environmentalParametersServlet','getExcelOfEnvironmentalParameters'],
			             ['inverterServlet','getExcelOfInverter'],
			             ['electricityParameterServlet','getExcelOfElectricityParameter'],
			             ['solarControllerServlet','getExcelOfSolarController'],];
			location.href=options[$('#select').val()-1][0]+"?type="+options[$('#select').val()-1][1]+"&startDate="+$('#startDate').val()+"&endDate="+$('#endDate').val();
}