<script src="js/TableSet.js"></script>
<link rel=stylesheet type="text/css" href="css/TableSet.css">

<div style="margin: 0px auto; width: 95%">
	<div style="height: 30px; width: 100%;">
		現在樓層:
		<select id="changeFloor">
		</select>
		<input type="button" id="addTB" value="新增桌子">
		<input type="button" id="reset" value="重新擺設">
		TableSize:
		<input type="range" id="changeRange" min="90" max="300" value="100">
		<span id="showRange">100%</span>
	</div>
	<div id="picTB"></div>
	<div id="floorBTN">
	<input type="button" id="addFloor" value="新增樓層">
	<input type="button" id="delFloor" value="刪除樓層">
	<input type="button" id="saveFloor" value="儲存樓層">
	</div>
</div>