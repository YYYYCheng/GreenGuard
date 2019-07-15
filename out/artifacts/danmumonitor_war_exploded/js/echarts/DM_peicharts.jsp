<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<meta http-equiv=Content-Type content=text/html;charset=utf-8>

  <body>
    <div style="width:60em;height:30em;float:left;" id="danmu_barcharts"></div>
		<script type='text/javascript'>
		/*DM_barcharts.js*/

var myChart3 = echarts.init(document.getElementById('danmu_barcharts'));
var option11 = {
  title : {
          text: '南丁格尔玫瑰图',
          subtext: '纯属虚构',
          x:'center'
      },
      tooltip : {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
          x : 'center',
          y : 'bottom',
          data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
      },
      toolbox: {
          show : true,
          feature : {
              mark : {show: true},
              dataView : {show: true, readOnly: false},
              magicType : {
                  show: true,
                  type: ['pie', 'funnel']
              },
              restore : {show: true},
              saveAsImage : {show: true}
          }
      },
      calculable : true,
      series : [
          {
              name:'面积模式',
              type:'pie',
              radius : [30, 110],
              center : ['75%', 200],
              roseType : 'area',
              x: '50%',               // for funnel
              max: 40,                // for funnel
              sort : 'ascending',     // for funnel
              data:[
                  {value:10, name:'rose1'},
                  {value:5, name:'rose2'},
                  {value:15, name:'rose3'},
                  {value:25, name:'rose4'},
                  {value:20, name:'rose5'},
                  {value:35, name:'rose6'},
                  {value:30, name:'rose7'},
                  {value:40, name:'rose8'}
              ]
          }
      ]
};

myChart3.setOption(option11);
</script>
	</body>
