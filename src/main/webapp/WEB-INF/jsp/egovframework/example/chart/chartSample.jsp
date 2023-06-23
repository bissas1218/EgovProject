<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />

		<!-- Resources -->
 		<script type="text/javascript" src="/chart/node_modules/chart.js/dist/chart.umd.js"></script>
 		
 		 <script>

        // charts.js에서 제공하는 utils.js 

        'use strict';

 

window.CHART_COLORS = {

    red: 'rgb(255, 99, 132)',

    orange: 'rgb(255, 159, 64)',

    yellow: 'rgb(255, 205, 86)',

    green: 'rgb(75, 192, 192)',

    blue: 'rgb(54, 162, 235)',

    purple: 'rgb(153, 102, 255)',

    grey: 'rgb(201, 203, 207)'

};

 

(function(global) {

    var MONTHS = [

        'January',

        'February',

        'March',

        'April',

        'May',

        'June',

        'July',

        'August',

        'September',

        'October',

        'November',

        'December'

    ];

 

    var COLORS = [

        '#4dc9f6',

        '#f67019',

        '#f53794',

        '#537bc4',

        '#acc236',

        '#166a8f',

        '#00a950',

        '#58595b',

        '#8549ba'

    ];

 

    var Samples = global.Samples || (global.Samples = {});

    var Color = Chart.helpers.color;

 

    function applyDefaultNumbers(config) {

        var cfg = config || {};

        cfg.min = cfg.min || 0;

        cfg.max = cfg.max || 1;

        cfg.from = cfg.from || [];

        cfg.count = cfg.count || 8;

        cfg.decimals = cfg.decimals || 8;

        cfg.continuity = cfg.continuity || 1;

 

        return cfg;

    }

 

    Samples.utils = {

        // Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/

        srand: function(seed) {

            this._seed = seed;

        },

 

        rand: function(min, max) {

            var seed = this._seed;

            min = min === undefined ? 0 : min;

            max = max === undefined ? 1 : max;

            this._seed = (seed * 9301 + 49297) % 233280;

            return min + (this._seed / 233280) * (max - min);

        },

 

        numbers: function(config) {

            var cfg = applyDefaultNumbers(config);

            var dfactor = Math.pow(10, cfg.decimals) || 0;

            var data = [];

            var i, value;

 

            for (i = 0; i < cfg.count; ++i) {

                value = (cfg.from[i] || 0) + this.rand(cfg.min, cfg.max);

                if (this.rand() <= cfg.continuity) {

                    data.push(Math.round(dfactor * value) / dfactor);

                } else {

                    data.push(null);

                }

            }

 

            return data;

        },

 

        labels: function(config) {

            var cfg = config || {};

            var min = cfg.min || 0;

            var max = cfg.max || 100;

            var count = cfg.count || 8;

            var step = (max - min) / count;

            var decimals = cfg.decimals || 8;

            var dfactor = Math.pow(10, decimals) || 0;

            var prefix = cfg.prefix || '';

            var values = [];

            var i;

 

            for (i = min; i < max; i += step) {

                values.push(prefix + Math.round(dfactor * i) / dfactor);

            }

 

            return values;

        },

 

        months: function(config) {

            var cfg = config || {};

            var count = cfg.count || 12;

            var section = cfg.section;

            var values = [];

            var i, value;

 

            for (i = 0; i < count; ++i) {

                value = MONTHS[Math.ceil(i) % 12];

                values.push(value.substring(0, section));

            }

 

            return values;

        },

 

        color: function(index) {

            return COLORS[index % COLORS.length];

        },

 

        transparentize: function(color, opacity) {

            var alpha = opacity === undefined ? 0.5 : 1 - opacity;

            return Color(color).alpha(alpha).rgbString();

        },
        
        
        points: function(config) {
        	
        	  var xs = this.numbers(config);
        	  
        	  var ys = this.numbers(config);
        	  
        	  return xs.map((x, i) => ({x, y: ys[i]}));
        },
        
       
        bubbles: function(config) {
        	
        	  return this.points(config).map(pt => {
        		  
        	    pt.r = this.rand(config.rmin, config.rmax);
        	    
        	    return pt;
        	    
        	  });
        }

    };

 

    // DEPRECATED

    window.randomScalingFactor = function() {

        return Math.round(Samples.utils.rand(-100, 100));

    };

 

    // INITIALIZATION

 

    Samples.utils.srand(Date.now());

 

    // Google Analytics

    /* eslint-disable */

    if (document.location.hostname.match(/^(www\.)?chartjs\.org$/)) {

        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){

        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),

        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)

        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-28909194-3', 'auto');

        ga('send', 'pageview');

    }

    /* eslint-enable */

 

}(this));

 

    </script>
		
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>회전된 레이블이 있는 열</h1>
											<p>이 데모에서는 간단한 세로 막대형 차트를 만듭니다.</p>
										</header>
										<p>
