<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="${ctx }/manager/dist/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	
	var str = document.location.pathname.split("/",2).toString(); //抓取系統路徑
	var res = str.replace(",", "/");

 	$.getJSON(res+"/_report/getDataService.do",{},function(data){

 		 var TotalData = data;		//接取Json值
	     
		$('#boy').text(TotalData.Boy); //從這裡開始動態給圖表值
		$('#girl').text(TotalData.Girl);
		$('#total').text(TotalData.Total);
		$('.today').text(TotalData.Today);
		$('#boybar').text(TotalData.Boy + "/" + TotalData.Total);
		$('#girlbar').text(TotalData.Girl + "/" + TotalData.Total);
		$('#totalbar').text(TotalData.Total + "/" + TotalData.Total);
		
		var teenager =  ((TotalData.Teenager/TotalData.Count)*100).toFixed(1);
		var middle =((TotalData.Middle/TotalData.Count)*100).toFixed(1);
		var old=((TotalData.Old/TotalData.Count)*100).toFixed(1);
		var veryold = ((TotalData.Veryold/TotalData.Count)*100).toFixed(1);
		
		 var chart = new CanvasJS.Chart("chartContainer", {	 //圖表
			 
				theme: "theme1",//theme1
				colorSet: "greenShades",
				title:{
					text: "男女人數比例圖 - Life Editor"              
				},
				animationEnabled: false,   // change to true
				data: [              
				{
					// Change type to "bar", "area", "spline", "pie",etc.
					type: "column",
					dataPoints: [
					             
						{ label: "男孩",  y: TotalData.Boy },
						{ label: "女孩",  y: TotalData.Girl },
						{ label: "總人數",  y: TotalData.Total}
					]
				}
				]
			});
			chart.render();
			CanvasJS.addColorSet("greenShades",
		             [//colorSet Array
		             "#46A3FF",
		             "#FF0000",
		             "#01814A"
	]);
			
			var chart = new CanvasJS.Chart("chartContainer2",
					{
						theme:"theme1",
						title:{							
							text: "年齡分布圖 - Life Editor"						
						},

						legend:{
							verticalAlign: "bottom",
							horizontalAlign: "center"
						},
						data: [
						{
							//startAngle: 45,
							indexLabelFontSize: 20,
							indexLabelFontFamily: "Garamond",
							indexLabelFontColor: "darkgrey",
							indexLabelLineColor: "darkgrey",
							indexLabelPlacement: "outside",
							type: "doughnut",
							showInLegend: true,
							dataPoints: [
								{  y: teenager, legendText:"25歲以下 "+teenager+"%", indexLabel: "25歲以下 "+teenager+"%"},
								{  y: middle, legendText:"26 ~ 50歲 "+middle+"%", indexLabel: "26~50歲 "+middle+"%" },
								{  y: old, legendText:"50 ~ 75歲 "+old+"%", indexLabel: "50~75歲 "+old+"%"},
								{  y: veryold, legendText:"75 ~ 100歲以上 "+veryold+"%", indexLabel: "75~100歲以上 "+veryold+"%"}
							]
						}
						]
					});

					chart.render();
 	});
 	
			
});

</script>
    
    	<div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">男孩 & 女孩</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <p class="text-center">
                    <strong class="today"></strong>
                  </p>

                  <div id="chartContainer" style="height: 300px; width: 100%;">
                  <!-- Boy & Girl  Chart  -->                 
                  </div>
                  <!-- /.chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-4">
                  <p class="text-center">
                    <strong>總數統計</strong>
                  </p>

                  <div class="progress-group">
                    <span class="progress-text" >男孩/總人數</span>
                    <span class="progress-number"><b id="boybar"></b></span>

                    <div class="progress sm">
                      <div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">女孩/總人數</span>
                    <span class="progress-number"><b id="girlbar"></b></span>

                    <div class="progress sm">
                      <div class="progress-bar progress-bar-red" style="width: 80%"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">總人數</span>
                    <span class="progress-number"><b id="totalbar"></b></span>

                    <div class="progress sm">
                      <div class="progress-bar progress-bar-green" style="width: 80%"></div>
                    </div>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
              
            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green" ><i class="fa fa-caret-down"></i> 17%</span>
                    <h5 class="description-header" id="boy"></h5>
                    <span class="description-text">男孩</span>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-red"><i class="fa fa-caret-up"></i> 20%</span>
                    <h5 class="description-header" id="girl"></h5>
                    <span class="description-text">女孩</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block">
                    <span class="description-percentage text-red"><i class="fa fa-caret-up"></i> 18%</span>
                    <h5 class="description-header" id="total"></h5>
                    <span class="description-text">總人數</span>
                  </div>
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- End report 1---------------------------------------------------------------------------- -->
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">年齡分布</h3>
              <div class="box-tools pull-right">
                <!-- 123456 -->
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <p class="text-center">
                    <strong class="today"></strong>
                  </p>

                  <div id="chartContainer2" style="height: 300px; width: 100%;">         
                  </div>
                  <!-- /.chart-responsive -->
                </div>
                <!-- /.col -->
                <!-- /.col -->
              </div>
              <!-- /.row -->
              
            </div>
            <!-- ./box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- End report 2---------------------------------------------------------------------------- -->
