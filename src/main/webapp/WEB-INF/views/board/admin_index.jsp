<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin_index</title>
</head><script src="/WEB-INF/js/jquery-3.5.1.min.js"></script>
<script>
    var path;
    $(function(){
        $('#side_menu_bar').load('admin_menubar.jsp'); 
        $('#content_section_view').load('admin_main.jsp'); 
       
//        $("#addarticle").click(function(){
//               path="admin_board_articleForm.html";
//                evn();
//            });
        
        
        
       
         
        
    });
     
//    function evn(){
//           $.ajax({
//                    type: "get",
//                    url: path,
//                    success: function(data){
//                       $("#content_section_view").html(data); 
//                    },
//                    error: function(){
//                        alert('에러');
//                    }
//                })   
//        }
       
</script>
    
<style>
    
    #container{
        width: 100%;
        margin: 0 auto;
        padding: 0;
        
    }
        #side_menu_bar{
/*            border: 1px solid red;*/
           
            float: left;
          
        }
        #content_section_view{
/*            border: 1px solid black;*/
            float: left;
        }
        
        
    </style>
<body>
   <div id='container'>
   <div id='menuandcontents'>
    <div id=side_menu_bar>
    </div>
    <div id="content_section_view">
        
    </div>
    </div>
    
    </div>
</body>
</html>