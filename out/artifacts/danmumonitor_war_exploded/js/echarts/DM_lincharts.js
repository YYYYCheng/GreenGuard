/*DM_barcharts.js*/

var myChart6 = echarts.init(document.getElementById('danmu_lincharts'));

var option18 = {
	title: {
        text: '本周系统平均评分走势',
        textStyle: {
			color:'#ffffff'
		}
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['最高评分','最低评分']
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['周一','周二','周三','周四','周五','周六','周日'],
		nameTextStyle: {
                color: ['#ffffff'],
                width:2
            },
        axisLine:{
            lineStyle:{
                color:'#ffffff',
                width:3
            }
        }
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        },
		nameTextStyle: {
                color: ['#ffffff'],
                width:1
            },
        axisLine:{
            lineStyle:{
                color:'#ffffff',
                width:3
            }
        }
    },
    series: [
        {
			lineStyle:{
				normal:{
					width:5,  //连线粗细
					color: "#fff"  //连线颜色
				}
			},
            name:'本周评分走势',
            type:'line',
            data:[9.7,7.5, 9.6, 7.8, 8.5, 9.6, 9.1],
            markPoint: {
                data: [
                    {
                        type: 'max',
                        name: '最大值',
                        itemStyle:{
    			        	normal:{
    				        	width:3,  //连线粗细
    					        color: "#ff0d0d"  //连线颜色
    				    }
			    }
                    },

                    {
                        type: 'min',
                        name: '最小值',
                        itemStyle:{
    				        normal:{
    				        	width:3,  //连线粗细
    				        	color: "#ff0d0d"  //连线颜色
    				    }
			    }
                    },
                ],
                itemStyle:{
    				normal:{
    					width:3,  //连线粗细
    					color: "#fff"  //连线颜色
    				}
			    }
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'}
                ],
                lineStyle:{
    				normal:{
    					width:3,  //连线粗细
    					color: "#2bfe09"  //连线颜色
    				}
			    }
            }
        }
    ]
};

myChart6.setOption(option18);
