//잘인식하는지 먼저 콘솔 찍기
console.log("Reply Module 댓글의 자바스크립트 모듈화 파일 동작 확인!!");

var reply = (function() {
	
	function add(reply, callback, error) {
		console.log("add인식");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					console.log(reply);
					callback(result);
					}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json" ,
				function(data) {
					if (callback) { //콜백 처리된 데이터가 들어왔을 때
						callback(data.replyCnt, data.list);
					}
				}).fail(function(xhr, status, err) { //실패한다면 .fail
					if (error) { //만약 에러값이 있다면
						error();
					}
				});
	}
	

	
	function remove(rno, callback, error) {
		$.ajax({
	         // remove() 메서드는 DELETE 방식으로 데이터를 전달하므로,
	         // $.ajax()를 이용해서 구체적으로 type 속성으로 'delete'를 지정합니다.
	         // 이제, get.jsp 에서 실제 데이터베이스 댓글 번호를 이용해서 정상적으로
	         // 댓글이 삭제되는지를 소스 코딩 확인해 봅니다.
			type : 'delete',
			url : '/replies/delete/' + rno,
			contentType : "application/json",
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	
	function update(reply, callback, error) {
		console.log("RNO 댓글 번호 =" + reply.rno);
		$.ajax({
			type : 'put',
			url : '/replies/modify/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	
	function get(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	
	function displayTime(timeValue) {
		var today = new Date();
      // today.getTime() 오늘 지금 시간 - 매개변수 timeValue 시간 차이값을
      // 좌측 gap 변수에 대입해 줍니다.
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		// 24시간이 지나지 않은 댓글(시간 표시 예시 = 14:20:22)
		if (gap < (1000*60*60*24)) { // 앞서 gap 변수값이 24시간[(ms*m*24)hh = 1000*60*60*24] 보다 작다면(지나지 않았다면)
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			return [(hh > 9 ? '' : '0') + hh, ":", (mi > 9 ? '' : '0') + mi, ":", (ss > 9 ? '' : '0') + ss].join('');
			// 24시간이 지난 댓글(날짜 표시 예시 = 2022/03/22)
		}else{
			var yy = dateObj.getFullYear();
			// getMonth() is zero-based 이기 때문에 +1을 처리해 줌.
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			return [yy, '/', (mm > 9 ? '' : '0')+mm, '/', (dd>9? '':'0')+dd].join('');
		}
	};
	
	
	
	return {//add를 호출하면 function add함수가 실행한다.
		add:add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime :displayTime
		};
		
})();