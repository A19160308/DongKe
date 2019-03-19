package com.action;

public class Test {
	public static void main(String args[]){
		int index_id=123;
		String html="<td width='150'><input type='text' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew()'>提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare("+index_id+",1,$('#answer').val())'>提交</button><br><br>&nbsp&nbsp&nbsp得分：</td>";
		System.out.println(html);
	} 
}
