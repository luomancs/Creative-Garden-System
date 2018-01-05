/**
 * Created by Rose on 2017/5/29.
 */

var total = document.getElementById("totalnum").value; //总数目
var pageSize = 5;	//每贡显示的数目
var pages = 0;
if(total%pageSize==0){
    pages = total/pageSize;
}else{
    pages = Math.floor(total/pageSize+1);
}
document.getElementById("sumSpan").innerHTML = pages;
//默认显示笫一页
showPage(0);
//首页
function first(){
    showPage(0);
}
//上一页
function back() {
    var page = document.getElementById("pageId").value;
    var currentPage = parseInt(page) - 1;
    if (page == 0) {
        alert("己经是笫一页了！");
    } else {
        showPage(currentPage);
    }
}
//下一页
function next(){
    var page = document.getElementById("pageId").value;
    var currentPage = parseInt(page)+1;
    if(page==parseInt(pages)-1){
        alert("己经是最后一页了！");
    }else{
        showPage(currentPage);
    }
}
//末页
function last(){
    showPage(parseInt(pages)-1);
}
//隐藏全部
function hide(){
    for (var i=0; i<total; i++) {
        document.getElementById("tr_"+(i+1)).style.display="none";
    }
}
//显示当页的数据
function showPage(currentPage) {
    hide();
    var start = currentPage * pageSize;
    var end = (currentPage + 1) * pageSize;
    for (var i = start; i < end; i++) {
        if (i < total) {
            document.getElementById("tr_" + (i + 1)).style.display = "";
        }
    }
    document.getElementById("pageId").value = currentPage;
    document.getElementById("pageSpan").innerHTHL = currentPage + 1;
}