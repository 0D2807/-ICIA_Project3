<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title> 체크박스 컨트롤 </title>
    <meta name="Generator" content="EditPlus">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">

    <script type="text/javascript">
   
      /*  체크박스 컨트롤  */
      function check_action(obj, group) {

        var oBool      = obj.checked;  //선택한 체크박스 checked 값을 변수에 담는다.
        var oDiv      = document.getElementById(group);  //해당 그룹 div
        var oNodeList  = oDiv.getElementsByTagName("INPUT");  //div 안에 속해 있는 개체

        /*  해당 그룹에 있는 체크박스 모두 해제  */
        for (i = 0; i < oNodeList.length; i++)
        {
          if (oNodeList[i].type == "checkbox")
          {
            oNodeList[i].checked = false;
          }
        }
       
        /*  선택한 체크박스에 checked 적용  */
        obj.checked = oBool;

      }
   
    </script>

  </head>
  <body>
   <div id="checkbox2">
      <div id="group1">
      1<input type="checkbox" name="checkbox31" onclick="check_action(this, 'checkbox2')" value="0">&nbsp;
    </div>
    <div id="group2">
      11<input type="checkbox" name="checkbox41" onclick="check_action(this, 'group2')" value="0">&nbsp;
      12<input type="checkbox" name="checkbox42" onclick="check_action(this, 'group2')" value="0">&nbsp;
      2<input type="checkbox" name="checkbox32" onclick="check_action(this, 'checkbox2')" value="0">&nbsp;
      13<input type="checkbox" name="checkbox43" onclick="check_action(this, 'group2')" value="0">&nbsp;
    </div>
     </div>
      3<a onclick="check_action(this, 'checkbox2');">&nbsp;X</a>
  </body>
</html>