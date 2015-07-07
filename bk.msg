/**
 * 提示框简单层高
 * create_time [2015-06-26]
 * version [1.0]
 * author [JBH]
 */
if(typeof window.bk === 'undefined') {
	window.bk = {};
}
if(typeof window.bk.msg === 'undefined') {
	window.bk.msg = {};
}

(function($){
	
	"use strict";
	
	var def = {
		des : '说明'	
	};
	
	/**
	 * method alert
	 * 模拟alert
	 * msg:提示信息
	 */
	var alert = function(msg) {
		if(typeof msg === 'undefined') {
			msg = '';
		}
		swal(def.des, msg);
	};
	
	/**
	 * method success
	 * 表达状态为成功的提示
	 * title:标题
	 * msg:提示信息
	 */
	var success = function(title, msg) {
		if(typeof title === 'undefined') {
			title = '';
		}
		if(typeof msg === 'undefined') {
			msg = '';
		}
		swal(title, msg, 'success');
	};
	
	/**
	 * method error
	 * 表达状态为失败的提示
	 * title:标题
	 * msg:提示信息
	 */
	var error = function(title, msg) {
		if(typeof title === 'undefined') {
			title = '';
		}
		if(typeof msg === 'undefined') {
			msg = '';
		}
		swal(title, msg, 'error');
	};
	
	/**
	 * 模拟window.confirm
	 * title:标题
	 * msg:提示信息
	 * callback1:点击确定以后需要调用的方法
	 * callback2:当callback1回调后点击确定需要回调的方法
	 */
	var confirm = function(title, msg, callback1, callback2) {
		var func;
		var flag = false;
		if(typeof title === 'undefined') {
			title = '';
		}
		if(typeof msg === 'undefined') {
			msg = '';
		}
		if(typeof callback1 === 'function') {
			func = callback1;
		}
		if(typeof callback2 !== 'undefined') {
			flag = true;
		}
		swal({   
			title: title,   
			text: msg,   
			type: "warning",   
			showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			closeOnConfirm: false 
		}, function(isConfirm) { 
			if(isConfirm) {
				if(typeof func !== 'undefined') {
					func.call(this);
				}
				if(flag) {
					callback2();
				}else{
					swal.close();
				}
			}
		});
	};
	
	/**
	 * 和alert类似
	 * title:标题
	 * msg:提示信息
	 * callback:回调函数
	 */
	var ok = function(title, msg, callback) {
		var func;
		if(typeof title === 'undefined') {
			title = '';
		}
		if(typeof msg === 'undefined') {
			msg = '';
		}
		if(typeof callback === 'function') {
			func = callback;
		}
		swal({   
			title: title,   
			text: msg,   
			type: "success",   
			showCancelButton: false,   
			closeOnConfirm: false 
		}, function(isConfirm){ 
			if(isConfirm) {
				if(typeof func !== 'undefined') {
					func.call(this);
					swal.close();
				}
			}
		});
	};
	
	/**
	 * 提示层
	 * title:标题
	 * msg:提示信息
	 * timer:多少秒后关闭
	 */
	var tip = function(title, msg, timer) {
		if(typeof title === 'undefined') {
			title = '';
		}
		if(typeof msg === 'undefined') {
			msg = '';
		}
		if(typeof timer === 'number') {
			timer = timer;
		} else {
			timer = 2000;
		}
		swal({   
			title: title,   
			text: msg,   
			timer: timer,   
			showConfirmButton: false 
		});
	};
	
	var results = {
		alert : alert,
		success : success,
		error : error,
		confirm : confirm,
		tip : tip,
		ok : ok
	};
	
	var extend = function(target, options) {
		for(var p in options) {
			if(options.hasOwnProperty(p) && !target.hasOwnProperty(p)) {
				target[p] = options[p];
			}
		}
	};
	extend($, results);
})(bk.msg);
