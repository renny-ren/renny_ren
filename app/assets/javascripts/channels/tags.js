 function modify_tag(obj){
  var new_tag = obj.innerHTML;
  var selected_tags = document.getElementById('article_tag').value
  if(document.getElementById('article_tag').value.indexOf(new_tag) > 0){
    document.getElementById('article_tag').value = document.getElementById('article_tag').value.replace('^^' + new_tag, '');
    obj.className = "tag";
  }
  else{
    document.getElementById('article_tag').value += "^^" + obj.innerHTML;
    obj.className = "selected_tag"; 
  }  
 }