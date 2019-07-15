<!DOCTYPE html>
<%@page import="com.DanMuSafetyMonitor.bean.matableDao"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% 
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	double value1=521;
	double value2=111;
	double value3=251;
%>

<meta http-equiv=Content-Type content=text/html;charset=utf-8>
<script type="text/javascript"  src="anchor_lincharts.js"></script> 

<body>
<div style="width:28em;height:28em" id="anchor_peicharts"></div>
<script type='text/javascript'>
/*anchor_lincharts.js*/

var value1=<%= value1 %>,value2=<%= value2 %>,value3=<%= value3 %>;

var myChart42 = echarts.init(document.getElementById('anchor_peicharts'));
var option112 = {
    title : {
        text: '词汇分布',
        x:'center',
		textStyle: {
			fontWeight: 'bolder',
			color: '#fff'
		}
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['高频词','突发词','敏感词'],
		textStyle: {
			fontWeight: 'bolder',
			color: '#fff'
		}
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'词汇来源',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:value1, name:'高频词'},
                {value:value2, name:'突发词'},
                {value:value3, name:'敏感词'}
            ],
			color:['rgb(101, 236, 123)','rgb(255, 182, 85)','rgb(83, 146, 241)']
        }
    ]
};


myChart42.setOption(option112);

</script>
</body>