개체를 만드는 동안 패닝 기능과 마우스 휠 동작을 바로 조정합니다. 그런 다음 커서(차트 위로 마우스를 가져갈 때 표시되는 수직선)를 활성화하고 수평선(Y)을 숨깁니다.
그런 다음 X축에서 레이블을 회전하고 차트 위로 마우스를 이동할 때 옆에 표시되는 국가 이름 도구 설명을 추가합니다.
다음으로 열 자체인 시리즈를 추가합니다. 각 축을 연결하고, 값 필드를 설정하고, 툴팁 텍스트(열 상단에 표시되는 값 툴팁)를 구성합니다. 또한 기둥의 상단 모서리를 둥글게 만듭니다.
마무리 작업은 주문 번호를 기준으로 열 색상을 조정하는 것입니다.</p>
										<ul class="actions">
											<li><a href="#" class="button big">Learn More</a></li>
										</ul>
									</div>
									
									<span class="image object">
										<canvas id="myChart"></canvas>
									</span> 
									
								</section>


							<!-- Content -->
								<section>
									<header class="main">
										<h1>Generic</h1>
									</header>

									<h2>Bar chart</h2>
									<span class="image main">
										<canvas id="barChart"></canvas>
									</span>

									<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula.</p>
									<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fersapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit tristique lorem ipsum dolor.</p>

									<hr class="major" />

									<h2>Line chart</h2>
									<span class="image main">
										<canvas id="lineChart"></canvas>
									</span>
									<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fersapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit tristique lorem ipsum dolor.</p>

									<hr class="major" />

									<h2>Bubble chart</h2>
									<span class="image main">
										<canvas id="bubbleChart"></canvas>
									</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula.</p>
									<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fersapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit tristique lorem ipsum dolor.</p>

									<hr class="major" />

									<h2>Pie chart</h2>
									<span class="image main">
										<canvas id="pieChart"></canvas>
									</span>
									<p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis. Praesent rutrum sem diam, vitae egestas enim auctor sit amet. Pellentesque leo mauris, consectetur id ipsum sit amet, fergiat. Pellentesque in mi eu massa lacinia malesuada et a elit. Donec urna ex, lacinia in purus ac, pretium pulvinar mauris. Curabitur sapien risus, commodo eget turpis at, elementum convallis elit. Pellentesque enim turpis, hendrerit.</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique libero eu nibh porttitor fermentum. Nullam venenatis erat id vehicula viverra. Nunc ultrices eros ut ultricies condimentum. Mauris risus lacus, blandit sit amet venenatis non, bibendum vitae dolor. Nunc lorem mauris, fringilla in aliquam at, euismod in lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In non lorem sit amet elit placerat maximus. Pellentesque aliquam maximus risus, vel sed vehicula.</p>

								</section>.

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<jsp:include page="/sidebar.do"></jsp:include>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	<!-- Chart code -->
		<script>
		  const ctx = document.getElementById('myChart');
		
		  new Chart(ctx, {
		    type: 'bar',
		    data: {
		      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
		      datasets: [{
		        label: '# of Votes',
		        data: [12, 19, 3, 5, 2, 3],
		        borderWidth: 1
		      }]
		    },
		    options: {
		      scales: {
		        y: {
		          beginAtZero: true
		        }
		      }
		    }
		  });
		</script>
		
		<script>
		
			const barChart = document.getElementById('barChart');
			const labels = Samples.utils.months({count: 7});
			
			new Chart(barChart, {
			    type: 'bar',
			    data: {
			    	  labels: labels,
			    	  datasets: [
			    	    {
			    	      label: 'Dataset 1',
			    	      data: labels.map(() => {
			    	        return [Samples.utils.rand(-100, 100), Samples.utils.rand(-100, 100)];
			    	      }),
			    	      backgroundColor: window.CHART_COLORS.red,
			    	    },
			    	    {
			    	      label: 'Dataset 2',
			    	      data: labels.map(() => {
			    	        return [Samples.utils.rand(-100, 100), Samples.utils.rand(-100, 100)];
			    	      }),
			    	      backgroundColor: window.CHART_COLORS.blue,
			    	    },
			    	  ]
			    	}
			    ,
			    options: {
			        responsive: true,
			        plugins: {
			          legend: {
			            position: 'top',
			          },
			          title: {
			            display: true,
			            text: 'Chart.js Floating Bar Chart'
			          }
			        }
			      }
			  });
			
		</script>
		
		<script>
		
			const lineChart = document.getElementById('lineChart');
	
			const DATA_COUNT = 12;
			const labels2 = [];
			for (let i = 0; i < DATA_COUNT; ++i) {
			  labels2.push(i.toString());
			}
			const datapoints = [0, 20, 20, 60, 60, 120, NaN, 180, 120, 125, 105, 110, 170];
			
			new Chart(lineChart, {
			    type: 'line',
			    data: {
			    	  labels: labels2,
			    	  datasets: [
			    	    {
			    	      label: 'Cubic interpolation (monotone)',
			    	      data: datapoints,
			    	      borderColor: window.CHART_COLORS.red,
			    	      fill: false,
			    	      cubicInterpolationMode: 'monotone',
			    	      tension: 0.4
			    	    }, {
			    	      label: 'Cubic interpolation',
			    	      data: datapoints,
			    	      borderColor: window.CHART_COLORS.blue,
			    	      fill: false,
			    	      tension: 0.4
			    	    }, {
			    	      label: 'Linear interpolation (default)',
			    	      data: datapoints,
			    	      borderColor: window.CHART_COLORS.green,
			    	      fill: false
			    	    }
			    	  ]
			    	}
			    ,
			    options: {
			        responsive: true,
			        plugins: {
			          title: {
			            display: true,
			            text: 'Chart.js Line Chart - Cubic interpolation mode'
			          },
			        },
			        interaction: {
			          intersect: false,
			        },
			        scales: {
			          x: {
			            display: true,
			            title: {
			              display: true
			            }
			          },
			          y: {
			            display: true,
			            title: {
			              display: true,
			              text: 'Value'
			            },
			            suggestedMin: -10,
			            suggestedMax: 200
			          }
			        }
			      }
			  });
			
		</script>
		
		<script>
		
			const bubbleChart = document.getElementById('bubbleChart');
	
			const DATA_COUNT2 = 7;
			const NUMBER_CFG = {count: DATA_COUNT2, rmin: 5, rmax: 15, min: 0, max: 100};
			
			new Chart(bubbleChart, {
			    type: 'bubble',
			    data: {
		    	  datasets: [
		    		    {
		    		      label: 'Dataset 1',
		    		      data: Samples.utils.bubbles(NUMBER_CFG),
		    		      borderColor: window.CHART_COLORS.red,
		    		      backgroundColor: Samples.utils.transparentize(window.CHART_COLORS.red, 0.5),
		    		    },
		    		    {
		    		      label: 'Dataset 2',
		    		      data: Samples.utils.bubbles(NUMBER_CFG),
		    		      borderColor: window.CHART_COLORS.orange,
		    		      backgroundColor: Samples.utils.transparentize(window.CHART_COLORS.orange, 0.5),
		    		    }
		    		  ]
		    		}
			    ,
			    options: {
			        responsive: true,
			        plugins: {
			          legend: {
			            position: 'top',
			          },
			          title: {
			            display: true,
			            text: 'Chart.js Bubble Chart'
			          }
			        }
			      }
			  });
			
		</script>
		
		<script>
		
			const pieChart = document.getElementById('pieChart');
	
			const DATA_COUNT3 = 5;
			const NUMBER_CFG3 = {count: DATA_COUNT3, min: 0, max: 100};

			const data = {
			  labels: ['Red', 'Orange', 'Yellow', 'Green', 'Blue'],
			  datasets: [
			    {
			      label: 'Dataset 1',
			      data: Samples.utils.numbers(NUMBER_CFG3),
			      backgroundColor: Object.values(window.CHART_COLORS),
			    }
			  ]
			};
			
			new Chart(pieChart, {
			    type: 'pie',
			    data: data ,
			    options: {
			        responsive: true,
			        plugins: {
			          legend: {
			            position: 'top',
			          },
			          title: {
			            display: true,
			            text: 'Chart.js Pie Chart'
			          }
			        }
			      }
			  });
			
		</script>
		
	</body>
</html>