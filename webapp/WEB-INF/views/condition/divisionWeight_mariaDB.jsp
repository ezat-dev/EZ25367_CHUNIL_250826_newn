<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>분할기준중량관리</title>
 
      <%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>

  <style>
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left: 1008px;
            margin-top: 200px;
        }
        .view {
            display: flex;
            justify-content: center;
            margin-top: 1%;
        }
        .tab {
            width: 95%;
            margin-bottom: 37px;
            margin-top: 5px;
            height: 45px;
            border-radius: 6px 6px 0px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.3s ease-in-out;
        }
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	        height: 80vh; 
	        overflow-y: auto; 
	        margin: 6% auto 0;
	        padding: 20px;
	        border-radius: 10px;
	        position: relative;
	        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	        transform: scale(0.8);
	        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
	        opacity: 0;
	    }
        .modal.show {
            display: block;
            opacity: 1;
        }
        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }
        .close {
            background-color:white;
            position: absolute;
            right: 15px;
            top: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .modal-content form {
            display: flex;
            flex-direction: column;
        }
        .modal-content label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content input, .modal-content textarea {

            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button {
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover {
            background-color: #a9a9a9;
        }
        .button-container {
    		display: flex;
		    gap: 10px;
		    margin-left: auto;
		    margin-right: 10px;
		    margin-top: 40px;
		}
		

		.box1 {
		    display: flex;
		    justify-content: right;
		    align-items: center;
		    width: 1000px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
        	width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
        .daylabel {
            margin-right: 10px;
            margin-bottom: 13px;
            font-size: 18px;
            margin-left: 20px;
            
    
        }


     
        .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }

    .checkbox-group {
        display: flex;
        gap: 20px;
        margin-bottom: 10px;
    }
    .checkbox1{
    margin-top:20px;
    margin-right:10px;
    
    }

    .checkbox-group label {
        font-size: 16px;
    }

    .checkbox-group input[type="checkbox"] {
        transform: scale(1.7); 
    }
	.delete-button {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	}
	
	.delete-button:hover {
	    background-color: #f0f0f0;
	}
	
	.excel-import-button {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	}
	/* CSS */
.form-row {
  display: flex;
  align-items: center;
  gap: 16px;           /* 레이블–인풋 간격 */
  flex-wrap: wrap;     /* 화면 좁아지면 줄 바꿈 */
  margin-bottom: 12px; /* 각 행 간 간격 */
}

.form-label {
  white-space: nowrap;
  font-weight: 600;
  font-size: 14px;
  color: #333;
  margin-right: 4px;
}

	.form-input {
	  flex: 1;
	  min-width: 180px;
	  padding: 8px 12px;
	  font-size: 14px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  transition: border-color 0.2s, box-shadow 0.2s;
	}
	
	.form-input:focus {
	  outline: none;
	  border-color: #409eff;    /* 블루 톤 */
	  box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.2);
	}
	
	
	@media (max-width: 600px) {
	  .form-row {
	    flex-direction: column;
	    align-items: stretch;
	  }
	  .form-label {
	    margin-bottom: 4px;
	  }
	}
	
	.excel-import-button:hover {
	    background-color: #f0f0f0;
	}

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
  			<div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
				
			<div class="form-row">
			  <label for="plating_no" class="form-label">도금품번 :</label>
			  <input type="text" id="plating_no" class="form-input" placeholder="도금품번 선택" autocomplete="off">
			
			  <label for="pum_name" class="form-label">품명 :</label>
			  <input type="text" id="pum_name" class="form-input" placeholder="품명 선택" autocomplete="off">
			
			  <label for="surface_spec" class="form-label">표면처리사양 :</label>
			  <input type="text" id="surface_spec" class="form-input" placeholder="표면처리사양" autocomplete="off">
			</div>

			
			</div>
			
			
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                 <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>

                <button class="excel-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button>
                
                <button class="excel-import-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Upload
                </button>
			<input type="file" id="fileInput" style="display: none;">
            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	
	<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>기준 정보 등록</h2>
        <form id="corrForm">
        
            <label>도금 품번</label>
            <input type="text" name="plating_no" placeholder="">
        
            <label>자제품번</label>
            <input type="text" name="material_no" placeholder="">
            
            <label>품명</label>
            <input type="text" name="pum_name" placeholder="">

            <label>표면처리 사양</label>
            <select name="surface_spec">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>

            <label>최대중량</label>
            <input type="text" name="max_weight" placeholder="">
            
            <label>최소중량</label>
            <input type="text" name="min_weight" placeholder="">
            
            <label>평균중량</label>
            <input type="text" name="avg_weight" placeholder="">
            
            <label>메인설비</label>
            <input type="text" name="equip_1" placeholder="">
            
            <label>메인 장입기준</label>
            <input type="text" name="load_1" placeholder="">
            
            <label>보조 설비</label>
            <input type="text" name="equip_2" placeholder="">
            
             <label>보조 장입기준</label>
            <input type="text" name="load_2" placeholder="">
            
            
            <label>분할횟수</label>
            <input type="text" name="split_cnt" placeholder="">
            
            <label>장입량(현재장입량)</label>
            <input type="text" name="avg_load" placeholder="">
            
            <label>G-800 (kg)</label>
            <input type="text" name="g800" placeholder="">
            
            <label>G600 (kg)</label>
            <input type="text" name="g600" placeholder="">
            
            <label>공용설비 (kg)</label>
            <input type="text" name="common_equip" placeholder="">
            
            <label>K-BLACK (kg)</label>
            <input type="text" name="k_black" placeholder="">
            
            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>



  <script>
  let now_page_code = "c05";

  $(document).ready(function () {
	    getDataList();


	    $(".select-button").click(function () {
	        dataTable.setData("/geomet/condition/divisionWeight/list", {
	            "plating_no": $("#plating_no").val() || "",
	            "pum_name": $("#pum_name").val() || "",
	            "surface_spec": $("#surface_spec").val() || "",
	        });
	    });

	    // 모달 열기 버튼 이벤트
	    $(".insert-button").click(function () {
	        let modal = $("#modalContainer");
	        modal.show(); 
	        modal.addClass("show");
	    });

	    // 모달 닫기 버튼 이벤트
	    $(".close, #closeModal").click(function () {
	        let modal = $("#modalContainer");
	        modal.removeClass("show").hide(); 
	    });
  
    });




    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();

        var corrForm = new FormData($("#corrForm")[0]);

        $.ajax({
            url: "/geomet/condition/divisionWeight/insert",
            type: "POST",
            data: corrForm,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                alert("기준정보 성공적으로 저장되었습니다!");
                $("#modalContainer").hide();
                getDataList();
             
             
            }
        });

    });



    
    $(".delete-button").click(function(event) {
        event.preventDefault();
        
        console.log("삭제 버튼 클릭됨");

        if (!selectedRow) {
            alert("삭제할 행을 선택하세요.");
            return;
        }

        var platingNo = selectedRow.getData().plating_no;
        
        console.log("전송할 plating_no 값:", platingNo);

        if (!platingNo) {
            alert("삭제할 항목이 없습니다.");
            return;
        }

        var requestData = JSON.stringify({ "plating_no": platingNo });
        console.log("전송된 데이터:", requestData);

        $.ajax({
            url: "/geomet/condition/divisionWeight/del",
            type: "POST",
            contentType: "application/json",
            data: requestData,
            dataType: "json",
            success: function(response) {
                console.log("삭제 성공:", response);
                alert("기준정보가 성공적으로 삭제되었습니다!");
                selectedRow.delete();
                selectedRow = null;

                dataTable.setData("/geomet/condition/divisionWeight/list", {
                    "plating_no": $("#plating_no").val() || "",
                    "pum_name": $("#pum_name").val() || "",
                    "surface_spec": $("#surface_spec").val() || "",
                });
                getDataList();
            },
            error: function(xhr, status, error) {
                console.log("삭제 오류 발생:", xhr.responseText);
                alert("삭제 중 오류가 발생했습니다: " + error);
            }
        });
    });

    var selectedRow = null;
    function getDataList() {
        dataTable = new Tabulator("#dataList", {
            height: "830px",
            layout: "fitColumns",
            selectable: true,
            tooltips: true,
            selectableRangeMode: "click",
            reactiveData: true,
            columnHeaderVertAlign: "middle",
            rowVertAlign: "middle",
            headerHozAlign: "center",
            ajaxConfig: "POST",
            ajaxLoader: false,
            ajaxURL: "/geomet/condition/divisionWeight/list",
            ajaxProgressiveLoad: "scroll",
            ajaxParams: {
                "plating_no": $("#plating_no").val() || "",
                "pum_name": $("#pum_name").val() || "",
                "surface_spec": $("#surface_spec").val() || "",
            },
            placeholder: "조회된 데이터가 없습니다.",
            paginationSize: 20,
            ajaxResponse: function(url, params, response) {
                $("#dataList .tabulator-col.tabulator-sortable").css("height", "29px");
                return response;
            },
            columns: [
            	  { title: "도금품번",      field: "plating_no",   sorter: "string", width: 180, hozAlign: "center", headerSort: false },
            	  { title: "자제품번",      field: "material_no",  sorter: "string", width: 180, hozAlign: "center", headerSort: false },
            	  { title: "품명",          field: "pum_name",     sorter: "string", width: 180, hozAlign: "center", headerSort: false },
            	  { title: "표면처리 사양", field: "surface_spec", sorter: "string", width: 180, hozAlign: "center", headerSort: false },

            	
            	  {
            	    title: "공정창고 출고기준 중량",
            	    columns: [
            	      { title: "최대중량", field: "max_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	      { title: "최소중량", field: "min_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	      { title: "평균중량", field: "avg_weight", sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	    ]
            	  },

            	  {
            	    title: "메인 장입",
            	    columns: [
            	      { title: "설비",     field: "equip_1", sorter: "string", width: 120, hozAlign: "center", headerSort: false },
            	      { title: "장입기준", field: "load_1",  sorter: "string", width: 90,  hozAlign: "center", headerSort: false },
            	    ]
            	  },

            
            	  {
            	    title: "보조 장입",
            	    columns: [
            	      { title: "설비명",   field: "equip_2", sorter: "string", width: 120, hozAlign: "center", headerSort: false },
            	      { title: "장입기준", field: "load_2",  sorter: "string", width: 90,  hozAlign: "center", headerSort: false },
            	    ]
            	  },

            	  { title: "분할횟수",    field: "split_cnt",    sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "장입량",      field: "avg_load",     sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "G-800",       field: "g800",         sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "G600",        field: "g600",         sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "공용설비",    field: "common_equip", sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	  { title: "K-BLACK",     field: "k_black",      sorter: "string", width: 90, hozAlign: "center", headerSort: false },
            	],

            rowClick: function(e, row) {
                $("#dataList .tabulator-row").removeClass("row_select");
                row.getElement().classList.add("row_select");

                selectedRow = row; 
                console.log("선택된 도금품번:", selectedRow.getData().plating_no);
            },
            rowDblClick: function(e, row) {
                var d = row.getData();
                selectedRowData = d;

                // 폼 초기화
                $('#corrForm')[0].reset();

                // 각 필드에 값 채우기
                var $f = $('#corrForm');
                $f.find('input[name="plating_no"]').val(d.plating_no);
                $f.find('input[name="material_no"]').val(d.material_no);
                $f.find('input[name="pum_name"]').val(d.pum_name);
                $f.find('input[name="surface_spec"]').val(d.surface_spec);
                $f.find('input[name="max_weight"]').val(d.max_weight);
                $f.find('input[name="min_weight"]').val(d.min_weight);
                $f.find('input[name="avg_weight"]').val(d.avg_weight);
                $f.find('input[name="equip_1"]').val(d.equip_1);
                $f.find('input[name="load_1"]').val(d.load_1);
                $f.find('input[name="equip_2"]').val(d.equip_2);
                $f.find('input[name="load_1"]').val(d.load_1);
                $f.find('input[name="split_cnt"]').val(d.split_cnt);
                $f.find('input[name="avg_load"]').val(d.avg_load);
                $f.find('input[name="g800"]').val(d.g800);
                $f.find('input[name="g600"]').val(d.g600);
                $f.find('input[name="common_equip"]').val(d.common_equip);
                $f.find('input[name="k_black"]').val(d.k_black);

                // 만약 hidden 필드 no가 있으면
                if (d.no !== undefined) {
                    $f.find('input[name="no"]').val(d.no);
                }

                // 모달/폼 열기
                $('#modalContainer').show().addClass('show');
            }
        });
    }







 // 엑셀 다운로드 버튼 클릭 이벤트
    $(".excel-button").on("click", function () {
    	  console.log("엑셀 다운로드 버튼 클릭됨"); 
          
        $.ajax({
            url: "/geomet/condition/divisionWeight/excel",
            type: "post",
            dataType: "json",
            success: function (result) {
                console.log(result);
                alert("D:\\GEOMET양식\\기준정보 저장 완료되었습니다.");
            },
            error: function (xhr, status, error) {
                alert("엑셀 다운로드 중 오류가 발생했습니다. 다시 시도해주세요.");
                console.error("Error:", error);
            }
        });
    });



    
    $(".excel-import-button").on("click", function () {
        $("#fileInput").click(); 
    });

    // 파일 선택 후 업로드 처리
    $("#fileInput").on("change", function () {
        var file = this.files[0];
        if (!file) return;

        var formData = new FormData();
        formData.append("file", file);

        $.ajax({
            url: "/geomet/condition/divisionWeight/excelFileInput",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                alert("엑셀 업로드가 완료되었습니다.");
                console.log(response);
                getDataList();
            },
            error: function (xhr, status, error) {
                alert("엑셀 업로드 중 오류가 발생했습니다. 다시 시도해주세요.");
                console.error("Error:", error);
            }
        });
   
    });


    
</script>


</body>
</html>
